<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Functionary;

class FunctionaryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Get(
     *     path="/api/funcionaries",
     *     summary="Exibir Categorias",
     *     description="Exibir totas as categorias",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Response(response="200", description="Retorno dos dados",
     *          @SWG\schema(type="array",
     *              @SWG\items(type="object",
     *                  @SWG\Property(property="id", type="integer"),
     *                  @SWG\Property(property="name", type="string"),
     *                  @SWG\Property(property="type", type="string"),
     *                  @SWG\Property(property="status", type="string"),
     *                  @SWG\Property(property="created_at", type="string"),
     *                  @SWG\Property(property="updated_at", type="string"),
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response=422,
     *         description="Missing Data"
     *     )
     * )
     */
    public function index()
    {
        return Functionary::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Post(
     *     path="/api/funcionaries",
     *     summary="Nova Categoria",
     *     description="Cadastra uma nova categoria",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="name",
     *         in="query",
     *         type="string",
     *         description="Nome da categoria",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="type",
     *         in="query",
     *         type="string",
     *         description="Tipo da categoria",
     *         default="CATEGORY",
     *         required=false,
     *     ),
     *     @SWG\Parameter(
     *         name="status",
     *         in="query",
     *         type="string",
     *         description="Status da categoria",
     *         default="ACTIVE",
     *         required=false,
     *     ),
     *     @SWG\Response(response="200", description="Retorno dos dados",
     *          @SWG\items(type="object",
     *              @SWG\Property(property="id", type="integer"),
     *              @SWG\Property(property="name", type="string"),
     *              @SWG\Property(property="type", type="string"),
     *              @SWG\Property(property="status", type="string"),
     *              @SWG\Property(property="created_at", type="string"),
     *              @SWG\Property(property="updated_at", type="string"),
     *          )
     *     ),
     *     @SWG\Response(
     *         response=422,
     *         description="Missing Data"
     *     )
     * )
     */
    public function store(Request $request)
    {
        $functionary = Functionary::create($request->all());
        return $functionary;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Get(
     *     path="/api/funcionaries/{categoryId}",
     *     summary="Exibir Categoria",
     *     description="Exibir uma categoria",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="categoryId",
     *         in="path",
     *         type="integer",
     *         description="Id da categoria",
     *         required=true,
     *     ),
     *     @SWG\Response(response="200", description="Retorno dos dados",
     *          @SWG\items(type="object",
     *              @SWG\Property(property="id", type="integer"),
     *              @SWG\Property(property="name", type="string"),
     *              @SWG\Property(property="type", type="string"),
     *              @SWG\Property(property="status", type="string"),
     *              @SWG\Property(property="created_at", type="string"),
     *              @SWG\Property(property="updated_at", type="string"),
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
        return Functionary::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Put(
     *     path="/api/funcionaries/{categoryId}",
     *     summary="Atualizar Categoria",
     *     description="Atualiza uma categoria",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="categoryId",
     *         in="path",
     *         type="integer",
     *         description="Id da categoria",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="name",
     *         in="query",
     *         type="string",
     *         description="Nome da categoria",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="type",
     *         in="query",
     *         type="string",
     *         description="Tipo da categoria",
     *         default="CATEGORY",
     *         required=false,
     *     ),
     *     @SWG\Parameter(
     *         name="status",
     *         in="query",
     *         type="string",
     *         description="Status da categoria",
     *         default="ACTIVE",
     *         required=false,
     *     ),
     *     @SWG\Response(response="200", description="Retorno dos dados",
     *          @SWG\items(type="object",
     *              @SWG\Property(property="id", type="integer"),
     *              @SWG\Property(property="name", type="string"),
     *              @SWG\Property(property="type", type="string"),
     *              @SWG\Property(property="status", type="string"),
     *              @SWG\Property(property="created_at", type="string"),
     *              @SWG\Property(property="updated_at", type="string"),
     *          )
     *     ),
     *     @SWG\Response(
     *         response=422,
     *         description="Missing Data"
     *     )
     * )
     */
    public function update(Request $request, $id)
    {
        $functionary = Functionary::findOrFail($id);
        $functionary->update($request->all());
        return $functionary;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    /**
     * @SWG\Delete(
     *     path="/api/funcionaries/{categoryId}",
     *     summary="Remover Categoria",
     *     description="Remover uma categoria",
     *     @SWG\Parameter(
     *         name="Authorization",
     *         in="header",
     *         type="string",
     *         description="Token de acesso",
     *         required=true,
     *     ),
     *     @SWG\Parameter(
     *         name="categoryId",
     *         in="path",
     *         type="integer",
     *         description="Id da categoria",
     *         required=true,
     *     ),
     *     @SWG\Response(
     *         response=200,
     *         description="OK",
     *     ),
     *     @SWG\Response(
     *         response=422,
     *         description="Missing Data"
     *     )
     * )
     */
    public function destroy($id)
    {
        $functionary = Functionary::findOrFail($id);
        $functionary->delete();
        return '';
    }
}
