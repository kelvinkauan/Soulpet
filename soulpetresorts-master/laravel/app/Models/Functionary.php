<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Functionary extends Model
{
    protected $fillable = [
        'unity_id',
        'name',
        'setor',
    ];
}
