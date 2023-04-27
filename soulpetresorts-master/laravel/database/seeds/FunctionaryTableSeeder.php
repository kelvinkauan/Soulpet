<?php

use Illuminate\Database\Seeder;
use App\Models\Functionary;

class FunctionaryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Functionary::create([
            'unity_id' => 1,
            'name' => 'Juliane',
            'setor' => 'Administrativo',
        ]);
        Functionary::create([
            'unity_id' => 2,
            'name' => 'Cláudio',
            'setor' => 'Banho e Tosa',
        ]);
        Functionary::create([
            'unity_id' => 1,
            'name' => 'Maria',
            'setor' => 'Administrativo',
        ]);
        Functionary::create([
            'unity_id' => 2,
            'name' => 'Bruna',
            'setor' => 'Resort',
        ]);
    }
}
