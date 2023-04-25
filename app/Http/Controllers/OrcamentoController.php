<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Orcamento;
use App\Models\ItemOrcamento;
use App\Models\ConfigNota;
use App\Models\Produto;
use App\Models\ItemVenda;
use App\Models\Frete;
use App\Models\ContaReceber;
use App\Models\Venda;
use App\Models\NaturezaOperacao;
use App\Models\FaturaOrcamento;
use Dompdf\Dompdf;
use Dompdf\Options;
use App\Services\NFService;
use NFePHP\DA\NFe\Danfe;
use Mail;
use App\Helpers\StockMove;

class OrcamentoController extends Controller
{

	public function __construct(){
		$this->middleware(function ($request, $next) {
			$value = session('user_logged');
			if(!$value){
				return redirect("/login");
			}
			return $next($request);
		});
	}

	public function index(){
		$orcamentos = Orcamento::
		orderBy('id', 'desc')
		->paginate(10);

		$menos30 = $this->menos30Dias();
		$date = date('d/m/Y');
		
		return view("orcamentos/list")
		->with('orcamentos', $orcamentos)
		->with('orcamentoJs', true)
		->with('links', true)
		->with('dataInicial', $menos30)
		->with('dataFinal', $date)
		->with('title', "Lista de Orçamenos");
	}

	private function menos30Dias(){
		return date('d/m/Y', strtotime("-30 days",strtotime(str_replace("/", "-", 
			date('Y-m-d')))));
	}

	public function salvar(Request $request){
		$venda = $request->venda;
		$valorFrete = str_replace(".", "", $venda['valorFrete'] ?? 0);
		$valorFrete = str_replace(",", ".", $valorFrete );
		$vol = $venda['volume'];

		$totalVenda = str_replace(",", ".", $venda['total']);

		$desconto = 0;
		if($venda['desconto']){
			$desconto = str_replace(".", "", $venda['desconto']);
			$desconto = str_replace(",", ".", $desconto);
		}

		if($vol['pesoL']){
			$pesoLiquido = str_replace(",", ".", $vol['pesoL']);
		}else{
			$pesoLiquido = 0;
		}

		if($vol['pesoB']){
			$pesoBruto = str_replace(",", ".", $vol['pesoB']);
		}else{
			$pesoBruto = 0;
		}

		if($vol['qtdVol']){
			$qtdVol = str_replace(",", ".", $vol['qtdVol']);
		}else{
			$qtdVol = 0;
		}

		$frete = null;
		if($venda['frete'] != '9'){
			$frete = Frete::create([
				'placa' => $venda['placaVeiculo'] ?? '',
				'valor' => $valorFrete ?? 0,
				'tipo' => (int)$venda['frete'],
				'qtdVolumes' => $qtdVol?? 0,
				'uf' => $venda['ufPlaca'] ?? '',
				'numeracaoVolumes' => $vol['numeracaoVol'] ?? '0',
				'especie' => $vol['especie'] ?? '*',
				'peso_liquido' => $pesoLiquido ?? 0,
				'peso_bruto' => $pesoBruto ?? 0
			]);
		}

		$dt = date("Y-m-d");
		$result = Orcamento::create([
			'cliente_id' => $venda['cliente'],
			'transportadora_id' => $venda['transportadora'],
			'forma_pagamento' => $venda['formaPagamento'],
			'tipo_pagamento' => $venda['tipoPagamento'],
			'usuario_id' => get_id_user(),
			'valor_total' => $totalVenda,
			'desconto' => $desconto,
			'frete_id' => $frete != null ? $frete->id : null,
			'natureza_id' => $venda['naturezaOp'],
			'observacao' => $this->sanitizeString($venda['observacao']) ?? '',
			'estado' => 'NOVO',
			'email_enviado' => 0,
			'validade' => date( "Y-m-d", strtotime( "$dt +7 day" )),
			'venda_id' => 0
		]);

		$itens = $venda['itens'];
		foreach ($itens as $i) {
			ItemOrcamento::create([
				'orcamento_id' => $result->id,
				'produto_id' => (int) $i['codigo'],
				'quantidade' => (float) str_replace(",", ".", $i['quantidade']),
				'valor' => (float) str_replace(",", ".", $i['valor']),
				'observacao' => $i['obs'] ?? ''
			]);
		}

		if($venda['formaPagamento'] != 'a_vista' && $venda['formaPagamento'] != 'conta_crediario'){
			$fatura = $venda['fatura'];

			foreach ($fatura as $f) {
				$valorParcela = str_replace(",", ".", $f['valor']);

				$resultFatura = FaturaOrcamento::create([
					'orcamento_id' => $result->id,
					'vencimento' => $this->parseDate($f['data']),
					'valor' => $valorParcela
				]);
			}
		}else{
			$resultFatura = FaturaOrcamento::create([
				'orcamento_id' => $result->id,
				'vencimento' => date('Y-m-d'),
				'valor' => $totalVenda
			]);
		}

		echo json_encode($result);

	}

	private function parseDate($date, $plusDay = false){
		if($plusDay == false)
			return date('Y-m-d', strtotime(str_replace("/", "-", $date)));
		else
			return date('Y-m-d', strtotime("+1 day",strtotime(str_replace("/", "-", $date))));
	}

	function sanitizeString($str){
		return preg_replace('{\W}', ' ', preg_replace('{ +}', ' ', strtr(
			utf8_decode(html_entity_decode($str)),
			utf8_decode('ÀÁÃÂÉÊÍÓÕÔÚÜÇÑàáãâéêíóõôúüçñ'),
			'AAAAEEIOOOUUCNaaaaeeiooouucn')));
	}

	public function detalhar($id){
		$orcamento = Orcamento::
		where('id', $id)
		->first();

		$produtos = Produto::orderBy('nome')->get();

		$naturezas = NaturezaOperacao::all();

		$menos30 = $this->menos30Dias();
		$date = date('d/m/Y');

		$d1 = strtotime(date('Y-m-d'));
		$d2 = strtotime($orcamento->validade);

		$distancia = $d2 - $d1;
		
		$diasParaVencimento = $distancia/86400;

		return view("orcamentos/detalhe")
		->with('orcamento', $orcamento)
		->with('naturezas', $naturezas)
		->with('produtos', $produtos)
		->with('diasParaVencimento', $diasParaVencimento)
		->with('orcamentoJs', true)
		->with('title', "Detalhe do Orçamento $id");
	}

	public function imprimir($id){
		$orcamento = Orcamento::find($id);
		$config = ConfigNota::first();

		$p = view('orcamentos/print')
		->with('orcamento', $orcamento)
		->with('config', $config);


		$options = new Options();
		$options->set('isRemoteEnabled', true);
		$domPdf = new Dompdf($options);
		
		$contxt = stream_context_create([ 
			'ssl' => [ 
				'verify_peer' => FALSE, 
				'verify_peer_name' => FALSE,
				'allow_self_signed'=> TRUE
			] 
		]);

		// return $p;

		$domPdf->setHttpContext($contxt);
		$domPdf->loadHtml($p);

		$domPdf->setPaper("A4");
		$domPdf->render();
		$domPdf->stream("orcamento.pdf");

	}

	public function imprimirCompleto($id){
		$orcamento = Orcamento::find($id);
		$config = ConfigNota::first();

		$p = view('orcamentos/print_completo')
		->with('orcamento', $orcamento)
		->with('config', $config);


		$options = new Options();
		$options->set('isRemoteEnabled', TRUE);
		$domPdf = new Dompdf($options);
		
		$contxt = stream_context_create([ 
			'ssl' => [ 
				'verify_peer' => FALSE, 
				'verify_peer_name' => FALSE,
				'allow_self_signed'=> TRUE
			] 
		]);
		$domPdf->setHttpContext($contxt);

		$domPdf->loadHtml($p);

		$domPdf->setPaper("A4");
		$domPdf->render();
		$domPdf->stream("orcamento.pdf");

	}

	public function rederizarDanfe($id){
		$orcamento = Orcamento::find($id);
		$config = ConfigNota::first();

		$cnpj = str_replace(".", "", $config->cnpj);
		$cnpj = str_replace("/", "", $cnpj);
		$cnpj = str_replace("-", "", $cnpj);
		$cnpj = str_replace(" ", "", $cnpj);

		$nfe_service = new NFService([
			"atualizacao" => date('Y-m-d h:i:s'),
			"tpAmb" => (int)$config->ambiente,
			"razaosocial" => $config->razao_social,
			"siglaUF" => $config->UF,
			"cnpj" => $cnpj,
			"schemes" => "PL_009_V4",
			"versao" => "4.00",
			"tokenIBPT" => "AAAAAAA",
			"CSC" => $config->csc,
			"CSCid" => $config->csc_id
		]);
		$nfe = $nfe_service->simularOrcamento($orcamento);
		if(!isset($nfe['erros_xml'])){
			$xml = $nfe['xml'];

			$public = getenv('SERVIDOR_WEB') ? 'public/' : '';
			$logo = 'data://text/plain;base64,'. base64_encode(file_get_contents($public.'imgs/logo.jpg'));

			try {
				$danfe = new Danfe($xml);
				// $id = $danfe->monta();
				$pdf = $danfe->render();
				header('Content-Type: application/pdf');
				echo $pdf;
			} catch (InvalidArgumentException $e) {
				echo "Ocorreu um erro durante o processamento :" . $e->getMessage();
			}  

		}else{
			foreach($nfe['erros_xml'] as $e){
				echo $e;
			}
		}

	}

	public function enviarEmail(Request $request){
		$email = $request->email;
		$id = $request->id;


		$orcamento = Orcamento::find($id);
		$config = ConfigNota::first();

		if($email == ''){

			session()->flash("mensagem_sucesso", "Informe um email!");
			return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
		}

		$p = view('orcamentos/print')
		->with('config', $config)
		->with('orcamento', $orcamento);
		// return $p;

		$domPdf = new Dompdf(["enable_remote" => true]);
		$domPdf->loadHtml($p);


		$pdf = ob_get_clean();

		$domPdf->setPaper("A4");
		$domPdf->render();

		$public = getenv('SERVIDOR_WEB') ? 'public/' : '';

		file_put_contents($public.'orcamento/ORCAMENTO_'.$id.'.pdf', $domPdf->output());

		$value = session('user_logged');

		try{
			Mail::send('mail.orcamento_send', ['emissao' => $orcamento->created_at,
				'valor' => $orcamento->valor_total, 'usuario' => $value['nome']], function($m) use ($orcamento, $email, $pdf){

					$public = getenv('SERVIDOR_WEB') ? 'public/' : '';
					$nomeEmpresa = getenv('MAIL_NAME');
					$nomeEmpresa = str_replace("_", " ",  $nomeEmpresa);
					$nomeEmpresa = str_replace("_", " ",  $nomeEmpresa);
					$emailEnvio = getenv('MAIL_USERNAME');

					$m->from($emailEnvio, $nomeEmpresa);
					$m->subject('Envio de Oçamento ' . $orcamento->id);
					$m->attach($public.'orcamento/ORCAMENTO_'.$orcamento->id.'.pdf');
					$m->to($email);
					return response()->json("ok", 200);

				});
			if(isset($request->redirect)) {

				session()->flash("mensagem_sucesso", "Email enviado!");
				return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
			}
		}catch(\Exception $e){
			return response()->json($e->getMessage(), 401);
		}

	}

	public function deleteItem($id){
		$item = ItemOrcamento::find($id);
		$orcamento = $item->orcamento;	
		$item->delete();

		session()->flash("mensagem_sucesso", "Item removido!");

		$this->atualizarTotal($orcamento);
		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
	}

	public function addItem(Request $request){
		$orcamento = Orcamento::find($request->orcamento_id);

		$produto = explode("-", $request->produto)[0];
		$produto = produto::find($produto);

		$item = ItemOrcamento::create(
			[
				'orcamento_id' => $orcamento->id,
				'produto_id' => $produto->id,
				'quantidade' => (float) str_replace(",", ".", $request->quantidade),
				'valor' => (float) str_replace(",", ".", $request->valor)
			]
		);

		session()->flash("mensagem_sucesso", "Item adicionado!");

		$this->atualizarTotal($orcamento);
		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
	}

	private function atualizarTotal($orcamento){
		$orcamento = Orcamento::find($orcamento->id);
		$soma = 0;
		foreach($orcamento->itens as $i){
			$soma += $i->quantidade * $i->valor;
		}

		$orcamento->valor_total = $soma;
		$orcamento->save();
		$this->deleteParcelas($orcamento);
	}

	public function setValidade(Request $request){
		$orcamento = Orcamento::find($request->orcamento_id);
		
		$orcamento->validade = \Carbon\Carbon::parse(str_replace("/", "-", $request->validade))->format('Y-m-d');

		session()->flash("mensagem_sucesso", "Data de validade alterada!");
		$orcamento->save();
		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);

	}

	private function deleteParcelas($orcamento){
		foreach($orcamento->duplicatas as $dp){
			$dp->delete();
		}
	}

	public function addPag(Request $request){
		$orcamento = Orcamento::find($request->orcamento_id);
		$valor = $request->valor;

		if(!$valor){

			session()->flash("mensagem_erro", "Informe um valor para parcela!");

			return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
			die();
		}

		if($orcamento->valor_total < $orcamento->somaParcelas() + $valor){

			session()->flash("mensagem_erro", "Soma de parcelas ultrapassou o valor de produtos!");

			return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
			die();
		}

		$vencimento = \Carbon\Carbon::parse(str_replace("/", "-", $request->data))->format('Y-m-d');

		$strtotimeData = strtotime($vencimento);
		$strtotimeHoje = strtotime(date('Y-m-d'));

		$dif = $strtotimeData - $strtotimeHoje;

		if($dif < 0){

			session()->flash("mensagem_erro", "Data deve ser posterior ou igual a de hoje!");

			return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
			die();
		}

		if($orcamento->validaFatura($vencimento) == false){

			session()->flash("mensagem_erro", "Data de fatura deve seguir ordem crescente!");

			return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
			die();
		}

		$orcamento->forma_pagamento = 'personalizado';
		$orcamento->save();

		$vencimento = \Carbon\Carbon::parse(str_replace("/", "-", $request->data))->format('Y-m-d');
		$fatura = FaturaOrcamento::create([
			'valor' => $valor,
			'vencimento' => $vencimento,
			'orcamento_id' => $orcamento->id
		]);

		session()->flash("mensagem_sucesso", "Parcela adicionada!");

		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
	}

	public function deleteParcela($id){
		$parcela = FaturaOrcamento::find($id);

		$orcamento = $parcela->orcamento;	
		$parcela->delete();

		session()->flash("mensagem_sucesso", "Parcela removida!");

		$this->atualizarTotal($orcamento);
		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
	}

	public function gerarVenda(Request $request){
		$orcamento = Orcamento::find($request->orcamento_id);

		$frete = null;
		if($request->tipo_frete != '9'){

			$pesoLiquido = str_replace(",", ".", $request->pesoL);
			$pesoBruto = str_replace(",", ".", $request->pesoB);
			$qtdVol = str_replace(",", ".", $request->qtdVol);
			$numeracaoVol = str_replace(",", ".", $request->numeracaoVol);

			$arr = [
				'placa' => $request->placa ?? '',
				'valor' => $request->valor_frete ?? 0,
				'tipo' => $request->tipo_frete,
				'qtdVolumes' => $qtdVol ?? 0,
				'uf' => $request->uf_placa ?? '',
				'numeracaoVolumes' => $numeracaoVol ?? '',
				'especie' => $request->especie ?? '*',
				'peso_liquido' => $pesoLiquido ?? 0,
				'peso_bruto' => $pesoBruto ?? 0
			];

			$frete = Frete::create($arr);
		}

		$result = Venda::create([
			'cliente_id' => $orcamento->cliente_id,
			'transportadora_id' => NULL,
			'forma_pagamento' => $orcamento->forma_pagamento,
			'tipo_pagamento' => $orcamento->tipo_pagamento,
			'usuario_id' => get_id_user(),
			'valor_total' => $orcamento->valor_total,
			'desconto' => 0,
			'frete_id' => $frete != null ? $frete->id : null,
			'NfNumero' => 0,
			'natureza_id' => $request->natureza,
			'path_xml' => '',
			'chave' => '',
			'sequencia_cce' => 0,
			'observacao' => $orcamento->observacao,
			'estado' => 'DISPONIVEL',
		]);

		$stockMove = new StockMove();
		foreach ($orcamento->itens as $i) {
			ItemVenda::create([
				'venda_id' => $result->id,
				'produto_id' => $i->produto_id,
				'quantidade' => $i->quantidade,
				'valor' => $i->valor,
				'observacao' => $i->observacao
			]);
			$stockMove->downStock(
				$i->produto_id, $i->quantidade);

			$prod = Produto
			::where('id', $i->produto_id)
			->first();

			if(!empty($prod->receita)){
				//baixa por receita
				$receita = $prod->receita; 
				foreach($receita->itens as $rec){
					$stockMove->downStock(
						$rec->produto_id, 
						$i->quantidade * 
						($rec->quantidade/$receita->rendimento)
					);
				}
			}else{
				$stockMove->downStock(
					$i->produto_id, $i->quantidade);
			}
		}

		foreach ($orcamento->duplicatas as $key => $f) {

			$resultFatura = ContaReceber::create([
				'venda_id' => $result->id,
				'data_vencimento' => $f->vencimento,
				'data_recebimento' => $f->vencimento,
				'valor_integral' => $f->valor,
				'valor_recebido' => 0,
				'status' => false,
				'referencia' => "Parcela, ".($key+1).", da Venda " . $result->id,
				'categoria_id' => 2,
				'usuario_id' => get_id_user()
			]);
		}

		$orcamento->estado = 'APROVADO';
		$orcamento->venda_id = $result->id;
		$orcamento->save();

		session()->flash("mensagem_sucesso", "Venda gerada!");
		return redirect('/orcamentoVenda');
	}

	public function filtro(Request $request){
		$dataInicial = $request->data_inicial;
		$dataFinal = $request->data_final;
		$cliente = $request->cliente;
		$estado = $request->estado;
		$orcamentos = null;

		if(isset($cliente) && isset($dataInicial) && isset($dataFinal)){
			$orcamentos = Orcamento::filtroDataCliente(
				$cliente, 
				$this->parseDate($dataInicial),
				$this->parseDate($dataFinal, true),
				$estado
			);
		}else if(isset($dataInicial) && isset($dataFinal)){
			$orcamentos = Orcamento::filtroData(
				$this->parseDate($dataInicial),
				$this->parseDate($dataFinal, true),
				$estado
			);
		}else if(isset($cliente)){
			$orcamentos = Orcamento::filtroCliente(
				$cliente,
				$estado
			);

		}else{
			$orcamentos = Venda::filtroEstado(
				$estado
			);
		}

		$menos30 = $this->menos30Dias();
		$date = date('d/m/Y');

		return view("orcamentos/list")
		->with('orcamentos', $orcamentos)
		->with('orcamentoJs', true)
		->with('dataInicial', $dataInicial)
		->with('dataFinal', $dataFinal)
		->with('title', "Lista de Orçamenos");
	}

	public function reprovar($id){
		$orcamento = Orcamento::find($id);

		$orcamento->estado = 'REPROVADO';
		$orcamento->save();

		session()->flash("mensagem_erro", "Orçamento reprovado!");

		return redirect('/orcamentoVenda/detalhar/' . $orcamento->id);
	}

	public function delete($id){
		$orcamento = Orcamento::find($id);

		$orcamento->delete();

		session()->flash("mensagem_sucesso", "Orçamento removido!");

		return redirect('/orcamentoVenda');
	}

	public function relatorioItens($dataInicial, $dataFinal){

		$dI = $dataInicial;
		$dF = $dataFinal;
		$dataInicial = $this->parseDate($dataInicial);
		$dataFinal = $this->parseDate($dataFinal, true);

		$orcamentos = Orcamento::
		whereBetween('created_at', [$dataInicial, 
			$dataFinal])
		->where('estado', 'NOVO')
		->get();

		$itens = [];
		foreach($orcamentos as $o){
			foreach($o->itens as $i){
				// echo $i;
				$temp = [
					'codigo' => $i->produto->id,
					'produto' => $i->produto->nome,
					'quantidade' => $i->quantidade
				];
				$dp = $this->itemNaoInserido($temp, $itens);

				if(!$dp){
					array_push($itens, $temp);
				}else{
					for($aux = 0; $aux < sizeof($itens); $aux++){
						if($itens[$aux]['codigo'] == $temp['codigo']){
							$itens[$aux]['quantidade'] += $i->quantidade;
						}
					}
				}

			}
		}

		$p = view('relatorios/relatorio_compra_orcamento')
		->with('data_inicial', $dI)
		->with('data_final', $dF)
		->with('itens', $itens);

		// return $p;

		$domPdf = new Dompdf(["enable_remote" => true]);
		$domPdf->loadHtml($p);

		$pdf = ob_get_clean();

		$domPdf->setPaper("A4");
		$domPdf->render();
		$domPdf->stream("relatorio_compra_orcamento.pdf");
	}

	private function itemNaoInserido($item, $itens){
		foreach($itens as $i){
			if($i['codigo'] == $item['codigo']) return true;
		}
		return false;
	}

	public function find($id){
		try{
			$orcamento = Orcamento::find($id);
			foreach($orcamento->itens as $i){
				$i->produto;
			}

			return response()->json($orcamento, 200);
		}catch(\Exception $e){
			return response()->json("Erro", 401);
		}
	}

}
