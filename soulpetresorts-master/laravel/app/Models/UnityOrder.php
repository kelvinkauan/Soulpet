<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UnityOrder extends Model
{
    protected $fillable = [
        'unity',
        'user',
        'payment_form',
        'amount',
        'status'
    ];

    public function products()
    {
        return $this->hasMany(UnityOrderProduct::class, 'order', 'id');
    }

    public function services()
    {
        return $this->hasMany(UnityOrderService::class, 'order', 'id');
    }
}
