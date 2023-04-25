<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transportadora;
use App\Models\Cliente;
use App\Models\Cidade;

class TransportadoraController extends Controller
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
		$transportadoras = Transportadora::all();
		return view('transportadora/list')
		->with('transportadoras', $transportadoras)
		->with('title', 'Transportadoras');
	}

	public function new(){

        $estados = Cliente::estados();
        $cidades = Cidade::all();
		return view('transportadora/register')
		->with('pessoaFisicaOuJuridica', true)
        ->with('cidadeJs', true)
        ->with('estados', $estados)
		->with('cidades', $cidades)
		->with('title', 'Cadastrar Transportadora');
	}

	public function save(Request $request){
		$transp = new Transportadora();
		$this->_validate($request);

		$cidade = $request->input('cidade');
		$cidade = explode("-", $cidade);
		$cidade = $cidade[0];
		$request->merge([ 'cidade_id' => $cidade]);

		$result = $transp->create($request->all());

		if($result){
			session()->flash("mensagem_sucesso", "Transportadora cadastrada com sucesso!");
		}else{
			session()->flash('mensagem_erro', 'Erro ao cadastrar transportadora!');
		}

		return redirect('/transportadoras');
	}

	public function edit($id){
        $transp = new Transportadora(); //Model
        
        $resp = $transp
        ->where('id', $id)->first();  

        $estados = Cliente::estados();
        $cidades = Cidade::all();
        return view('transportadora/register')
        ->with('pessoaFisicaOuJuridica', true)
        ->with('cidadeJs', true)
        ->with('transp', $resp)
        ->with('estados', $estados)
        ->with('cidades', $cidades)
        ->with('title', 'Editar Transportadora');

    }

    public function update(Request $request){
        $this->_validate($request);

    	$transp = new Transportadora();

    	$id = $request->input('id');
    	$resp = $transp
    	->where('id', $id)->first(); 

    	$cidade = $request->input('cidade');
    	$cidade = explode("-", $cidade);
    	$cidade = $cidade[0];

    	$resp->razao_social = $request->input('razao_social');

    	$resp->cnpj_cpf = $request->input('cnpj_cpf');
    	$resp->cidade_id = $cidade;

    	$resp->logradouro = $request->input('logradouro');


    	$result = $resp->save();
    	if($result){
    		session()->flash('mensagem_sucesso', 'Transportadora editado com sucesso!');
    	}else{
    		session()->flash('mensagem_erro', 'Erro ao editar transportadora!');
    	}

    	return redirect('/transportadoras'); 
    }

    public function delete($id){
    	$delete = Transportadora
    	::where('id', $id)
    	->delete();
    	if($delete){
    		session()->flash('mensagem_sucesso', 'Registro removido!');
    	}else{
    		session()->flash('mensagem_erro', 'Erro!');
    	}
    	return redirect('/transportadoras');
    }


    private function _validate(Request $request){
    	$rules = [
    		'razao_social' => 'required|max:50',
    		'cnpj_cpf' => 'required',
    		'logradouro' => 'required|max:80',
    		'cidade' => 'required',
    	];

    	$messages = [
    		'razao_social.required' => 'O Razão social nome é obrigatório.',
    		'razao_social.max' => '50 caracteres maximos permitidos.',

    		'cnpj_cpf.required' => 'O campo CPF/CNPJ é obrigatório.',
    		'logradouro.required' => 'O campo Rua é obrigatório.',
    		'logradouro.max' => '80 caracteres maximos permitidos.',

    		'cidade.required' => 'O campo Cidade é obrigatório.',

    	];
    	$this->validate($request, $rules, $messages);
    }

    public function all(){
    	$clientes = Transportadora::all();
    	$arr = array();
    	foreach($clientes as $c){
    		$arr[$c->id. ' - ' .$c->razao_social] = null;
                //array_push($arr, $temp);
    	}
    	echo json_encode($arr);
    }

    public function find($id){
    	$cliente = Transportadora::
    	where('id', $id)
    	->first();

    	echo json_encode($this->getCidade($cliente));
    }

    private function getCidade($transp){
    	$temp = $transp;
    	$transp['cidade'] = $transp->cidade;
    	return $temp;
    }



}
