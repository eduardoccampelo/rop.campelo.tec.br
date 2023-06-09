<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tributacao extends Model
{
	protected $fillable = [
		'icms', 'pis', 'cofins', 'regime', 'ipi', 'ncm_padrao'
	];

	public static function regimes(){
		return [ 
			0 => 'Simples',
			1 => 'Normal'
		];
	}
}
