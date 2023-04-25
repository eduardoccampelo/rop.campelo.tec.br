<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Usuario;
use App\Helpers\Menu;

class UsuarioController extends Controller
{

	public function __construct(){
		$this->middleware(function ($request, $next) {
			$value = session('user_logged');
			if(!$value){
				return redirect("/login");
			}else{
				if($value['adm'] == 0){
					return redirect("/sempermissao");
				}
			}
			return $next($request);
		});
	}

	public function lista(){
		$usuarios = Usuario::all();
		return view('usuarios/list')
		->with('usuarios', $usuarios)
		->with('title', 'Lista de Usuarios');
	}

	public function new(){

		$value = session('user_logged');

		$menu = new Menu();
		$menu = $menu->getMenu();

		$permissoesUsuario = [];
		
		return view('usuarios/register')
		->with('usuarioJs', true)
		->with('menuAux', $menu)
		->with('permissoesUsuario', $permissoesUsuario)
		->with('title', 'Cadastrar Usuarios');
	}

	private function validaPermissao($request){
		$menu = new Menu();
		$arr = $request->all();
		$arr = (array) ($arr);
		$menu = $menu->getMenu();
		$temp = [];
		foreach($menu as $m){
			foreach($m['subs'] as $s){
				if(isset($arr[$s['rota']])){
					array_push($temp, $s['rota']);
				}
			}
		}

		return $temp;

	}

	public function save(Request $request){

		$login = $request->login;
		$temp = Usuario::where('login', $login)
		->first();

		if($temp != null && $temp->login == $login){
			session()->flash('mensagem_erro', 'Login já existente!');
			return redirect('/usuarios');
		}

		$permissao = $this->validaPermissao($request);

		$result = Usuario::create([
			'nome' => $request->nome,
			'login' => $request->login,
			'senha' => md5($request->senha),
			'adm' => $request->adm ? true : false,
			'acesso_cliente' => $request->acesso_cliente ? true : false,
			'acesso_fornecedor' => $request->acesso_fornecedor ? true : false,
			'acesso_produto' => $request->acesso_produto ? true : false,
			'acesso_financeiro' => $request->acesso_financeiro ? true : false,
			'acesso_caixa' => $request->acesso_caixa ? true : false,
			'acesso_estoque' => $request->acesso_estoque ? true : false,
			'acesso_compra' => $request->acesso_compra ? true : false,
			'acesso_fiscal' => $request->acesso_fiscal ? true : false,
			'ativo' => true,
			'permissao' => json_encode($permissao),
			'venda_nao_fiscal' => $request->venda_nao_fiscal ? true : false,
			'acesso_cte' => $request->acesso_cte ? true : false,
			'acesso_mdfe' => $request->acesso_cte ? true : false
		]);

		if($result){
			session()->flash("mensagem_sucesso", "Usuário salvo!");
		}else{
			session()->flash('mensagem_erro', 'Erro ao criar usuário!');
		}

		return redirect('/usuarios');
	}

	public function update(Request $request){

		$usr = Usuario::
		where('id', $request->id)
		->first();

		$usr->nome = $request->nome;
		$usr->login = $request->login;
		if($request->senha){
			$usr->senha = md5($request->senha);
		}
		
		$permissao = $this->validaPermissao($request);
		
		$usr->adm = $request->adm ? true : false;
		$usr->acesso_cliente = $request->acesso_cliente ? true : false;
		$usr->acesso_fornecedor = $request->acesso_fornecedor ? true : false;
		$usr->acesso_produto = $request->acesso_produto ? true : false;
		$usr->acesso_financeiro = $request->acesso_financeiro ? true : false;
		$usr->acesso_caixa = $request->acesso_caixa ? true : false;
		$usr->acesso_estoque = $request->acesso_estoque ? true : false;
		$usr->acesso_compra = $request->acesso_compra ? true : false;
		$usr->acesso_fiscal = $request->acesso_fiscal ? true : false;
		$usr->venda_nao_fiscal = $request->venda_nao_fiscal ? true : false;
		$usr->acesso_cte = $request->acesso_cte ? true : false;
		$usr->acesso_mdfe = $request->acesso_mdfe ? true : false;
		$usr->permissao = $permissao;

		$result = $usr->save();
		if($result){
			session()->flash("mensagem_sucesso", "Usuário atualizado!");
		}else{
			session()->flash('mensagem_erro', 'Erro ao atualizar usuário!');
		}

		return redirect('/usuarios');
	}


	public function edit($id){
		$usuario = Usuario::
		where('id', $id)
		->first();

		$menu = new Menu();
		$menu = $menu->getMenu();

		$permissoesUsuario = json_decode($usuario->permissao);
		if(!$permissoesUsuario){
			$permissoesUsuario = [];
		}

		return view('usuarios/register')
		->with('usuarioJs', true)
		->with('usuario', $usuario)
		->with('menuAux', $menu)
		->with('permissoesUsuario', $permissoesUsuario)
		->with('title', 'Editar usuário');
	}

	public function delete($id){
		$usuario = Usuario::
		where('id', $id)
		->first();

		if($usuario->delete()){
			session()->flash("mensagem_sucesso", "Usuário removido!");
		}else{
			session()->flash('mensagem_erro', 'Erro ao remover usuário!');
		}

		return redirect('/usuarios');
	}


	private function _validate(Request $request){
		$rules = [
			'nome' => 'required',
			'login' => 'required',
			'senha' => 'required',
		];

		$messages = [
			'nome.required' => 'O campo nome é obrigatório.',
			'login.max' => 'O campo login é obrigatório.',
			'senha.max' => 'O campo senha é obrigatório'
		];
		$this->validate($request, $rules, $messages);
	}

	public function setTema(Request $request){
		$tema = $request->tema;
		$tema_menu = $request->tema_menu;
		$id = $value = session('user_logged')['id'];
		$usuario = Usuario::find($id);
		$usuario->tema = $tema;
		$usuario->tema_menu = $tema_menu;
		$usuario->save();
		session()->flash("mensagem_sucesso", "Tema salvo!");
		return redirect()->back();

	}
}
