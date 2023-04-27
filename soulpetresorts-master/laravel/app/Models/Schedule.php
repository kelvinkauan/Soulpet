<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [
        'unity',
        'user',
        'pet',
        'service',
        'category',
        'room',
        'date',
        'hour',
        'time',
        'date_checkin',
        'hour_checkin',
        'date_checkout',
        'hour_checkout',
        'daily',
        'custom',
        'status'
    ];

    public function service()
    {
        return $this->hasMany(UnityService::class, 'id', 'service');
    }

    public function category()
    {
        return $this->hasMany(UnityCategory::class, 'id', 'category');
    }

    public function pet()
    {
        return $this->hasMany(Pet::class, 'id', 'pet');
    }
}
