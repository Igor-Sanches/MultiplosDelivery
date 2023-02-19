<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoices extends Model
{
    use HasFactory;

    public function store()
    {
        return $this->belongsTo(Store::class,'store_id');
    }

    public function zone()
    {
        return $this->belongsTo(Zone::class,'zone_id');
    }

    public function module()
    {
        return $this->belongsTo(Module::class,'module_id');
    }
}
