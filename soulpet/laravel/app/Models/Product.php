<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'description',
        'sku',
        'origin',
        'type',
        'ncm',
        'cfop',
        'cest',
        'price_sale',
        'unity',
        'net_weight',
        'gross_weight',
        'type_pack',
        'width',
        'heigth',
        'length',
        'description_comp',
        'image',
        'category',
        'brand',
        'manufacturer',
        'cod_product',
        'unit_per_box',
        'price_cost',
        'line_product',
        'guarantee',
        'situation',
        'gtin',
        'unit_tributary',
        'conversion',
        'ipi',
        'value_ipi'
    ];
}
