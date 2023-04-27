<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UnityPriceVariation extends Model
{
    protected $fillable = [
        'unity',
        'description',
        'start',
        'end',
        'value',
        'percent',
        'module',
        'status'
    ];
}
