<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $fillable = [
        'nome'
    ];

    public function produtos(){
        return $this->hasMany('App\Models\Produto', 'categoria_id', 'id');
    }
}
