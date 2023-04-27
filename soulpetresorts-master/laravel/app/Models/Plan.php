<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    protected $fillable = [
        'pet_id',
        'start_date',
        'end_date',
        'times_week',
        'frequency_shower',
        'transport',
    ];
}
