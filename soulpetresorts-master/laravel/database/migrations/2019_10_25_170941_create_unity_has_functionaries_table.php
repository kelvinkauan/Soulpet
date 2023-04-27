<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUnityHasFunctionariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('unity_has_functionaries', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('functionary_id')->unsigned();//chave estrangeira - user ou functionary
            $table->foreign('functionary_id')->references('id')->on('functionaries');
            $table->bigInteger('unity_id')->unsigned(); //chave estrangeira unidade
            $table->foreign('unity_id')->references('id')->on('unities');
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
        Schema::dropIfExists('unity_has_functionaries');
    }
}
