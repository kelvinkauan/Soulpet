<?php

use App\Models\Unity;
use Illuminate\Database\Seeder;

class UnityTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Unity::create([
            'fantasy' => 'Agropal Pet Shop',
            'email' => 'contato@agropal.com',
            'cnpj' => '34.192.372/0001-00',
            'color' => '#ffffff',
            'logo' => 'http://soulpet.sevenclicks.us/storage/images/units/logo.jpg',
            'zipcode' => '84458-000',
            'street' => 'Rua América',
            'number' => '54',
            'district' => 'Centro',
            'country' => 1,
            'province' => 1,
            'city' => 69,
            'sunday' => false,
            'monday' => true,
            'tuesday' => true,
            'wednesday' => true,
            'thursday' => true,
            'friday' => true,
            'saturday' => false,
            'status' => 'ACTIVE'
        ]);
        Unity::create([
            'fantasy' => 'SoulPet',
            'email' => 'contato@soulpet.com',
            'cnpj' => '34.192.372/0001-00',
            'color' => '#d3d3d3',
            'logo' => 'http://soulpet.sevenclicks.us/storage/images/units/logo.jpg',
            'zipcode' => '84458-000',
            'street' => 'Rua América',
            'number' => '54',
            'district' => 'Centro',
            'country' => 1,
            'province' => 1,
            'city' => 69,
            'sunday' => false,
            'monday' => true,
            'tuesday' => true,
            'wednesday' => true,
            'thursday' => true,
            'friday' => true,
            'saturday' => false,
            'status' => 'ACTIVE'
        ]);
    }
}
