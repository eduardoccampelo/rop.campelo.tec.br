<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produto;
use App\Models\Estoque;
use App\Models\Categoria;
use App\Models\ConfigNota;
use App\Models\Tributacao;
use App\Rules\EAN13;
use App\Helpers\StockMove;
use App\Helpers\ProdutoGrade;
use App\Models\CategoriaProdutoDelivery;
use App\Models\ProdutoDelivery;
use App\Models\ProdutoListaPreco;
use App\Models\ImagensProdutoDelivery;
use App\Models\ItemDfe;
use App\Models\TelaPedido;
use App\Imports\ProdutoImport;
use App\Models\DivisaoGrade;
use App\Models\CategoriaProdutoEcommerce;
use App\Models\ProdutoEcommerce;
use App\Models\ImagemProdutoEcommerce;
use Illuminate\Support\Str;
use Dompdf\Dompdf;
use App\Exports\ProdutoExport;
use Maatwebsite\Excel\Facades\Excel;

class ProductController extends Controller
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
        $produtos = Produto::
        groupBy('referencia_grade')
        ->orderBy('nome', 'asc')
        ->paginate(15);

        $categorias = Categoria::all();

        $produtos = $this->setaEstoque($produtos);

        return view('produtos/list')
        ->with('produtos', $produtos)
        ->with('links', true)
        ->with('categorias', $categorias)
        ->with('title', 'Produtos');
    }

    private function setaEstoque($produtos){
        foreach($produtos as $p){
            $estoque = Estoque::where('produto_id', $p->id)->first();
            $p->estoque_atual = $estoque == null ? 0 : $estoque->quantidade;
        }
        return $produtos;
    }

    public function new(){
        $categoria = Categoria::first();
        if($categoria == null){
            //nao tem categoria
            session()->flash('mensagem_erro', 'Cadastre ao menos uma categoria!');
            return redirect('/categorias');
        }
        $anps = Produto::lista_ANP();
        $natureza = Produto::firstNatureza();

        if($natureza == null){

            session()->flash('mensagem_erro', 'Cadastre uma natureza de operação!');
            return redirect('/naturezaOperacao');
        }

        $categorias = Categoria::all();
        $categoriasDelivery = CategoriaProdutoDelivery::all();

        $listaCSTCSOSN = Produto::listaCSTCSOSN();
        $listaCST_PIS_COFINS = Produto::listaCST_PIS_COFINS();
        $listaCST_IPI = Produto::listaCST_IPI();
        $tributacao = Tributacao::first();

        if($tributacao == null){

            session()->flash('mensagem_erro', 'Informe a tributação padrão!');
            return redirect('tributos');
        }

        $unidadesDeMedida = Produto::unidadesMedida();
        $config = ConfigNota::first();

        $telas = TelaPedido::all();

        if($tributacao->regime == 1){
            $listaCSTCSOSN = Produto::listaCST();
        }else{
            $listaCSTCSOSN = Produto::listaCSOSN();
        }

        $categoriasEcommerce = CategoriaProdutoEcommerce::all();

        $divisoes = DivisaoGrade::
        where('sub_divisao', false)
        ->get();

        $subDivisoes = DivisaoGrade::
        where('sub_divisao', true)
        ->get();

        return view('produtos/register')
        ->with('categorias', $categorias)
        ->with('unidadesDeMedida', $unidadesDeMedida)
        ->with('categoriasEcommerce', $categoriasEcommerce)
        ->with('listaCSTCSOSN', $listaCSTCSOSN)
        ->with('listaCST_PIS_COFINS', $listaCST_PIS_COFINS)
        ->with('listaCST_IPI', $listaCST_IPI)
        ->with('anps', $anps)
        ->with('divisoes', $divisoes)
        ->with('subDivisoes', $subDivisoes)
        ->with('config', $config)
        ->with('categoriasDelivery', $categoriasDelivery)
        ->with('tributacao', $tributacao)
        ->with('natureza', $natureza)
        ->with('telas', $telas)
        ->with('produtoJs', true)
        ->with('gradeJs', true)
        ->with('contratoJs', true)
        ->with('title', 'Cadastrar Produto');
    }

    public function save(Request $request){
        $produto = new Produto();

        $anps = Produto::lista_ANP();
        $descAnp = '';

        $this->_validate($request);
        if($request->ecommerce){
            $this->_validateEcommerce($request);
        }

        if($request->atribuir_delivery){
            $this->_validateDelivery($request);
        }

        foreach($anps as $key => $a){
            if($key == $request->anp){
                $descAnp = $a;
            }
        }
        
        $request->merge([ 'composto' => $request->input('composto') ? true : false ]);
        $request->merge([ 'valor_livre' => $request->input('valor_livre') ? true : false ]);
        $request->merge([ 'gerenciar_estoque' => $request->input('gerenciar_estoque') ? true : false ]);
        $request->merge([ 'valor_venda' => str_replace(",", ".", $request->input('valor_venda'))]);
        $request->merge([ 'valor_compra' => str_replace(",", ".", $request->input('valor_compra'))]);
        $request->merge([ 'conversao_unitaria' => $request->input('conversao_unitaria') ? 
            $request->input('conversao_unitaria') : 1]);
        $request->merge([ 'codBarras' => $request->input('codBarras') ?? 'SEM GTIN']);
        $request->merge([ 'CST_CSOSN' => $request->input('CST_CSOSN') ?? '0']);
        $request->merge([ 'CST_PIS' => $request->input('CST_PIS') ?? '0']);
        $request->merge([ 'CST_COFINS' => $request->input('CST_COFINS') ?? '0']);
        $request->merge([ 'CST_IPI' => $request->input('CST_IPI') ?? '0']);
        $request->merge([ 'codigo_anp' => $request->anp != '' ? $request->anp : '']);
        $request->merge([ 'descricao_anp' => $request->anp != '' ? $descAnp : '']);
        $request->merge([ 'referencia_balanca' => $request->referencia_balanca ?? 0]);
        $request->merge([ 'perc_glp' => $request->perc_glp != '' ? __replace($request->perc_glp) : '']);
        $request->merge([ 'perc_gnn' => $request->perc_gnn != '' ? __replace($request->perc_gnn) : '']);
        $request->merge([ 'perc_gni' => $request->perc_gni != '' ? __replace($request->perc_gni) : '']);
        $request->merge([ 'valor_partida' => $request->valor_partida != '' ? __replace($request->valor_partida) : '']);
        $request->merge([ 'unidade_tributavel' => $request->unidade_tributavel != '' ? 
            $request->unidade_tributavel : '']);
        $request->merge([ 'quantidade_tributavel' => $request->quantidade_tributavel != '' ? __replace($request->quantidade_tributavel) : '']);

        $request->merge([ 'cListServ' => $request->cListServ ?? '']);
        $request->merge([ 'alerta_vencimento' => $request->alerta_vencimento ?? 0]);
        $request->merge([ 'imagem' => '' ]);
        $request->merge([ 'estoque_minimo' => $request->estoque_minimo ?? 0]);
        $request->merge([ 'referencia' => $request->referencia ?? '']);
        $request->merge([ 'tela_id' => $request->tela_id != 'null' ? $request->tela_id : NULL]);

        $request->merge([ 'cBenef' => $request->cBenef ?? '']);
        $request->merge([ 'CEST' => $request->CEST ?? '']);

        $request->merge([ 'largura' => $request->largura ?? 0]);
        $request->merge([ 'comprimento' => $request->comprimento ?? 0]);
        $request->merge([ 'altura' => $request->altura ?? 0]);
        $request->merge([ 'peso_liquido' => $request->peso_liquido ?? 0]);
        $request->merge([ 'peso_bruto' => $request->peso_bruto ?? 0]);

        $request->merge([ 'passageiros' => $request->passageiros ?? '']);
        $request->merge([ 'cor_veiculo' => $request->cor_veiculo ?? '']);
        $request->merge([ 'chassi' => $request->chassi ?? '']);
        $request->merge([ 'combustivel' => $request->combustivel ?? '']);
        $request->merge([ 'numero_motor' => $request->numero_motor ?? '']);
        $request->merge([ 'ano' => $request->ano ?? '']);
        $request->merge([ 'modelo' => $request->modelo ?? '']);

        $request->merge([ 'perc_icms_interestadual' => $request->perc_icms_interestadual ? __replace($request->perc_icms_interestadual) : 0]);
        $request->merge([ 'perc_icms_interno' => $request->perc_icms_interno ? __replace($request->perc_icms_interno) : 0]);
        $request->merge([ 'perc_fcp_interestadual' => $request->perc_fcp_interestadual ? __replace($request->perc_fcp_interestadual) : 0]);

        if(!$request->grade){

            $request->merge([ 'referencia_grade' => Str::random(20)]);
            $request->merge([ 'grade' => false ]);
            $request->merge([ 'str_grade' => '' ]);
            $result = $produto->create($request->all());
            $produto = Produto::find($result->id);
            $nomeImagem = $this->salveImagemProduto($request, $produto); 

            if($request->atribuir_delivery){
                $this->salvarProdutoNoDelivery($request, $produto, $nomeImagem); 
        // salva o produto no delivery
            }

            if($request->ecommerce){
                $this->salvarProdutoEcommerce($request, $produto, $nomeImagem);
            }

            if($result){
                session()->flash("mensagem_sucesso", "Produto cadastrado com sucesso!");
            }else{
                session()->flash('mensagem_erro', 'Erro ao cadastrar produto!');
            }

            return redirect('/produtos');
        }else{
            $produtoGrade = new ProdutoGrade();

            $nomeImagem = "";
            if($request->hasFile('file')){
                $nomeImagem = $this->salveImagemProdutoTemp($request); 
            }
            $res = $produtoGrade->salvar($request, $nomeImagem);

            if($res == "ok"){
                session()->flash("mensagem_sucesso", "Produto cadastrado como grade!");
            }else{
                session()->flash('mensagem_erro', 'Erro ao cadastrar produto, confira a grade!');
            }

            return redirect('/produtos');
        }
    }

    public function edit($id){
        $natureza = Produto::firstNatureza();
        $anps = Produto::lista_ANP();

        if($natureza == null){

            session()->flash('mensagem_erro', 'Cadastre uma natureza de operação!');
            return redirect('/naturezaOperacao');
        }

        $produto = new Produto(); 

        $listaCSTCSOSN = Produto::listaCSTCSOSN();
        $listaCST_PIS_COFINS = Produto::listaCST_PIS_COFINS();
        $listaCST_IPI = Produto::listaCST_IPI();

        $categorias = Categoria::all();
        $categoriasDelivery = CategoriaProdutoDelivery::all();

        $unidadesDeMedida = Produto::unidadesMedida();
        $config = ConfigNota::first();
        $tributacao = Tributacao::first();
        $resp = $produto
        ->where('id', $id)->first();  

        if($tributacao == null){

            session()->flash('mensagem_erro', 'Informe a tributação padrão!');
            return redirect('tributos');
        }

        if($tributacao->regime == 1){
            $listaCSTCSOSN = Produto::listaCST();
        }else{
            $listaCSTCSOSN = Produto::listaCSOSN();
        }

        $telas = TelaPedido::all();

        $divisoes = DivisaoGrade::
        where('sub_divisao', false)
        ->get();

        $subDivisoes = DivisaoGrade::
        where('sub_divisao', true)
        ->get();

        if(!$resp->grade){
            return view('produtos/register')
            ->with('produto', $resp)
            ->with('telas', $telas)
            ->with('config', $config)
            ->with('tributacao', $tributacao)
            ->with('natureza', $natureza)
            ->with('listaCSTCSOSN', $listaCSTCSOSN)
            ->with('listaCST_PIS_COFINS', $listaCST_PIS_COFINS)
            ->with('listaCST_IPI', $listaCST_IPI)
            ->with('anps', $anps)
            ->with('divisoes', $divisoes)
            ->with('subDivisoes', $subDivisoes)
            ->with('unidadesDeMedida', $unidadesDeMedida)
            ->with('categorias', $categorias)
            ->with('categoriasDelivery', $categoriasDelivery)
            ->with('produtoJs', true)
            ->with('gradeJs', true)
            ->with('title', 'Editar Produto');
        }else{
            return view('produtos/register_grade')
            ->with('produto', $resp)
            ->with('telas', $telas)
            ->with('config', $config)
            ->with('tributacao', $tributacao)
            ->with('natureza', $natureza)
            ->with('listaCSTCSOSN', $listaCSTCSOSN)
            ->with('listaCST_PIS_COFINS', $listaCST_PIS_COFINS)
            ->with('listaCST_IPI', $listaCST_IPI)
            ->with('anps', $anps)
            ->with('divisoes', $divisoes)
            ->with('subDivisoes', $subDivisoes)
            ->with('unidadesDeMedida', $unidadesDeMedida)
            ->with('categorias', $categorias)
            ->with('categoriasDelivery', $categoriasDelivery)
            ->with('produtoJs', true)
            ->with('gradeJs', true)
            ->with('title', 'Editar Produto Grade');
        }

    }

    private function salveImagemProdutoTemp($request){
        if($request->hasFile('file')){

            $public = getenv('SERVIDOR_WEB') ? 'public/' : '';
            //unlink anterior

            $file = $request->file('file');

            $extensao = $file->getClientOriginalExtension();
            $nomeImagem = md5($file->getClientOriginalName()).".".$extensao;

            $upload = $file->move(public_path('imgs_produtos'), $nomeImagem);

            return $nomeImagem;
        }else{
            return "";
        }
    }

    private function salveImagemProduto($request, $produto){
        if($request->hasFile('file')){

            $public = getenv('SERVIDOR_WEB') ? 'public/' : '';
            //unlink anterior
            if(file_exists($public.'imgs_produtos/'.$produto->imagem) && $produto->imagem != '')
                unlink($public.'imgs_produtos/'.$produto->imagem);

            $file = $request->file('file');

            $extensao = $file->getClientOriginalExtension();
            $nomeImagem = Str::random(25) . ".".$extensao;

            $upload = $file->move(public_path('imgs_produtos'), $nomeImagem);
            $produto->imagem = $nomeImagem;
            $produto->save();
            return $nomeImagem;
        }else{

        }
    }

    private function salvarProdutoEcommerce($request, $produto, $nomeImagem){
        // $this->_validateEcommerce($request);

        $produtoEcommerce = [
            'produto_id' => $produto->id,
            'categoria_id' => $request->categoria_ecommerce_id,
            'descricao' => $request->descricao,
            'controlar_estoque' => $request->input('controlar_estoque') ? true : false,
            'status' => $request->input('status') ? true : false ,
            'valor' => __replace($request->valor_ecommerce),
            'destaque' => $request->input('destaque') ? true : false
        ];

        $result = ProdutoEcommerce::create($produtoEcommerce);
        $produtoEcommerce = ProdutoEcommerce::find($result->id);
        if($result){
            $this->salveImagemProdutoEcommerce($nomeImagem, $produtoEcommerce);
        }

    }

    private function salveImagemProdutoEcommerce($nomeImagem, $produtoEcommerce){

        if($nomeImagem != ""){
            copy(public_path('imgs_produtos/').$nomeImagem, public_path('ecommerce/produtos/').$nomeImagem);
            // $upload = $file->move(public_path('ecommerce/produtos'), $nomeImagem);

            ImagemProdutoEcommerce::create(
                [
                    'produto_id' => $produtoEcommerce->id, 
                    'img' => $nomeImagem
                ]
            );

        }else{

        }
    }

    public function pesquisa(Request $request){
        $pesquisa = $request->input('pesquisa');
        $produtos = Produto::where('nome', 'LIKE', "%$pesquisa%")->get();
        $categorias = Categoria::all();
        $produtos = $this->setaEstoque($produtos);

        return view('produtos/list')
        ->with('categorias', $categorias)
        ->with('produtos', $produtos)
        ->with('title', 'Filtro Produto');
    }

    public function filtroCategoria(Request $request){
        $categoria = $request->input('categoria');
        $pesquisa = $request->input('pesquisa');

        $porCodigoBarras = is_numeric($pesquisa);

        if($porCodigoBarras == 1){
            $query = Produto::where('codBarras', $pesquisa);
        }else{
            $query = Produto::where('nome', 'LIKE', "%$pesquisa%");
        }

        if($categoria != '-'){
            $query = Produto::where('categoria_id', $categoria);
        }

        $produtos = $query->get();

        $categorias = Categoria::all();

        $categoria = Categoria::find($categoria);
        $produtos = $this->setaEstoque($produtos);

        return view('produtos/list')
        ->with('produtos', $produtos)
        ->with('categorias', $categorias)
        ->with('categoria', $categoria != null ? $categoria->nome : '')
        ->with('title', 'Filtro Produto');
    }

    public function receita($id){
        $resp = Produto::
        where('id', $id)
        ->first();  

        $produtos = Produto::all();

        return view('produtos/receita')
        ->with('produto', $resp)
        ->with('produtos', $produtos)
        ->with('produtoJs', true)
        ->with('title', 'Receita do Produto');

    }

    public function update(Request $request){

        $product = new Produto();

        $id = $request->input('id');
        $resp = $product
        ->where('id', $id)->first(); 

        $this->_validate($request);

        $anps = Produto::lista_ANP();
        $descAnp = '';
        foreach($anps as $key => $a){
            if($key == $request->anp){
                $descAnp = $a;
            }
        }

        $resp->nome = $request->input('nome');
        $resp->categoria_id = $request->input('categoria_id');
        $resp->cor = $request->input('cor');
        $resp->valor_venda = str_replace(",", ".", $request->input('valor_venda'));
        $resp->valor_compra = str_replace(",", ".", $request->input('valor_compra'));
        $resp->NCM = $request->input('NCM');
        $resp->CEST = $request->input('CEST') ?? '';

        $resp->CST_CSOSN = $request->input('CST_CSOSN');
        $resp->CST_PIS = $request->input('CST_PIS');
        $resp->CST_COFINS = $request->input('CST_COFINS');
        $resp->CST_IPI = $request->input('CST_IPI');
        // $resp->CFOP = $request->input('CFOP');
        $resp->unidade_venda = $request->input('unidade_venda');
        $resp->unidade_compra = $request->input('unidade_compra');
        $resp->conversao_unitaria = $request->conversao_unitaria;
        $resp->codBarras = $request->input('codBarras') ?? 'SEM GTIN';

        $resp->perc_icms = $request->input('perc_icms');
        $resp->perc_pis = $request->input('perc_pis');
        $resp->perc_cofins = $request->input('perc_cofins');
        $resp->perc_ipi = $request->input('perc_ipi');
        $resp->perc_iss = $request->input('perc_iss');
        $resp->cListServ = $request->input('cListServ') ?? '';
        $resp->referencia_balanca = $request->referencia_balanca;

        $resp->CFOP_saida_estadual = $request->input('CFOP_saida_estadual');
        $resp->CFOP_saida_inter_estadual = $request->input('CFOP_saida_inter_estadual');
        $resp->codigo_anp = $request->input('anp') ?? '';
        $resp->descricao_anp = $descAnp;
        
        $resp->perc_glp = $request->perc_glp ? __replace($request->perc_glp) : 0;
        $resp->perc_gnn = $request->perc_gnn ? __replace($request->perc_gnn) : 0;
        $resp->perc_gni = $request->perc_gni ? __replace($request->perc_gni) : 0;
        $resp->valor_partida = $request->valor_partida ? 
        __replace($request->valor_partida) : 0;

        $resp->quantidade_tributavel = $request->quantidade_tributavel ? 
        __replace($request->quantidade_tributavel) : 0;

        $resp->unidade_tributavel = $request->unidade_tributavel ?? '';

        $resp->alerta_vencimento = $request->alerta_vencimento;
        $resp->referencia = $request->referencia ?? '';

        $resp->pRedBC = $request->pRedBC;
        $resp->cBenef = $request->cBenef ?? '';

        $resp->composto = $request->composto ? true : false;
        $resp->valor_livre = $request->valor_livre ? true : false;
        $resp->gerenciar_estoque = $request->gerenciar_estoque ? true : false;
        $resp->estoque_minimo = $request->estoque_minimo;
        $resp->tela_id = $request->tela_id != 'null' ? $request->tela_id : NULL;

        $resp->largura = $request->largura;
        $resp->comprimento = $request->comprimento;
        $resp->altura = $request->altura;
        $resp->peso_liquido = $request->peso_liquido;
        $resp->peso_bruto = $request->peso_bruto;

        $resp->chassi = $request->chassi ?? '';
        $resp->combustivel = $request->combustivel ?? '';
        $resp->modelo = $request->modelo ?? '';
        $resp->ano = $request->ano ?? '';
        $resp->passageiros = $request->passageiros ?? '';
        $resp->cor_veiculo = $request->cor_veiculo ?? '';
        $resp->numero_motor = $request->numero_motor ?? '';

        $resp->perc_icms_interestadual = $request->perc_icms_interestadual ? __replace($request->perc_icms_interestadual) : 0;
        $resp->perc_icms_interno = $request->perc_icms_interno ? __replace($request->perc_icms_interno) : 0;
        $resp->perc_fcp_interestadual = $request->perc_fcp_interestadual ? __replace($request->perc_fcp_interestadual) : 0;
        $resp->origem = $request->origem;

        $result = $resp->save();
        $this->salveImagemProduto($request, $resp);
        if($result){
            if($request->atribuir_delivery){
                $this->updateProdutoNoDelivery($request, $resp);
            }

            session()->flash('mensagem_sucesso', 'Produto editado com sucesso!');
        }else{

            session()->flash('mensagem_erro', 'Erro ao editar produto!');
        }

        if($resp->grade){
            return redirect('/produtos/grade/'.$resp->id); 
        }
        return redirect('/produtos'); 
    }

    public function atualizarGradeCompleta(Request $request){
        $product = new Produto();

        $id = $request->input('id');
        $resp = $product
        ->where('id', $id)->first(); 

        $gradeCompleta = $product->
        where('referencia_grade', $resp->referencia_grade)
        ->get();

        $this->_validate($request);

        $anps = Produto::lista_ANP();
        $descAnp = '';
        foreach($anps as $key => $a){
            if($key == $request->anp){
                $descAnp = $a;
            }
        }

        try{
            foreach($gradeCompleta as $g){
                $resp = $g;

                $resp->nome = $request->input('nome');
                $resp->categoria_id = $request->input('categoria_id');
                $resp->cor = $request->input('cor');
                if($request->check_valor_venda){
                    $resp->valor_venda = str_replace(",", ".", $request->input('valor_venda'));
                }

                if($request->check_valor_compra){
                    $resp->valor_compra = str_replace(",", ".", $request->input('valor_compra'));
                }

                $resp->NCM = $request->input('NCM');
                $resp->CEST = $request->input('CEST') ?? '';

                $resp->CST_CSOSN = $request->input('CST_CSOSN');
                $resp->CST_PIS = $request->input('CST_PIS');
                $resp->CST_COFINS = $request->input('CST_COFINS');
                $resp->CST_IPI = $request->input('CST_IPI');
        // $resp->CFOP = $request->input('CFOP');
                $resp->unidade_venda = $request->input('unidade_venda');
                $resp->unidade_compra = $request->input('unidade_compra');
                $resp->conversao_unitaria = $request->conversao_unitaria;
                $resp->codBarras = $request->input('codBarras') ?? 'SEM GTIN';

                $resp->perc_icms = $request->input('perc_icms');
                $resp->perc_pis = $request->input('perc_pis');
                $resp->perc_cofins = $request->input('perc_cofins');
                $resp->perc_ipi = $request->input('perc_ipi');
                $resp->perc_iss = $request->input('perc_iss');
                $resp->cListServ = $request->input('cListServ') ?? '';

                $resp->CFOP_saida_estadual = $request->input('CFOP_saida_estadual');
                $resp->CFOP_saida_inter_estadual = $request->input('CFOP_saida_inter_estadual');
                $resp->codigo_anp = $request->input('anp') ?? '';
                $resp->descricao_anp = $descAnp;
                $resp->alerta_vencimento = $request->alerta_vencimento;
                $resp->referencia = $request->referencia ?? '';

                $resp->pRedBC = $request->pRedBC;
                $resp->cBenef = $request->cBenef ?? '';

                $resp->composto = $request->composto ? true : false;
                $resp->valor_livre = $request->valor_livre ? true : false;
                $resp->gerenciar_estoque = $request->gerenciar_estoque ? true : false;
                $resp->estoque_minimo = $request->estoque_minimo;
                $resp->tela_id = $request->tela_id != 'null' ? $request->tela_id : NULL;

                $resp->largura = $request->largura;
                $resp->comprimento = $request->comprimento;
                $resp->altura = $request->altura;
                $resp->peso_liquido = $request->peso_liquido;
                $resp->peso_bruto = $request->peso_bruto;

                if($request->hasFile('file')){
                    $nomeImagem = $this->salveImagemProdutoTemp($request); 
                    $resp->imagem = $nomeImagem;
                }

                $result = $resp->save();

            }
            session()->flash('mensagem_sucesso', 'Grade alterada!');
        }catch(\Exception $e){
            session()->flash('mensagem_erro', 'Erro ao editar ' . $e->getMessage());

        }
        return redirect('/produtos');
    }

    public function grade($id){
        $produto = Produto::find($id);
        $produtos = Produto::produtosDaGrade($produto->referencia_grade);

        $produtos = $this->setaEstoqueGrade($produtos);
        return view('produtos/grade')
        ->with('produtos', $produtos)
        ->with('title', 'Grade');
    }

    private function setaEstoqueGrade($produtos){
        foreach($produtos as $p){
            $estoque = Estoque::where('produto_id', $p->id)->first();
            $p->estoque_atual = $estoque == null ? 0 : $estoque->quantidade;
        }
        return $produtos;
    }

    public function delete($id){
        try{
            $produto = Produto
            ::where('id', $id)
            ->first();
            $public = getenv('SERVIDOR_WEB') ? 'public/' : '';


            if(file_exists($public.'imgs_produtos/'.$produto->imagem) && $produto->imagem != '')
                unlink($public.'imgs_produtos/'.$produto->imagem);

            $delete = $produto->delete();

            if($delete){
                session()->flash('mensagem_sucesso', 'Registro removido!');
            }else{

                session()->flash('mensagem_erro', 'Erro!');
            }
            return redirect('/produtos');
        }catch(\Exception $e){
            return view('errors.sql')
            ->with('title', 'Erro ao deletar produto')
            ->with('motivo', 'Não é possivel remover produtos, presentes vendas, compras ou pedidos!');
        }
    }

    private function _validate(Request $request){
        $rules = [
            'nome' => 'required|max:100',
            'valor_venda' => 'required',
            'valor_compra' => 'required',
            'NCM' => 'required|min:10',
            'perc_icms' => 'required',
            'perc_pis' => 'required',
            'perc_cofins' => 'required',
            'perc_ipi' => 'required',
            'codBarras' => [new EAN13],
            'CFOP_saida_estadual' => 'required',
            'CFOP_saida_inter_estadual' => 'required',
            'file' => 'max:700',
            // 'CEST' => 'required'
        ];

        $messages = [
            'nome.required' => 'O campo nome é obrigatório.',
            'NCM.required' => 'O campo NCM é obrigatório.',
            'NCM.min' => 'NCM precisa de 8 digitos.',
            // 'CFOP.required' => 'O campo CFOP é obrigatório.',
            'CEST.required' => 'O campo CEST é obrigatório.',
            'valor_venda.required' => 'O campo valor de venda é obrigatório.',
            'valor_compra.required' => 'O campo valor de compra é obrigatório.',
            'nome.max' => '100 caracteres maximos permitidos.',
            'perc_icms.required' => 'O campo %ICMS é obrigatório.',
            'perc_pis.required' => 'O campo %PIS é obrigatório.',
            'perc_cofins.required' => 'O campo %COFINS é obrigatório.',
            'perc_ipi.required' => 'O campo %IPI é obrigatório.',
            'CFOP_saida_estadual.required' => 'Campo obrigatório.',
            'CFOP_saida_inter_estadual.required' => 'Campo obrigatório.',
            'file.max' => 'Arquivo muito grande maximo 300 Kb'

        ];
        $this->validate($request, $rules, $messages);
    }

    private function _validateEcommerce(Request $request){

        if($request->ecommerce){
            $rules = [
                'valor_ecommerce' => 'required',
                'categoria_ecommerce_id' => 'required',
                'descricao' => 'required|min:20',
                'valor_ecommerce' => 'required',
                'largura' => 'required',
                'altura' => 'required',
                'comprimento' => 'required',
                'peso_liquido' => 'required',
                'peso_bruto' => 'required'
            ];
        }else{
            $rules = [];
        }

        $messages = [

            'valor_ecommerce.required' => 'O campo valor é obrigatório.',
            'categoria_ecommerce_id.required' => 'O campo categoria é obrigatório.',
            'descricao.required' => 'O campo descricao é obrigatório.',
            'descricao.min' => 'Minimo de 20 caracteres',

            'valor.required' => 'O campo valor é obrigatório.',

            'valor_ecommerce.required' => 'O campo valor é obrigatório.',
            'largura.required' => 'O campo largura é obrigatório.',
            'altura.required' => 'O campo altura é obrigatório.',
            'comprimento.required' => 'O campo comprimento é obrigatório.',
            'peso_liquido.required' => 'O campo peso liquido é obrigatório.',
            'peso_bruto.required' => 'O campo peso bruto é obrigatório.',

        ];

        $this->validate($request, $rules, $messages);
    }

    public function all(){
        $products = Produto::all();
        $arr = array();
        foreach($products as $p){
            $arr[$p->id. ' - ' .$p->nome . ($p->cor != '--' ? ' | COR: ' . $p->cor : '') . ($p->referencia != '' ? ' | REF: ' . $p->referencia : '')] = null;
                //array_push($arr, $temp);
        }
        echo json_encode($arr);
    }

    public function getUnidadesMedida(){
        $unidades = Produto::unidadesMedida();
        echo json_encode($unidades);
    }

    public function composto(){
        $products = Produto::
        where('composto', true)
        ->get();
        $arr = array();
        foreach($products as $p){
            $arr[$p->id. ' - ' .$p->nome . ($p->cor != '--' ? ' | Cor: ' . $p->cor : '') . ($p->referencia != '' ? ' | REF: ' . $p->referencia : '')] = null;
                //array_push($arr, $temp);
        }
        echo json_encode($arr);
    }

    public function naoComposto(){
        $products = Produto::
        where('composto', false)
        ->get();
        $arr = array();
        foreach($products as $p){
            $arr[$p->id. ' - ' .$p->nome . ($p->cor != '--' ? ' | Cor: ' . $p->cor : '') . ($p->referencia != '' ? ' | REF: ' . $p->referencia : '')] = null;
                //array_push($arr, $temp);
        }
        echo json_encode($arr);
    }

    public function getValue(Request $request){
        $id = $request->input('id');
        $product = Product::
        where('id', $id)
        ->first();
        echo json_encode($product->value_sale);
    }

    public function getProduto($id){
        $produto = Produto::
        where('id', $id)
        ->first();
        if($produto->delivery){
            foreach($produto->delivery->pizza as $tp){
                $tp->tamanho;
            }
        }
        echo json_encode($produto);
    }

    public function getProdutoBalanca($ref){
        $produto = Produto::
        where('referencia_balanca', $ref)
        ->first();

        echo json_encode($produto);
    }

    public function getProdutoVenda($id, $listaId){
        $produto = Produto::
        where('id', $id)
        ->first();
        if($produto->delivery){
            foreach($produto->delivery->pizza as $tp){
                $tp->tamanho;
            }
        }

        if($listaId > 0){
            $lista = ProdutoListaPreco::
            where('lista_id', $listaId)
            ->where('produto_id', $produto->id)
            ->first();

            if($lista->valor > 0){
                $produto->valor_venda = (string) $lista->valor;
            }
        }

        $estoque = Estoque::where('produto_id', $id)->first();
        $produto->estoque_atual = $estoque != null ? $estoque->quantidade : 0; 
        echo json_encode($produto);
    }

    public function getProdutoCodBarras($cod){
        $produto = Produto::
        where('codBarras', $cod)
        ->first();

        echo json_encode($produto);
    }

    public function salvarProdutoDaNota(Request $request){
        //echo json_encode($request->produto);
        $produto = $request->produto;
        $natureza = Produto::firstNatureza();

        $valorVenda = str_replace(".", "", $produto['valorVenda']);
        $valorVenda = str_replace(",", ".", $valorVenda);

        $valorCompra = $produto['valorCompra'];

        $result = Produto::create([
            'nome' => $produto['nome'],
            'NCM' => $produto['ncm'],
            'valor_venda' => $valorVenda,
            'valor_compra' => $produto['valorCompra'],
            'valor_livre' => false,
            'cor' => $produto['cor'],
            'conversao_unitaria' => (int) $produto['conversao_unitaria'],
            'categoria_id' => $produto['categoria_id'],
            'unidade_compra' => $produto['unidadeCompra'],
            'unidade_venda' => $produto['unidadeVenda'],
            'codBarras' => $produto['codBarras'] ?? 'SEM GTIN',
            'composto' => false,
            'CST_CSOSN' => $produto['CST_CSOSN'],
            'CST_PIS' => $produto['CST_PIS'],
            'CST_COFINS' => $produto['CST_COFINS'],        
            'CST_IPI' => $produto['CST_IPI'],
            'perc_icms' => $produto['perc_icms'],
            'perc_pis' => $produto['perc_pis'],
            'perc_cofins' => $produto['perc_cofins'],
            'perc_ipi' => $produto['perc_ipi'],
            'CFOP_saida_estadual' => $natureza->CFOP_saida_estadual,
            'CFOP_saida_inter_estadual' => $natureza->CFOP_saida_inter_estadual,
            'codigo_anp' => '', 
            'descricao_anp' => '',
            'cListServ' => '',
            'imagem' => '',
            'alerta_vencimento' => 0,
            'referencia' => $produto['referencia'] ?? '',
            'gerenciar_estoque' => 0

        ]);

        echo json_encode($result);  
    }

    public function salvarProdutoDaNotaComEstoque(Request $request){
        //echo json_encode($request->produto);
        $produto = $request->produto;
        $natureza = Produto::firstNatureza();
        $valorVenda = str_replace(",", ".", $produto['valorVenda']);

        $valorCompra = $produto['valorCompra'];

        $result = Produto::create([
            'nome' => $produto['nome'],
            'NCM' => $produto['ncm'],
            'valor_venda' => $valorVenda,
            'valor_compra' => $valorCompra,
            'valor_livre' => false,
            'cor' => $produto['cor'],
            'conversao_unitaria' => (int) $produto['conversao_unitaria'],
            'categoria_id' => $produto['categoria_id'],
            'unidade_compra' => $produto['unidadeCompra'],
            'unidade_venda' => $produto['unidadeVenda'],
            'codBarras' => $produto['codBarras'] ?? 'SEM GTIN',
            'composto' => false,
            'CST_CSOSN' => $produto['CST_CSOSN'],
            'CST_PIS' => $produto['CST_PIS'],
            'CST_COFINS' => $produto['CST_COFINS'],        
            'CST_IPI' => $produto['CST_IPI'],
            'perc_icms' => 0,
            'perc_pis' => 0,
            'perc_cofins' => 0,
            'perc_ipi' => 0,
            'CFOP_saida_estadual' => $natureza->CFOP_saida_estadual,
            'CFOP_saida_inter_estadual' => $natureza->CFOP_saida_inter_estadual,
            'codigo_anp' => '', 
            'descricao_anp' => '',
            'cListServ' => '',
            'imagem' => '',
            'alerta_vencimento' => 0,
            'referencia' => $produto['referencia'],
            'gerenciar_estoque' => 0

        ]);

        ItemDfe::create(
            [
                'numero_nfe' => $produto['numero_nfe'],
                'produto_id' => $result->id
            ]
        );

        $stockMove = new StockMove();
        $stockMove->pluStock($result->id, $produto['quantidade'], $valorCompra);

        echo json_encode($result);  
    }

    public function setEstoque(Request $request){
        $stockMove = new StockMove();
        $stockMove->pluStock($request->produto, $request->quantidade, $request->valor);

        ItemDfe::create(
            [
                'numero_nfe' => $request->numero_nfe,
                'produto_id' => $request->produto
            ]
        );


        echo json_encode("ok");  
    }

    private function salvarProdutoNoDelivery($request, $produto, $nomeImagem){
        $this->_validateDelivery($request);

        $categoria = CategoriaProdutoDelivery::
        where('id', $request->categoria_delivery_id)
        ->first();

        $valor = 0;
        if(strpos($categoria->nome, 'izza') !== false){
            //pizza nao seta valor por aqui
        }else{
            $valor = str_replace(",", ".", $request->valor_venda);
        }

        $produtoDelivery = [
            'status' => 1 ,
            'produto_id' => $produto->id,
            'destaque' => $request->input('destaque') ? true : false,
            'descricao' => $request->descricao ?? '',
            'ingredientes' => $request->ingredientes ?? '',
            'limite_diario' => $request->limite_diario,
            'categoria_id' => $categoria->id,
            'valor' => $valor,
            'valor_anterior' => 0
        ];

        $result = ProdutoDelivery::create($produtoDelivery);
        $produtoDelivery = ProdutoDelivery::find($result->id);
        if($result){
            $this->salveImagemProdutoDelivery($request, $produtoDelivery, $nomeImagem);
        }

    }

    private function updateProdutoNoDelivery($request, $produto){
        // $this->_validateDelivery($request);
        $produtoDelivery = $produto->delivery;
        if($produtoDelivery){
            $catPizza = false;
            $categoria = CategoriaProdutoDelivery::
            where('id', $request->categoria_delivery_id)
            ->first();

            $valor = 0;
            if($categoria && strpos($categoria->nome, 'izza') !== false){

            }else{
                $valor = str_replace(",", ".", $request->valor_venda);
            }

            $produtoDelivery->destaque = $request->input('destaque') ? true : false;
            $produtoDelivery->descricao = $request->input('descricao') ?? $produtoDelivery->descricao;
            $produtoDelivery->ingredientes = $request->input('ingredientes') ?? $produtoDelivery->ingredientes;
            $produtoDelivery->limite_diario = $request->input('limite_diario') ?? $produtoDelivery->limite_diario;
            $produtoDelivery->categoria_id = $request->input('categoria_delivery_id') ?? $produtoDelivery->categoria_delivery_id;
            $produtoDelivery->valor = $request->input('valor') ?? $valor;

            $result = $produtoDelivery->save();

            if($result){
                $this->salveImagemProdutoDelivery($request, $produtoDelivery, "");
            }
        }else{
            $this->salvarProdutoNoDelivery($request, $produto);
        }

    }

    private function _validateDelivery(Request $request){
        $rules = [
            'ingredientes' => 'max:255',
            'descricao' => 'max:255',
            'limite_diario' => 'required',
            'categoria_delivery_id' => 'required'
        ];

        $messages = [
            'ingredientes.required' => 'O campo ingredientes é obrigatório.',
            'ingredientes.max' => '255 caracteres maximos permitidos.',
            'descricao.required' => 'O campo descricao é obrigatório.',
            'descricao.max' => '255 caracteres maximos permitidos.',
            'limite_diario.required' => 'O campo limite diário é obrigatório',
            'categoria_delivery_id.required' => 'O campo categoria é obrigatório'
        ];

        $this->validate($request, $rules, $messages);
    }

    private function salveImagemProdutoDelivery($request, $produtoDelivery, $nomeImagem){
        if($request->hasFile('file')){
            $public = getenv('SERVIDOR_WEB') ? 'public/' : '';

            $file = $request->file('file');

            $extensao = $file->getClientOriginalExtension();
            if($nomeImagem == ""){
                $nomeImagem = md5($file->getClientOriginalName()).".".$extensao;
            }

            // $upload = $file->move(public_path('imagens_produtos'), $nomeImagem);
            // if(file_exists($public.'imgs_produtos/'.$nomeImagem)){
            copy($public.'imgs_produtos/'.$nomeImagem, $public.'imagens_produtos/'.$nomeImagem);
            // }else{
            //     $file->move(public_path('imagens_produtos'), $nomeImagem);
            // }

            if(sizeof($produtoDelivery->galeria) == 0){
                //cadastrar
                ImagensProdutoDelivery::create(
                    [
                        'produto_id' => $produtoDelivery->id,
                        'path' => $nomeImagem
                    ]
                );
            }else{
                //ja tem
                $galeria = $produtoDelivery->galeria[0];
                $galeria->path = $nomeImagem;
                $galeria->save();
            }

        }else{

        }
    }

    public function relatorioCompra($id){
        $produto = Produto::find($id);
        $p = view('produtos/relatorio_compras')
        ->with('produto', $produto);

        if(sizeof($produto->emCompras) == 0){
            session()->flash('mensagem_erro', 'Produto sem nenhuma compra!!');
            return redirect()->back();
        }

        $domPdf = new Dompdf(["enable_remote" => true]);
        $domPdf->loadHtml($p);

        $pdf = ob_get_clean();

        $domPdf->setPaper("A4", "landscape");
        $domPdf->render();
        $domPdf->stream("relatorio compra $p->nome.pdf");
    }

    public function editGrade($id){
        $natureza = Produto::firstNatureza();
        $anps = Produto::lista_ANP();

        if($natureza == null){

            session()->flash('mensagem_erro', 'Cadastre uma natureza de operação!');
            return redirect('/naturezaOperacao');
        }

        $produto = new Produto(); 

        $listaCSTCSOSN = Produto::listaCSTCSOSN();
        $listaCST_PIS_COFINS = Produto::listaCST_PIS_COFINS();
        $listaCST_IPI = Produto::listaCST_IPI();

        $categorias = Categoria::all();
        $categoriasDelivery = CategoriaProdutoDelivery::all();

        $unidadesDeMedida = Produto::unidadesMedida();
        $config = ConfigNota::first();
        $tributacao = Tributacao::first();
        $resp = $produto
        ->where('id', $id)->first();  

        if($tributacao == null){

            session()->flash('mensagem_erro', 'Informe a tributação padrão!');
            return redirect('tributos');
        }

        if($tributacao->regime == 1){
            $listaCSTCSOSN = Produto::listaCST();
        }else{
            $listaCSTCSOSN = Produto::listaCSOSN();
        }

        $telas = TelaPedido::all();

        $divisoes = DivisaoGrade::
        where('sub_divisao', false)
        ->get();

        $subDivisoes = DivisaoGrade::
        where('sub_divisao', true)
        ->get();


        return view('produtos/register')
        ->with('produto', $resp)
        ->with('telas', $telas)
        ->with('config', $config)
        ->with('tributacao', $tributacao)
        ->with('natureza', $natureza)
        ->with('listaCSTCSOSN', $listaCSTCSOSN)
        ->with('listaCST_PIS_COFINS', $listaCST_PIS_COFINS)
        ->with('listaCST_IPI', $listaCST_IPI)
        ->with('anps', $anps)
        ->with('divisoes', $divisoes)
        ->with('subDivisoes', $subDivisoes)
        ->with('unidadesDeMedida', $unidadesDeMedida)
        ->with('categorias', $categorias)
        ->with('categoriasDelivery', $categoriasDelivery)
        ->with('produtoJs', true)
        ->with('gradeJs', true)
        ->with('title', 'Editar Produto');

    }

    public function importacao(){
        $zip_loaded = extension_loaded('zip') ? true : false;
        if ($zip_loaded === false) {
            session()->flash('mensagem_erro', "Por favor instale/habilite o PHP zip para importar");
            return redirect()->back();
        }
        $categoria = Categoria::first();
        if($categoria == null){
            session()->flash('mensagem_erro', 'Cadastre uma categoria!!');
            return redirect('/categorias');
        }

        $config = ConfigNota::first();
        if($config == null){
            session()->flash('mensagem_erro', 'Cadastre o emitente!!');
            return redirect('/configNF');
        }

        $trib = Tributacao::first();
        if($trib == null){
            session()->flash('mensagem_erro', 'Cadastre uma tributação padrão!!');
            return redirect('/tributos');
        }
        return view('produtos/importacao')
        ->with('title', 'Importação de produto');
    }

    public function downloadModelo(){
        try{
            $public = getenv('SERVIDOR_WEB') ? 'public/' : '';
            return response()->download($public.'files/import_products_csv_template.xlsx');
        }catch(\Exception $e){
            echo $e->getMessage();
        }
    }

    public function importacaoStore(Request $request){
        if ($request->hasFile('file')) {
            ini_set('max_execution_time', 0);
            ini_set('memory_limit', -1);

            $rows = Excel::toArray(new ProdutoImport, $request->file);

            $retornoErro = $this->validaArquivo($rows);

            if($retornoErro == ""){
                //armazenar no bd

                $teste = [];
                $tributacao = Tributacao::first();
                $config = ConfigNota::first();
                $categoria = Categoria::first();

                $cont = 0;

                foreach($rows as $row){
                    foreach($row as $key => $r){
                        if($r[0] != 'NOME*'){
                            try{
                                $objeto = $this->preparaObjeto($r, $tributacao, $config, $categoria->id);

                                if($objeto['categoria'] != ''){
                                    $cat = Categoria::where('nome', $objeto['categoria'])
                                    ->first();

                                    if($cat == null){

                                        $cat = Categoria::create(
                                            [
                                                'nome' => $objeto['categoria'],
                                            ]
                                        );
                                        $objeto['categoria_id'] = $cat->id;
                                    }else{
                                        $objeto['categoria_id'] = $cat->id;
                                    }
                                }else{
                                    $objeto['categoria_id'] = $categoria->id;
                                }

                                $prod = Produto::create($objeto);

                                if($objeto['estoque'] > 0){
                                    $stockMove = new StockMove();
                                    $result = $stockMove->pluStock($prod->id, 
                                        $objeto['estoque'], str_replace(",", ".", $prod->valor_venda));
                                }

                                $cont++;

                            }catch(\Exception $e){
                                echo $e->getMessage();
                                die;
                                session()->flash('mensagem_erro', $e->getMessage());
                                return redirect()->back();
                            }
                        }
                    }
                }

                session()->flash('mensagem_sucesso', "Produtos inseridos: $cont!!");
                return redirect('/produtos');

            }else{
                session()->flash('mensagem_erro', $retornoErro);
                return redirect()->back();
            }

        }else{
            session()->flash('mensagem_erro', 'Nenhum Arquivo!!');
            return redirect()->back();
        }

    }

    private function validaArquivo($rows){
        $cont = 0;
        $msgErro = "";
        foreach($rows as $row){
            foreach($row as $key => $r){

                $nome = $r[0];
                $valorVenda = $r[3];
                $valorCompra = $r[4];

                if(strlen($nome) == 0){
                    $msgErro .= "Coluna nome em branco na linha: $cont | "; 
                }

                if(strlen($valorVenda) == 0){
                    $msgErro .= "Coluna valor venda em branco na linha: $cont | "; 
                }

                if(strlen($valorCompra) == 0){
                    $msgErro .= "Coluna valor compra em branco na linha: $cont"; 
                }

                if($msgErro != ""){
                    return $msgErro;
                }
                $cont++;
            }
        }

        return $msgErro;
    }

    private function preparaObjeto($r, $tributacao, $config, $categoria){

        $arr = [
            'nome' => $r[0],
            'categoria' => $r[2],
            'cor' => $r[1] ?? '',
            'valor_venda' => __replace($r[3]),
            'NCM' => $r[5] != "" ? $r[5] : $tributacao->ncm_padrao,
            'CEST' => $r[7] ?? '',
            'CST_CSOSN' => $r[8] != "" ? $this->validaNumero($r[8]) : $config->CST_CSOSN_padrao,
            'CST_PIS' => $r[9] != "" ? $this->validaNumero($r[9]) : $config->CST_PIS_padrao, 
            'CST_COFINS' => $r[10] != "" ? $this->validaNumero($r[10]) : $config->CST_COFINS_padrao,
            'CST_IPI' => $r[11] != "" ? $r[11] : $config->CST_IPI_padrao,
            'unidade_compra' => $r[12] != "" ? $r[12] : 'UN',
            'unidade_venda' => $r[13] != "" ? $r[13] : 'UN',
            'composto' => $r[15] != "" ? $r[15] : 0,
            'codBarras' => $r[6] != "" ? $r[6] : 'SEM GTIN', 
            'conversao_unitaria' => $r[14] != "" ? $r[14] : 1,
            'valor_livre' => $r[16] != "" ? $r[16] : 0,
            'perc_icms' => $r[17] != "" ? $r[17] : $tributacao->icms,
            'perc_pis' => $r[18] != "" ? $r[18] : $tributacao->pis,
            'perc_cofins' => $r[19] != "" ? $r[19] : $tributacao->cofins,
            'perc_ipi' => $r[20] != "" ? $r[20] : $tributacao->ipi,
            'CFOP_saida_estadual' => $r[22] != "" ? $r[22] : '5101',
            'CFOP_saida_inter_estadual' => $r[23] != "" ? $r[23] : '6101',
            'codigo_anp' => $r[24] ??'',
            'descricao_anp' => $r[25]?? '',
            'perc_iss' => $r[21] ?? 0,
            'cListServ' => '',
            'imagem' => '',
            'alerta_vencimento' => $r[26] != "" ? $r[26] : 0,
            'valor_compra' => __replace($r[4]),
            'gerenciar_estoque' => $r[27] != "" ? $r[27] : 0,
            'estoque_minimo' => 0,
            'referencia' => $r[21] ?? '',
            'largura' => $r[22] != "" ? $r[22] : 0,
            'comprimento' => $r[23] != "" ? $r[23] : 0,
            'altura' => $r[24] != "" ? $r[24] : 0,
            'peso_liquido' => $r[25] != "" ? $r[25] : 0,
            'peso_bruto' => $r[26] != "" ? $r[26] : 0,
            
            'percentual_lucro' => 0,
            'CST_CSOSN_EXP' => '', 
            'referencia_grade' => Str::random(20),
            'grade' => 0,
            'str_grade' => 0,
            'perc_glp' => 0,
            'perc_gnn' => 0,
            'perc_gni' => 0,
            'valor_partida' => 0,
            'unidade_tributavel' => '',
            'quantidade_tributavel' => 0,
            'perc_icms_interestadual' => 0,
            'perc_icms_interno' => 0,
            'perc_fcp_interestadual' => 0,
            'inativo' => 0,
            'estoque' => $r[27] != "" ? $r[27] : 0,
        ];

        return $arr;
    }

    private function validaNumero($numero){
        if(strlen($numero) == 1){
            return "0".$numero;
        }
        return $numero;
    }

    public function exportacao(){
        $produtos = Produto::all();
        $relatorioEx = new ProdutoExport($produtos);
        return Excel::download($relatorioEx, 'produtos.xlsx');
    }

    public function autocomplete(Request $request){
        try{
            $produtos = Produto::
            where('nome', 'LIKE', "%$request->pesquisa%")
            ->get();

            $refs = Produto::
            where('referencia', 'LIKE', "%$request->pesquisa%")
            ->get();

            // array_push($produtos, $refs);
            $temp = [];
            foreach($produtos as $p){
                $p->listaPreco;
                $p->estoqueAtual = $p->estoqueAtual();
                array_push($temp, $p);
            }

            foreach($refs as $p){
                $p->listaPreco;
                $p->estoqueAtual = $p->estoqueAtual();
                array_push($temp, $p);
            }


            return response()->json($temp, 200);

        }catch(\Exception $e){
            return response($e->getMessage(), 401);
        }
    }

    public function autocompleteProduto(Request $request){

        if($request->lista_id == 0){
            $produto = Produto::
            where('id', $request->id)
            ->first();

            $produto->estoqueAtual = $produto->estoqueAtual();
            return response($produto, 200);
        }else{
            $produtoListaPreco = ProdutoListaPreco::
            where('produto_id', $request->id)
            ->where('lista_id', $request->lista_id)
            ->first();

            $produto = $produtoListaPreco->produto;
            $produto->estoqueAtual = $produto->estoqueAtual();
            $produto->valor_venda = $produtoListaPreco->valor;
            return response($produto, 200);

        }

    }

}
