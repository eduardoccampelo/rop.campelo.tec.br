<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pedidos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('comanda', 12);
            $table->string('observacao', 200);
            $table->boolean('status');

            $table->integer('mesa_id')->nullable()->unsigned();
            $table->foreign('mesa_id')->references('id')->on('mesas');

            $table->integer('bairro_id')->nullable()->unsigned();
            $table->foreign('bairro_id')->references('id')->on('bairro_deliveries');

            $table->string('nome', 50);
            $table->string('rua', 50);
            $table->string('numero', 10);

            $table->string('referencia', 30);
            $table->string('telefone', 15);

            $table->boolean('desativado');
            $table->string('referencia_cliete', 200)->default('');
            $table->boolean('mesa_ativa')->default(true);
            $table->boolean('fechar_mesa')->default(false);
            $table->timestamp('data_registro')->useCurrent();
            $table->boolean('imprimir')->default(false);

            $table->boolean('finalizado_atendimeto')->default(true);

            // alter table pedidos add column finalizado_atendimeto boolean default true;

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pedidos');
    }
}