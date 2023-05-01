<?php

use App\Models\UnityPriceVariation;
use Illuminate\Database\Seeder;

class UnityPriceVariationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        UnityPriceVariation::create([
            'unity' => 1,
            'description' => 'Alta Temporada Hotel',
            'start' => '2020-01-14',
            'end' => '2020-08-15',
            'value' => null,
            'percent' => 10,
            'module' => 'HOTEL',
            'status' => true
        ]);
        UnityPriceVariation::create([
            'unity' => 1,
            'description' => 'Alta Temporada Creche',
            'start' => '2020-01-14',
            'end' => '2020-08-15',
            'value' => null,
            'percent' => 10,
            'module' => 'CRECHE',
            'status' => true
        ]);
        UnityPriceVariation::create([
            'unity' => 1,
            'description' => 'Alta Temporada PetSitter',
            'start' => '2020-01-14',
            'end' => '2020-08-15',
            'value' => 40,
            'percent' => null,
            'module' => 'PETSITTER',
            'status' => true
        ]);
    }
}
