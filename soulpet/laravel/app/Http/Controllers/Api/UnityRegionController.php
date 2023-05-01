<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\UnityRegion;
use App\Models\UnityDistrict;

class UnityRegionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (isset(auth()->user()->unity[0]['unity'])) {
            $unityRegions = UnityRegion::where('unity', auth()->user()->unity[0]['unity'])->get();
            foreach ($unityRegions as $unityRegion) {
                $unityRegion->districts = ($unityRegion->districts()->get()) ? $unityRegion->districts()->get() : [];
            }
            return $unityRegions;
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (isset(auth()->user()->unity[0]['unity'])) {
            $request['unity'] = auth()->user()->unity[0]['unity'];
            $unityRegion = UnityRegion::create($request->all());

            if (isset($request->districts)) {
                foreach ($request->districts as $district) {
                    UnityDistrict::where(['id' => $district['id']])->update(['region' => $unityRegion->id]);
                }
            }
            $unityRegion->districts = $request->districts;
            return $unityRegion;
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
        return UnityRegion::findOrFail($id);
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
        $unityRegion = UnityRegion::findOrFail($id);
        $unityRegion->update($request->all());

        UnityDistrict::where(['region' => $id])->update(['region' => null]);

        if (isset($request->districts)) {
            foreach ($request->districts as $district) {
                UnityDistrict::where(['id' => $district['id']])->update(['region' => $unityRegion->id]);
            }
        }
        $unityRegion->districts = $request->districts;
        return $unityRegion;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $unityRegion = UnityRegion::findOrFail($id);
        $unityRegion->delete();
        return $unityRegion;
    }
}
