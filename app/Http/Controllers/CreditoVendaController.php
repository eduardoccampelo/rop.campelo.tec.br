<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CreditoVenda;
use App\Models\Venda;
use App\Models\NaturezaOperacao;
use App\Models\ConfigNota;
use App\Models\Produto;
use App\Models\Cliente;
use App\Models\Transportadora;

class CreditoVendaController extends Controller
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
		$vendas = CreditoVenda::
		orderBy('id', 'desc')
		->paginate(20);

		$somaCareditos = $this->somaCareditos($vendas);

		return view("creditosEmVenda/list")
		->with('vendas', $vendas)
		->with('somaCareditos', $somaCareditos)
		->with('creditoVenda', true)
		->with('title', 'Vendas em Credito');
	}

	public function receber(Request $request){
		$vArr = $arr = $request->arr;
		$arr = explode(",", $arr);
		$temp = [];
		$cliente = '';
		$clienteDiferente = false;
		foreach($arr as $a){

			$credito = CreditoVenda::
			where('venda_id', (int)$a)
			->first();

			if($credito != null){
				$credito['valor'] = $credito->venda->valor_total;
				$credito['usuario'] = $credito->venda->usuario->nome;
				$credito['data'] = $credito->venda->data_registro;


				array_push($temp, $credito);
				if($cliente == ''){
					$cliente = $credito->cliente->razao_social;
				}else{
					if($cliente != $credito->cliente->razao_social){
						$clienteDiferente = true;
					}
				}
			}

		}
		
		if(sizeof($temp) == 0){
			return redirect()->back();
		}
		return view("creditosEmVenda/finalizar")
		->with('vendas', $temp)
		->with('arr', $vArr)
		->with('cliente', $cliente)
		->with('clienteDiferente', $clienteDiferente)
		->with('title', 'Receber vendas');
	}

	public function emitirNFe(Request $request){
		$arr = $request->arr;
		$arr = explode(",", $arr);
		$temp = [];

		//Agrupar itens
		$itens = [];
		foreach($arr as $a){
			$credito = CreditoVenda::
			where('venda_id', (int)$a)
			->first();

			foreach($credito->venda->itens as $i){
				$i['nome'] = $i->produto->nome;
				$i['id'] = $credito->id;
				array_push($itens, $i);
			}
		}
		
		$lastNF = Venda::lastNF();
		$naturezas = NaturezaOperacao::all();
		$transportadoras = Transportadora::all();

		$tiposPagamento = Venda::tiposPagamento();
		$config = ConfigNota::first();
		$clientes = Cliente::all();
		$produtos = Produto::all();

		return view("vendas/register")
		->with('naturezas', $naturezas)
		->with('vendaJs', true)
		->with('itens', $itens)
		->with('clientes', $clientes)
		->with('transportadoras', $transportadoras)
		->with('produtos', $produtos)
		->with('config', $config)
		->with('tiposPagamento', $tiposPagamento)
		->with('lastNF', $lastNF)
		->with('cliente', $credito->venda->cliente)
		->with('title', "Gerar NFe para vendas de crédito");
	}

	public function apenasReceber(Request $request){
		$arr = $request->arr;
		$arr = explode(",", $arr);

		foreach($arr as $a){
			$credito = CreditoVenda::
			where('venda_id', (int)$a)
			->first();

			$credito->status = true;
			$credito->save();

		}	

		session()->flash("mensagem_sucesso", "Contas recebidas com sucesso.");

		return redirect('/vendasEmCredito');
	}

	public function somaVendas($clienteId){
		$vendas = CreditoVenda::
		where('cliente_id', $clienteId)
		->where('status', false)
		->get();

		$total = 0;
		foreach($vendas as $v){
			$total += $v->venda->valor_total;
		}

		echo json_encode($total);
	}

	private function somaCareditos($vendas){
		$arrayCredito = $this->criaArrayDeCredito();
		$temp = [];
		foreach($vendas as $v){
			if(!$v->status){
				if(isset($temp['Pendente'])){
					$temp['Pendente'] += $v->venda->valor_total;
				}else{
					$temp['Pendente'] = $v->venda->valor_total;
				}
			}else{
				if(isset($temp['Recebido'])){
					$temp['Recebido'] += $v->venda->valor_total;
				}else{
					$temp['Recebido'] = $v->venda->valor_total;
				}
			}
		}

		return $temp;
	}

	private function criaArrayDeCredito(){
		$temp = [];
		array_push($temp, 'Pendente');
		array_push($temp, 'Recebido');
		
		return $temp;
	}


	public function filtro(Request $request){

		$dataInicial = $request->data_inicial;
		$dataFinal = $request->data_final;
		$cliente = $request->cliente;
		$status = $request->status;
		$vendas = null;

		if(isset($cliente) && isset($dataInicial) && isset($dataFinal)){
			$vendas = CreditoVenda::filtroDataFornecedor(
				$cliente, 
				$this->parseDate($dataInicial),
				$this->parseDate($dataFinal, true),
				$status
			);
		}else if(isset($dataInicial) && isset($dataFinal)){
			$vendas = CreditoVenda::filtroData(
				$this->parseDate($dataInicial),
				$this->parseDate($dataFinal, true),
				$status
			);
		}else if(isset($cliente)){
			$vendas = CreditoVenda::filtroFornecedor(
				$cliente,
				$status
			);
		}else{
			$vendas = CreditoVenda::filtroStatus($status);
		}

		$somaCareditos = $this->somaCareditos($vendas);

		return view("creditosEmVenda/list")
		->with('vendas', $vendas)
		->with('somaCareditos', $somaCareditos)
		->with('creditoVenda', true)
		->with('dataInicial', $dataInicial)
		->with('dataFinal', $dataFinal)
		->with('status', $status)
		->with('cliente', $cliente)
		->with('title', 'Vendas em Credito');
	}

	public function delete($id){
		$credito = CreditoVenda::
		where('id', $id)
		->delete();

		session()->flash("mensagem_sucesso", "Venda removida.");

		return redirect('/vendasEmCredito');
	}

	private function parseDate($date, $plusDay = false){
		if($plusDay == false)
			return date('Y-m-d', strtotime(str_replace("/", "-", $date)));
		else
			return date('Y-m-d', strtotime("+1 day",strtotime(str_replace("/", "-", $date))));
	}
}
