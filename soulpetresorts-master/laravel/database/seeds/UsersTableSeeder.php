<?php

use App\Models\User;
use App\Models\UserUnity;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'avatar' => 'http://soulpet.sevenclicks.us/storage/images/users/avatar-male.jpg',
            'name' => 'Adriano Ruiz',
            'email' => 'ruiz@7cliques.com.br',
            'password' => Hash::make('cli007'),
            'role' => 'ADMIN'
        ]);
        User::create([
            'avatar' => 'http://soulpet.sevenclicks.us/storage/images/users/avatar-female.jpg',
            'name' => 'Juliane',
            'email' => 'ju@7cliques.com.br',
            'password' => Hash::make('cli007'),
            'role' => 'CLIENT'
        ]);
        User::create([
            'avatar' => 'http://soulpet.sevenclicks.us/storage/images/users/avatar-male.jpg',
            'name' => 'Leonardo',
            'email' => 'leonardo@gmail.com.br',
            'password' => Hash::make('ex007'),
            'role' => 'CLIENT'
        ]);
        User::create([
            'avatar' => 'http://soulpet.sevenclicks.us/storage/images/users/avatar-male.jpg',
            'name' => 'Genesson Sauer',
            'email' => 'genesson@7cliques.com.br',
            'password' => Hash::make('cli007'),
            'role' => 'CLIENT'
        ]);
        UserUnity::create([
            'unity' => 1,
            'user' => 1,
            'status' => 'ACTIVE'
        ]);
        UserUnity::create([
            'unity' => 2,
            'user' => 1,
            'status' => 'INACTIVE'
        ]);
        UserUnity::create([
            'unity' => 1,
            'user' => 2,
            'status' => 'ACTIVE'
        ]);
        UserUnity::create([
            'unity' => 1,
            'user' => 3,
            'status' => 'ACTIVE'
        ]);
        UserUnity::create([
            'unity' => 1,
            'user' => 4,
            'status' => 'ACTIVE'
        ]);
    }
}
