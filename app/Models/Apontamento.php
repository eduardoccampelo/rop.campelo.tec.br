<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Apontamento extends Model
{
    protected $fillable = [
        'usuario_id', 'produto_id', 'quantidade'
    ];

    public function produto(){
		return $this->belongsTo(Produto::class, 'produto_id');
	}

	public function usuario(){
		return $this->belongsTo(Usuario::class, 'usuario_id');
	}

}
