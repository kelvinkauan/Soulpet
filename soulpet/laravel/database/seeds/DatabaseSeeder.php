<?php

use App\Models\RulesManual;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,

            // UNITY
            UnityCategoryTableSeeder::class,
            UnityServiceTableSeeder::class,
            UnityRoomTableSeeder::class,
            UnityDistrictTableSeeder::class,
            UnityRegionTableSeeder::class,
            UnityCheckTableSeeder::class,
            UnityPriceVariationTableSeeder::class,
            UnityTableSeeder::class,
            // CLOSE UNITY

            // PRODUCT
            ProductTableSeeder::class,
            // CLOSE PRODUCT

            // PET
            PetBehaviorTableSeeder::class,
            PetBreedTableSeeder::class,
            PetSizeTableSeeder::class,
            PetTypeFurTableSeeder::class,
            PetTypeTableSeeder::class,
            PetTableSeeder::class,
            // CLOSE PET

            // HOLIDAY
            HolidayTableSeeder::class,
            // CLOSE HOLIDAY

            RationTableSeeder::class,
            FunctionaryTableSeeder::class,
            RulesManualTableSeeder::class,
            TermTableSeeder::class,
        ]);

        $path = 'app/developer_docs/provinces-and-cities.sql';
        DB::unprepared(file_get_contents($path));
        $this->command->info('Provinces and cities tables seeded!');
    }
}
