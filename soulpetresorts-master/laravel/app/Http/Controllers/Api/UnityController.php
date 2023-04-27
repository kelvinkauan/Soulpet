<?php

namespace App\Http\Controllers\Api;

use Exception;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Unity;
use App\Models\UnityCategory;
use App\Models\UnityService;

class UnityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $units = Unity::all();
        foreach ($units as $unity) {
            $unity->city = ($unity->city()->first()) ? $unity->city()->first() : [];
            $unity->province = ($unity->city->province()->first()) ? $unity->city->province()->first() : [];
            $unity->categories = ($unity->categories()->get()) ? $unity->categories()->get() : [];
            $unity->services = ($unity->services()->get()) ? $unity->services()->get() : [];
        }
        return $units;
    }

    public function restDays($unity)
    {
        $unit = Unity::where('id', $unity)->first();
        $days = '';
        $days .= (!$unit['sunday']) ? 'Sun, ' : '';
        $days .= (!$unit['monday']) ? 'Mon, ' : '';
        $days .= (!$unit['tuesday']) ? 'Tue, ' : '';
        $days .= (!$unit['wednesday']) ? 'Wed, ' : '';
        $days .= (!$unit['thursday']) ? 'Thu, ' : '';
        $days .= (!$unit['friday']) ? 'Fri, ' : '';
        $days .= (!$unit['saturday']) ? 'Sat, ' : '';
        return substr(trim($days), 0, -1);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request['province'] = isset($request->province) ? $request->province['id'] : null;
        $request['city'] = isset($request->city) ? $request->city['id'] : null;
        try {
            $unity = Unity::create($request->all());

            if (isset($request->categories)) {
                foreach ($request->categories as $category) {
                    UnityCategory::where(['id' => $category['id']])->update(['unity' => $unity->id]);
                }
            }
            if (isset($request->services)) {
                foreach ($request->services as $service) {
                    UnityService::where(['id' => $service['id']])->update(['unity' => $unity->id]);
                }
            }

            $unity->city = $unity->city()->first();
            $unity->province = $unity->city->province()->first();
            $unity->categories = $request->categories;
            $unity->services = $request->services;
            return response()->json($unity, 200);
        } catch (Exception $error) {
            return response()->json(['error' => $error->getMessage()]);
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
        try {
            return Unity::findOrFail($id);
        } catch (Exception $error) {
            return response()->json(['error' => $error->getMessage(), 'code' => $error->getCode()]);
        }
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
        $request['province'] = isset($request->province) ? $request->province['id'] : null;
        $request['city'] = isset($request->city) ? $request->city['id'] : null;
        try {
            $unity = Unity::findOrFail($id);
            $unity->update($request->all());

            if (isset($request->categories)) {
                foreach ($request->categories as $category) {
                    UnityCategory::where(['id' => $category['id']])->update(['unity' => $id]);
                }
            }
            if (isset($request->services)) {
                foreach ($request->services as $service) {
                    UnityService::where(['id' => $service['id']])->update(['unity' => $id]);
                }
            }

            $unity->city = $unity->city()->first();
            $unity->province = $unity->city->province()->first();
            $unity->categories = $request->categories;
            $unity->services = $request->services;
            return response()->json($unity, 200);
        } catch (Exception $error) {
            return response()->json(['error' => $error->getMessage(), 'code' => $error->getCode()]);
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
        $unity = Unity::findOrFail($id);
        $unity->delete();
        return $unity;
    }
}
