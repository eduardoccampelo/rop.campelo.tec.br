<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tributacao;
class TributoController extends Controller
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

		$regimes = Tributacao::regimes();
		$tributo = Tributacao::
		first();
		return view('tributos/index')
		->with('tributo', $tributo)
		->with('regimes', $regimes)
		->with('title', 'Configurar Tributação');
	}


	public function save(Request $request){
		
		$this->_validate($request);
		if($request->id == 0){
			$result = Tributacao::create([
				'icms' => $request->icms,
				'pis' => $request->pis,
				'cofins' => $request->cofins,
				'ipi' => $request->ipi,
				'regime' => $request->regime,
				'ncm_padrao' => $request->ncm_padrao
			]);
		}else{
			$trib = Tributacao::first();

			$trib->icms = $request->icms;
			$trib->pis = $request->pis;
			$trib->cofins = $request->cofins;
			$trib->ipi = $request->ipi;
			$trib->regime = $request->regime;
			$trib->ncm_padrao = $request->ncm_padrao;
			$result = $trib->save();
		}

		if($result){
			session()->flash("mensagem_sucesso", "Configurado com sucesso!");
		}else{
			session()->flash('mensagem_erro', 'Erro ao configurar!');
		}

		return redirect('/tributos');
	}


	private function _validate(Request $request){
		$rules = [
			'icms' => 'required',
			'pis' => 'required',
			'cofins' => 'required',
			'ipi' => 'required',
			'ncm_padrao' => 'required'
			
		];

		$messages = [
			'icms.required' => 'O campo ICMS é obrigatório.',
			'pis.required' => 'O campo PIS é obrigatório.',
			'cofins.required' => 'O campo COFINS é obrigatório.',
			'ipi.required' => 'O campo IPI é obrigatório.',
			'ncm_padrao.required' => 'O campo NCM é obrigatório.'

		];
		$this->validate($request, $rules, $messages);
	}
}
