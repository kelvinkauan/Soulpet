<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\UnityPriceVariation;

class UnityPriceVariationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $unityPriceVariations = UnityPriceVariation::all();
        return $unityPriceVariations;
    }

    public function loadPerUnity($id)
    {
        $unitPriceVariations = UnityPriceVariation::where('unity', $id)->get();
        return $unitPriceVariations;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request['start'] = date('Y-m-d', strtotime($request->start));
        $request['end'] = date('Y-m-d', strtotime($request->end));
        $request['value'] = ($request['value']) ? str_replace(',', '.', $request->value) : null;

        $unityPriceVariation = UnityPriceVariation::create($request->all());
        $unityPriceVariation->hour = date('H:m', strtotime($unityPriceVariation->hour));
        return $unityPriceVariation;
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return UnityPriceVariation::findOrFail($id);
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
        $request['start'] = date('Y-m-d', strtotime($request->start));
        $request['end'] = date('Y-m-d', strtotime($request->end));
        $request['value'] = ($request['value']) ? str_replace(',', '.', $request->value) : null;

        $unityPriceVariation = UnityPriceVariation::findOrFail($id);
        $unityPriceVariation->update($request->all());
        $unityPriceVariation->hour = date('H:m', strtotime($unityPriceVariation->hour));
        return $unityPriceVariation;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $unityPriceVariation = UnityPriceVariation::findOrFail($id);
        $unityPriceVariation->delete();
        return $unityPriceVariation;
    }
}
