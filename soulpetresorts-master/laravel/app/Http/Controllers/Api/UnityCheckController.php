<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\UnityCheck;

class UnityCheckController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $unityChecks = UnityCheck::all();
        foreach ($unityChecks as $unityCheck) {
            $unityCheck->hour = date('H:m', strtotime($unityCheck->hour));
        }
        return $unityChecks;
    }

    public function loadPerUnity($id)
    {
        $unitChecks = UnityCheck::where('unity', $id)->get();
        return $unitChecks;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request['description'] = ucfirst($request->type) . ': ' . date('H:m', strtotime($request->hour));
        $request['hour'] = date('H:m:s', strtotime($request->hour));
        $unityCheck = UnityCheck::create($request->all());
        $unityCheck->hour = date('H:m', strtotime($unityCheck->hour));
        return $unityCheck;
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return UnityCheck::findOrFail($id);
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
        $request['description'] = ucfirst($request->type) . ': ' . date('H:m', strtotime($request->hour));
        $request['hour'] = date('H:m:s', strtotime($request->hour));
        $unityCheck = UnityCheck::findOrFail($id);
        $unityCheck->update($request->all());
        $unityCheck->hour = date('H:m', strtotime($unityCheck->hour));
        return $unityCheck;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $unityCheck = UnityCheck::findOrFail($id);
        $unityCheck->delete();
        return $unityCheck;
    }
}
