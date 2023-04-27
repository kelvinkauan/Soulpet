<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('avatar')->nullable();
            $table->boolean('foreign')->nullable();
            $table->string('name')->nullable();
            $table->string('date_birth')->nullable();
            $table->string('cpf')->nullable();
            $table->string('rg')->nullable();
            $table->string('document')->nullable();
            $table->string('passport')->nullable();
            $table->string('phone')->nullable();
            $table->string('cell_phone')->nullable();
            $table->string('email')->unique()->nullable();
            $table->string('phone_residential')->nullable();
            $table->string('phone_company')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('second_name')->nullable();
            $table->string('second_cpf')->nullable();
            $table->string('second_phone')->nullable();
            $table->enum('role', ['EMPLOYEE', 'ADMIN', 'CLIENT'])->nullable();
            $table->string('status')->nullable();
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
