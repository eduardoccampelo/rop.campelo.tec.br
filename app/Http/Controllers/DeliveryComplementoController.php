<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ComplementoDelivery;
use App\Models\CategoriaAdicional;
use App\Models\ProdutoDelivery;
use App\Models\ListaComplementoDelivery;

class DeliveryComplementoController extends Controller
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
		$complementos = ComplementoDelivery::all();
		return view('complementoDelivery/list')
		->with('complementos', $complementos)
		->with('title', 'Adicional de produto para Delivery');
	}

	public function new(){

        $categorias = CategoriaAdicional::all();
        return view('complementoDelivery/register')
        ->with('categorias', $categorias)
        ->with('title', 'Cadastrar Adicional para Delivery');
    }

    public function save(Request $request){

        $complemento = new ComplementoDelivery();

        $this->_validate($request);

        $request->merge([ 'valor' => str_replace(",", ".", $request->valor) ]);

        $result = $complemento->create($request->all());
        if($result){
            session()->flash("mensagem_sucesso", "Adicional cadastrado com sucesso.");
        }else{
            session()->flash('mensagem_erro', 'Erro ao cadastrar adicional.');
        }

        return redirect('/deliveryComplemento');
    }

    public function edit($id){
        $complemento = new ComplementoDelivery(); //Model

        $resp = $complemento
        ->where('id', $id)->first();  

        $categorias = CategoriaAdicional::all();

        return view('complementoDelivery/register')
        ->with('categorias', $categorias)
        ->with('complemento', $resp)
        ->with('title', 'Editar Complemento para Delivery');

    }

    public function update(Request $request){
    	$complemento = new ComplementoDelivery();

    	$id = $request->input('id');
    	$resp = $complemento
    	->where('id', $id)->first(); 

    	
    	$this->_validate($request, false);

        $resp->nome = $request->input('nome');
        $resp->categoria_id = $request->input('categoria_id');
        $resp->valor = str_replace(",", ".", $request->input('valor'));

        $result = $resp->save();
        if($result){
            session()->flash('mensagem_sucesso', 'Adicional editado com sucesso!');
        }else{
            session()->flash('mensagem_erro', 'Erro ao editar adicional!');
        }

        return redirect('/deliveryComplemento'); 
    }

    public function delete($id){
        $complemento = ComplementoDelivery
        ::where('id', $id)
        ->first();

        if($complemento->delete()){

            session()->flash('mensagem_sucesso', 'Registro removido!');
        }else{

            session()->flash('mensagem_erro', 'Erro!');
        }
        return redirect('/deliveryComplemento');
    }


    private function _validate(Request $request, $fileExist = true){
        $rules = [
            'nome' => 'required|max:50',
            'valor' => 'required',
            'categoria_id' => 'required'
        ];

        $messages = [
            'nome.required' => 'O campo nome é obrigatório.',
            'nome.max' => '50 caracteres maximos permitidos.',
            'valor.required' => 'O campo valor é obrigatório.',
            'categoria_id.required' => 'O campo categoria é obrigatório.'
        ];
        $this->validate($request, $rules, $messages);
    }

    public function all(){
        $complementos = ComplementoDelivery::all();
        $arr = array();
        foreach($complementos as $c){
            $arr[$c->id. ' - ' .$c->nome] = null;
                //array_push($arr, $temp);
        }
        echo json_encode($arr);
    }

    public function allPedidoLocal(){
        $complementos = ComplementoDelivery::all();

        echo json_encode($complementos);
    }

    //para os produtos

    public function adicionais($produtoId){
        $produto = ProdutoDelivery::find($produtoId);
        $categorias = CategoriaAdicional::all();

        $adicionados = [];
        foreach($produto->adicionais as $a){
            array_push($adicionados, $a->complemento_id);
        }

        return view('complementoDelivery/adicionais')
        ->with(compact('produto', 'categorias', 'adicionados'))
        ->with('title', 'Adicionais para o Produto');
    }

    public function saveAdicionais(Request $request){
        try{
            $produto = ProdutoDelivery::find($request->id);

            $selecionados = $this->validaSelecionados($request);

            ListaComplementoDelivery::
            where('produto_id', $produto->id)
            ->delete();
            foreach($selecionados as $s){
                $data = [
                    'produto_id' => $produto->id,
                    'complemento_id' => $s
                ];

                ListaComplementoDelivery::create($data);
            }
            session()->flash('mensagem_sucesso', 'Adicionais atribuídos as produto: ' . $produto->produto->nome);

        }catch(\Exception $e){
            session()->flash('mensagem_erro', 'Erro: ' . $e->getMessage());
        }

        return redirect('/deliveryProduto');
    }

    private function validaSelecionados($request){
        $arr = $request->all();
        $arr = (array) ($arr);
        $complementos = ComplementoDelivery::all();
        $temp = [];

        foreach($complementos as $c){
            if($request->input('ad_'.$c->id)){
                array_push($temp, $c->id);
            }
        }

        return $temp;
    }

}
