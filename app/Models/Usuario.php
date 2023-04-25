<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuario extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nome', 'email', 'senha', 'login', 'adm', 'acesso_cliente', 'acesso_fornecedor',
        'acesso_produto', 'acesso_financeiro', 'acesso_caixa', 'acesso_estoque',
        'acesso_compra', 'acesso_fiscal', 'ativo', 'venda_nao_fiscal', 'img', 'acesso_cte', 'acesso_mdfe',
        'permissao'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'senha'
    ];

    public function funcionario(){
        return $this->hasOne('App\Models\Funcionario', 'usuario_id', 'id');
    }

    public function config(){
        return $this->hasOne('App\Models\ConfigCaixa', 'usuario_id', 'id');
    }
}
