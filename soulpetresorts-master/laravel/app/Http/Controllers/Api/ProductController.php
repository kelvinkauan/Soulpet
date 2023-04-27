<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Product;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Product::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request['price_sale'] = ($request['price_sale']) ? str_replace(',', '.', $request->price_sale) : null;
        $request['price_cost'] = ($request['price_cost']) ? str_replace(',', '.', $request->price_cost) : null;
        $request['value_ipi'] = ($request['value_ipi']) ? str_replace(',', '.', $request->value_ipi) : null;
        $product = Product::create($request->all());
        return $product;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Product::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request['price_sale'] = ($request['price_sale']) ? str_replace(',', '.', $request->price_sale) : null;
        $request['price_cost'] = ($request['price_cost']) ? str_replace(',', '.', $request->price_cost) : null;
        $request['value_ipi'] = ($request['value_ipi']) ? str_replace(',', '.', $request->value_ipi) : null;
        $product = Product::findOrFail($id);
        $product->update($request->all());
        return $product;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        return $product;
    }
}
