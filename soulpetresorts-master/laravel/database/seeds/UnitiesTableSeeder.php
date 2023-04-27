<?php

use Illuminate\Database\Seeder;
use App\Models\Unity;

class UnitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Unity::create([
            'fantasy' => 'Unidade 1',
            'email' => 'unidade@gmail.com',
            'cnpj' => '34192372000189',
            'color' => '#ffffff',
            'logo' => 'http://soulpet.sevenclicks.us/storage/images/units/logo.jpg',
            'zipcode' => '84458-000',
            'street' => 'Rua América',
            'number' => '54',
            'district' => 'Centro',
            'country' => 1,
            'province' => 1,
            'city' => 69,
            'status' => 'ativo',
        ]);

        Unity::create([
            'fantasy' => 'Unidade 2',
            'email' => 'unidade@gmail.com',
            'cnpj' => '29069158000108',
            'color' => '#d3d3d3',
            'logo' => 'http://soulpet.sevenclicks.us/storage/images/units/logo.jpg',
            'zipcode' => '84458-000',
            'street' => 'Rua América',
            'number' => '54',
            'district' => 'Centro',
            'country' => 1,
            'province' => 1,
            'city' => 69,
            'status' => 'ativo',
        ]);
    }
}
