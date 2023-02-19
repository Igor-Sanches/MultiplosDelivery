<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAffiliateHistoricalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('affiliate_historicals', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['reference', 'affiliate']);
            $table->integer('user_id');
            $table->integer('affiliate_id');
            $table->integer('order_id');
            $table->integer('store_id');
            $table->decimal('amount');
            $table->double('percentage')->nullable();
            $table->double('money')->nullable();
            $table->decimal('value_gain');
            $table->boolean('is_first_purchase');
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
        Schema::dropIfExists('affiliate_historicals');
    }
}
