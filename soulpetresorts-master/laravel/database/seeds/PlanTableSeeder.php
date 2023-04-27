<?php

use Illuminate\Database\Seeder;

class PlanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Plans::create([
            'pet_id' => '2',
            'start_date' => '25/11/2019',
            'end_date' => '26/11/2019',
            'times_week' => '09:00',
            'frequency_shower' => '3',
            'transport' => 'true',
            ]);

            Plans::create([
                'pet_id' => '4',
                'start_date' => '30/11/2019',
                'end_date' => '03/11/2019',
                'times_week' => '12:00',
                'frequency_shower' => '2',
                'transport' => 'true',
                ]);
    }
}
