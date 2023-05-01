<?php

use Illuminate\Database\Seeder;
use App\Models\Ration;
class RationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Ration::create([
            'name_ration' => 'Golden',
        ]);

        Ration::create([
            'name_ration' => 'Gran Plus',
        ]);

        Ration::create([
            'name_ration' => 'Premier',
        ]);

        Ration::create([
            'name_ration' => 'Friskies',
        ]);

        Ration::create([
            'name_ration' => 'Royal Canin',
        ]);

        Ration::create([
            'name_ration' => 'Pedigree',
        ]);
    }
}
