<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UnityCategory extends Model
{
    protected $fillable = [
        'unity',
        'order',
        'description',
        'module',
        'status'
    ];

    public function services()
    {
        $services = $this->hasMany(UnityCategoryService::class, 'category', 'id');
        return $services;
    }
}
