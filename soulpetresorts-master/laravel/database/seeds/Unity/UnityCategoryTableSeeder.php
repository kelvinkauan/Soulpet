<?php

use App\Models\UnityCategory;
use App\Models\UnityCategoryService;
use Illuminate\Database\Seeder;

class UnityCategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 1,
            'description' => 'Resort',
            'module' => 'HOTEL',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 8,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 2,
            'description' => 'Spa',
            'module' => 'SHOWER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 1,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 3,
            'description' => 'Daycare',
            'module' => 'DAY_CARE',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 7,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 4,
            'description' => 'Pacotes',
            'module' => 'PACKAGE',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 1,
                'category' => $category->id
            ]);
            UnityCategoryService::create([
                'service' => 5,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 5,
            'description' => 'Pet Sitter',
            'module' => 'PET_SITTER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 6,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 1,
            'order' => 6,
            'description' => 'Outros Serviços',
            'module' => 'OTHER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 9,
                'category' => $category->id
            ]);

        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 1,
            'description' => 'Resort',
            'module' => 'HOTEL',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 17,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 2,
            'description' => 'Spa',
            'module' => 'SHOWER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 10,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 3,
            'description' => 'Daycare',
            'module' => 'DAY_CARE',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 16,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 4,
            'description' => 'Pacotes',
            'module' => 'PACKAGE',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 10,
                'category' => $category->id
            ]);
            UnityCategoryService::create([
                'service' => 14,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 5,
            'description' => 'Pet Sitter',
            'module' => 'PET_SITTER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 15,
                'category' => $category->id
            ]);
        $category = UnityCategory::create([
            'unity' => 2,
            'order' => 6,
            'description' => 'Outros Serviços',
            'module' => 'OTHER',
            'status' => true
        ]);
            UnityCategoryService::create([
                'service' => 18,
                'category' => $category->id
            ]);
    }
}
