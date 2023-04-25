<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Usuario;
use App\Models\ConfigNota;

class UserController extends Controller
{

  public function newAccess(){

    $loginCookie = (isset($_COOKIE['CookieLogin'])) ? 
    base64_decode($_COOKIE['CookieLogin']) : '';
    $senhaCookie = (isset($_COOKIE['CookieSenha'])) ? 
    base64_decode($_COOKIE['CookieSenha']) : '';
    $lembrarCookie = (isset($_COOKIE['CookieLembrar'])) ? 
    $_COOKIE['CookieLembrar'] : '';
    return view('login/access_2')
    ->with('loginCookie', $loginCookie)
    ->with('senhaCookie', $senhaCookie)
    ->with('lembrarCookie', $lembrarCookie);
  }

  public function request(Request $request){

    $login = $request->input('login');
    $senha = $request->input('senha');

    $user = new Usuario();

    $usr = $user
    ->where('login', $login)
    ->where('senha', md5($senha))
    ->first();

    if($usr != null){

      if($usr->ativo == 0){
        session()->flash('mensagem_login', 'Usuário desativado');
        return redirect('/login');
      }

      $config = ConfigNota::first();
      $ambiente = 'Não configurado';
      if($config != null){
        $ambiente = $config->ambiente == 1 ? 'Produção' : 'Homologação'; 
      }

      $lembrar = $request->lembrar;

      if($lembrar){
        $expira = time() + 60*60*24*30;
        setCookie('CookieLogin', base64_encode($login), $expira);
        setCookie('CookieSenha', base64_encode($senha), $expira);
        setCookie('CookieLembrar', 1, $expira);
      }else{
        setCookie('CookieLogin');
        setCookie('CookieSenha');
        setCookie('CookieLembrar');
      }

      $session = [
        'id' => $usr->id,
        'nome' => $usr->nome,
        'adm' => $usr->adm,
        'ambiente' => $ambiente,
        'delivery' => getenv("DELIVERY") == 1 || getenv("DELIVERY_MERCADO") == 1 ? true : false,
        'acesso_cliente' => $usr->acesso_cliente,
        'acesso_fornecedor' => $usr->acesso_fornecedor,
        'acesso_produto' => $usr->acesso_produto,
        'acesso_financeiro' => $usr->acesso_financeiro,
        'acesso_caixa' => $usr->acesso_caixa,
        'acesso_estoque' => $usr->acesso_estoque,
        'acesso_compra' => $usr->acesso_compra,
        'acesso_fiscal' => $usr->acesso_fiscal,
      ];
      session(['user_logged' => $session]);
      return redirect('/' . getenv('ROTA_INICIAL'));
    }else{
      __set($request);

      session()->flash('mensagem_login', 'Credencial(s) incorreta(s)!');
      return redirect('/login');
    }
  }

  public function logoff(){
    session()->forget('user_logged');


    session()->flash('mensagem_login', 'Logoff realizado.');
    return redirect("/login");
  }


}
