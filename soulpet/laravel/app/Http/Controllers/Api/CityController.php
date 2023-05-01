<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\City;

class CityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Get(
     *     path="/api/provinces/{provinceId}",
     *     summary="Exibir Cidades",
     *     description="Exibir totas as cidades",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="provinceId",
     *         in="path",
     *         type="string",
     *         description="Id do Estado",
     *         required=true,
     *     ),
     *     @SWG\Response(response="200", description="Retorno dos dados",
     *          @SWG\schema(type="array",
     *              @SWG\items(type="object",
     *                  @SWG\Property(property="id", type="integer"),
     *                  @SWG\Property(property="name", type="string"),
     *                  @SWG\Property(property="province", type="string"),
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response=422,
     *         description="Missing Data"
     *     )
     * )
     */
    public function show($id)
    {
        return City::where('province', $id)->get();
    }
}
