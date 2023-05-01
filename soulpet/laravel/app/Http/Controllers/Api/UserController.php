<?php

namespace App\Http\Controllers\Api;

use Exception;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\UserUnity;
use App\Models\UserAdress;
use App\Models\UserAdditional;
use App\Models\Pet;

use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::where('role', 'CLIENT')->get();
        foreach ($users as $user) {
            $user->address = ($user->addresses()->first()) ? $user->addresses()->first() : [];
            $user->city = ($user->addresses()->first()) ? $user->addresses()->first()->city()->first() : [];
            $user->province = ($user->addresses()->first()) ? $user->addresses()->first()->province()->first() : [];
            $user->additional = ($user->additional()->first()) ? $user->additional()->first() : [];
            $user->pets = ($user->pets()->get()) ? $user->pets()->get() : [];
        }
        return $users;
    }

    public function search(Request $request)
    {
        $users = User::where('role', 'CLIENT')->where('name', 'LIKE', '%' . $request->filter . '%')->get();
        foreach ($users as $user) {
            $user->address = ($user->addresses()->first()) ? $user->addresses()->first() : [];
            $user->city = ($user->addresses()->first()) ? $user->addresses()->first()->city()->first() : [];
            $user->province = ($user->addresses()->first()) ? $user->addresses()->first()->province()->first() : [];
            $user->additional = ($user->additional()->first()) ? $user->additional()->first() : [];
            $user->pets = ($user->pets()->get()) ? $user->pets()->get() : [];
        }
        return $users;
    }

    public function loadPerAdmin($id)
    {
        $users = User::where('role', '<>', 'CLIENT')->get();
        foreach ($users as $user) {
            $user->unity = ($user->unities()->get()) ? $user->unities()->get() : [];
            $user->units = '';
            foreach ($user->unity as $unity) {
                $user->units = $user->units . $unity->unity . ',';
            }
            $user->units = substr($user->units, 0, -1);
            $user->units = array_map('intval', explode(',', $user->units));
        }
        return $users;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [
            'avatar' => $request->avatar,
            'foreign' => $request->foreign,
            'name' => $request->name,
            'date_birth' => $request->date_birth,
            'email' => $request->email,
            'phone_residential' => $request->phone_residential,
            'phone_company' => $request->phone_company,
            'phone' => $request->phone,
            'cell_phone' => $request->cell_phone,
            'rg' => $request->rg,
            'cpf' => $request->cpf,
            'document' => $request->document,
            'passport' => $request->passport,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'status' => $request->status
        ];

        try {
            $user = User::create($data);

            if ($request->role === 'CLIENT') {
                $userUnity = [
                    'user' => $user->id,
                    'unity' => auth()->user()->unity[0]['unity'],
                    'status' => 'ACTIVE'
                ];
                UserUnity::create($userUnity);
            } else {
                $i = 0;
                foreach ($request->units as $unity) {
                    $userUnity = [
                        'user' => $user->id,
                        'unity' => $unity,
                        'status' => ($i === 0) ? 'ACTIVE' : 'INACTIVE'
                    ];
                    UserUnity::create($userUnity);
                    $i++;
                }
            }

            $address = [
                'user' => $user->id,
                'zipcode' => $request->address['zipcode'],
                'street' => $request->address['street'],
                'number' => $request->address['number'],
                'district' => $request->address['district'],
                'country' => $request->address['country'],
                'province' => $request->address['province'],
                'city' => $request->address['city']
            ];
            $additional = [
                'user' => $user->id,
                'found_us' => $request->additional['found_us'],
                'additional_one' => $request->additional['additional_one'],
                'additional_two' => $request->additional['additional_two'],
                'additional_three' => $request->additional['additional_three'],
                'obs_general' => $request->additional['obs_general'],
                'has_services' => $request->additional['has_services'],
                'special_attention' => $request->additional['special_attention'],
                'attention' => $request->additional['attention'],
                'obs_alert' => $request->additional['obs_alert']
            ];
            if (isset($request->pets)) {
                foreach ($request->pets as $pet) {
                    Pet::where(['id' => $pet['id']])->update(['user' => $user->id]);
                }
            }
            $user->address = UserAdress::create($address);
            $user->city = ($user->addresses()->first()) ? $user->addresses()->first()->city()->first() : [];
            $user->additional = UserAdditional::create($additional);
            $user->pets = $request->pets;

            if ($request->role !== 'CLIENT') {
                $user->unity = ($user->unity()->first()) ? $user->unity()->first() : [];
                $user->units = '';
                foreach ($user->unity as $unity) {
                    $user->units = $user->units . $unity->unity . ',';
                }
                $user->units = substr($user->units, 0, -1);
                $user->units = array_map('intval', explode(',', $user->units));
            }

            return response()->json($user, 200);
        } catch (Exception $e) {
            if (isset($e->errorInfo[0]) && $e->errorInfo[0] == '23000') {
                return response()->json(['erro' => true, 'message' => 'Esse email já foi usado por outra conta.'], 500);
            }
            return response()->json(['erro' => true, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);

        $user->address = ($user->addresses()->first()) ? $user->addresses()->first() : [];
        $user->city = ($user->addresses()->first()) ? $user->addresses()->first()->city()->first() : [];
        $user->province = ($user->addresses()->first()) ? $user->addresses()->first()->province()->first() : [];
        $user->additional = ($user->additional()->first()) ? $user->additional()->first() : [];
        $user->pets = ($user->pets()->get()) ? $user->pets()->get() : [];
        return response()->json($user, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->second_name) {
            User::where(['id' => $request->id])->update([
                'second_name' => $request->second_name,
                'second_cpf' => $request->second_cpf,
                'second_phone' => $request->second_phone
            ]);

            return $this->show($request->id);
        }

        $data = [
            'avatar' => $request->avatar,
            'foreign' => $request->foreign,
            'name' => $request->name,
            'date_birth' => $request->date_birth,
            'email' => $request->email,
            'phone_residential' => $request->phone_residential,
            'phone_company' => $request->phone_company,
            'phone' => $request->phone,
            'cell_phone' => $request->cell_phone,
            'rg' => $request->rg,
            'cpf' => $request->cpf,
            'document' => $request->document,
            'passport' => $request->passport,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'status' => $request->status
        ];

        try {
            $user = User::findOrFail($id);
            $user->update($data);

            if ($request->role === 'CLIENT') {
                UserUnity::where('user', $user->id)->delete();
                $userUnity = [
                    'user' => $user->id,
                    'unity' => auth()->user()->unity[0]['unity'],
                    'status' => 'ACTIVE'
                ];
                UserUnity::create($userUnity);
            } else {
                $i = 0;
                UserUnity::where('user', $user->id)->delete();
                foreach ($request->units as $unity) {
                    $userUnity = [
                        'user' => $user->id,
                        'unity' => $unity,
                        'status' => ($i === 0) ? 'ACTIVE' : 'INACTIVE'
                    ];
                    UserUnity::create($userUnity);
                    $i++;
                }
            }

            try {
                $address = UserAdress::firstOrNew(array('user' => $id));
                $address->user = $id;
                $address->zipcode = $request->address['zipcode'];
                $address->street = $request->address['street'];
                $address->number = $request->address['number'];
                $address->district = $request->address['district'];
                $address->country = $request->address['country'];
                $address->province = $request->address['province'];
                $address->city = $request->address['city'];
                $address->save();
            } catch (Exception $errAdress) {
                return response()->json(['erro' => true, 'message' => $errAdress->getMessage()]);
            }

            try {
                $additional = UserAdditional::firstOrNew(array('user' => $id));
                $additional->user = $id;
                $additional->found_us = $request->additional['found_us'];
                $additional->additional_one = $request->additional['additional_one'];
                $additional->additional_two = $request->additional['additional_two'];
                $additional->additional_three = $request->additional['additional_three'];
                $additional->obs_general = $request->additional['obs_general'];
                $additional->has_services = $request->additional['has_services'];
                $additional->special_attention = $request->additional['special_attention'];
                $additional->attention = $request->additional['attention'];
                $additional->obs_alert = $request->additional['obs_alert'];
                $additional->save();
            } catch (Exception $errAdditional) {
                return response()->json(['erro' => true, 'message' => $errAdditional->getMessage()]);
            }

            if (isset($request->pets)) {
                foreach ($request->pets as $pet) {
                    Pet::where(['id' => $pet['id']])->update(['user' => $user->id]);
                }
            }

            $user->address = $address;
            $user->city = ($user->addresses()->first()) ? $user->addresses()->first()->city()->first() : [];
            $user->additional = $additional;
            $user->pets = $request->pets;

            if ($request->role !== 'CLIENT') {
                $user->unity = ($user->unity()->first()) ? $user->unity()->first() : [];
                $user->units = '';
                foreach ($user->unity as $unity) {
                    $user->units = $user->units . $unity->unity . ',';
                }
                $user->units = substr($user->units, 0, -1);
                $user->units = array_map('intval', explode(',', $user->units));
            }

            return response()->json($user, 200);
        } catch (Exception $e) {
            return response()->json(['erro' => true, 'message' => $e->getMessage()]);
        }
    }

    public function updateUnity(Request $request)
    {
        $inactive = UserUnity::where(['user' => auth()->user()->id])->update(['status' => 'INACTIVE']);
        if ($inactive) {
            UserUnity::where(['unity' => $request->id])->update(['status' => 'ACTIVE']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        UserAdress::where('user', $id)->delete();
        UserAdditional::where('user', $id)->delete();
        Pet::where('user', $id)->delete();

        $user = User::findOrFail($id);
        $user->delete();

        return $user;
    }
}
