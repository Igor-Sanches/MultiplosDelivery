<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->integer('store_id');
            $table->integer('module_id');
            $table->integer('zone_id');
            $table->string('month_year');
            $table->timestamp('initial_date');
            $table->timestamp('final_date');
            $table->decimal('total_gain');
            $table->decimal('money_in_hand');
            $table->decimal('invoice_balance');
            $table->enum('type', ['credit', 'debit']);
            $table->timestamp('consolidation_date');
            $table->enum('status', ['paid_out', 'pending', 'processing_payment', 'refused_payment', 'overdue']);
            $table->timestamp('due_date');
            $table->timestamp('payment_date');
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
        Schema::dropIfExists('invoices');
    }
}
