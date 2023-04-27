<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unity extends Model
{
    protected $fillable = [
        'fantasy',
        'email',
        'cnpj',
        'color',
        'logo',
        'zipcode',
        'street',
        'number',
        'district',
        'country',
        'province',
        'city',
        'sunday',
        'monday',
        'tuesday',
        'wednesday',
        'thursday',
        'friday',
        'saturday',
        'status'
    ];

    public function city()
    {
        return $this->belongsTo(City::class, 'city', 'id');
    }

    public function categories()
    {
        return $this->belongsTo(UnityCategory::class, 'unity', 'id');
    }

    public function services()
    {
        return $this->belongsTo(UnityService::class, 'unity', 'id');
    }
}
