<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBannerToposTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banner_topos', function (Blueprint $table) {
            $table->increments('id');

            $table->string('path', 100);
            $table->string('titulo', 20);
            $table->string('descricao', 100);

            $table->integer('produto_delivery_id')->nullable()->unsigned();
            $table->foreign('produto_delivery_id')->references('id')
            ->on('produto_deliveries')->onDelete('cascade');

            $table->integer('pack_id')->nullable()->unsigned();
            $table->foreign('pack_id')->references('id')
            ->on('pack_produto_deliveries')->onDelete('cascade');

            $table->boolean('ativo');

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
        Schema::dropIfExists('banner_topos');
    }
}
