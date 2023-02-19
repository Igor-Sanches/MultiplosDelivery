<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCashbackHistorialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cashback_historials', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('store_id');
            $table->integer('order_id');
            $table->decimal('amount');
            $table->decimal('cashback');
            $table->double('cashback_percentage');
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
        Schema::dropIfExists('cashback_historials');
    }
}
