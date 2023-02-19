<?php

namespace App\Console\Commands;

use App\CentralLogics\OrderLogic;
use App\Models\Invoices;
use App\Models\Order;
use Illuminate\Console\Command;

class ValidateInvoicesValidity extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:validate-invoices-validity';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

//        $order = Order::query()->find(1011);
//        OrderLogic::create_transaction($order, 'admin');
//        dd($order->toArray());
//        return 0;
        $invoices = Invoices::query()
            ->where('status', 'pending')
            ->get();
        foreach ($invoices as $invoice){
            $due_date = now()->setTimeFromTimeString($invoice->due_date);
            $now = now();
            if($due_date->isBefore($now)){
                $invoice->status = 'overdue';
                $invoice->save();
            }
        }
        return 0;
    }
}
