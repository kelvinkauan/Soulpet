<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\UnityOrderService;
use App\Models\UnityService;
use Illuminate\Http\Request;

use App\Models\UnityOrder;
use App\Models\UnityOrderProduct;

class UnityOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $order = UnityOrder::where(['user' => auth()->user()->id, 'status' => 'Aberta'])->first();
        if (!$order) {
            $data_order = [
                'unity' => auth()->user()->unity[0]['unity'],
                'user' => auth()->user()->id,
                'status' => 'Aberta'
            ];
            $order = UnityOrder::create($data_order);
        }

        if ($request->service) {
            $order_service = UnityOrderService::where(['order' => $order->id, 'service' => $request->id])->first();
            if ($order_service) {
                $quantity = $order_service->quantity + 1;
                $amount = $request->price * $quantity;
                UnityOrderService::where(['id' => $order_service->id])->update([
                    'quantity' => $quantity,
                    'amount' => $amount
                ]);
            } else {
                $quantity = 1;
                $amount = $request->price;
                UnityOrderService::create([
                    'order' => $order->id,
                    'service' => $request->id,
                    'quantity' => $quantity,
                    'amount' => $amount
                ]);
            }
        } else {
            $order_product = UnityOrderProduct::where(['order' => $order->id, 'product' => $request->id])->first();
            if ($order_product) {
                $quantity = $order_product->quantity + 1;
                $amount = $request->price_sale * $quantity;
                UnityOrderProduct::where(['id' => $order_product->id])->update([
                    'quantity' => $quantity,
                    'amount' => $amount
                ]);
            } else {
                $quantity = 1;
                $amount = $request->price_sale;
                UnityOrderProduct::create([
                    'order' => $order->id,
                    'product' => $request->id,
                    'quantity' => $quantity,
                    'amount' => $amount
                ]);
            }
        }

        return $this->show(auth()->user()->id);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->updateAmountOrder();
        $order = UnityOrder::where(['user' => $id, 'status' => 'Aberta'])->first();
        if ($order) {
            $order->products = ($order->products()->get()) ? $order->products()->get() : [];
            foreach ($order->products as $product) {
                $product->product = ($product->product()->first()) ? $product->product()->first() : [];
            }
            $order->services = ($order->services()->get()) ? $order->services()->get() : [];
            foreach ($order->services as $service) {
                $service->service = ($service->service()->first()) ? $service->service()->first() : [];
                $unityService = UnityService::where(['id' => $service->service['service']])->first();
                $service->service['description'] = $unityService->description;
            }
            return $order;
        }
        return [];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $quantity)
    {
        $order = UnityOrder::where(['user' => auth()->user()->id, 'status' => 'Aberta'])->first();
        if ($quantity <= 0) {
            UnityOrderProduct::where(['order' => $order->id, 'product' => $request->id])->delete();
        } else {
            $order_product = UnityOrderProduct::where(['order' => $order->id, 'product' => $request->id])->first();
            $amount = $request->price_sale * $quantity;
            UnityOrderProduct::where(['id' => $order_product->id])->update([
                'quantity' => $quantity,
                'amount' => $amount
            ]);
        }
        return $this->show(auth()->user()->id);
    }

    public function updateDiscount(Request $request)
    {
        $order = UnityOrder::where(['user' => auth()->user()->id, 'status' => 'Aberta'])->first();
        UnityOrder::where(['id' => $order->id])->update(['discount' => $request->discount]);
        return $this->show(auth()->user()->id);
    }

    public function updateAmountOrder()
    {
        $order = UnityOrder::where(['user' => auth()->user()->id, 'status' => 'Aberta'])->first();
        if ($order) {
            $amount = 0;
            $order_products = UnityOrderProduct::where(['order' => $order->id])->get();
            foreach ($order_products as $order_product) {
                $amount += $order_product->amount;
            }
            $order_services = UnityOrderService::where(['order' => $order->id])->get();
            foreach ($order_services as $order_service) {
                $amount += $order_service->amount;
            }
            UnityOrder::where(['id' => $order->id])->update(['amount' => $amount]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $order = UnityOrder::where(['user' => auth()->user()->id, 'status' => 'Aberta'])->first();
        if ($request->service) {
            UnityOrderService::where(['order' => $order->id, 'service' => $request->id])->delete();
        } else {
            UnityOrderProduct::where(['order' => $order->id, 'product' => $request->id])->delete();
        }
        return $this->show(auth()->user()->id);
    }
}
