<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\UnityService;
use Illuminate\Http\Request;

use App\Models\Schedule;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $schedules = Schedule::all();
        foreach ($schedules as $schedule) {
            $schedule->category = ($schedule->category()->first()) ? $schedule->category()->first() : [];
            $schedule->service = ($schedule->service()->first()) ? $schedule->service()->first() : [];
            $schedule->pet = ($schedule->pet()->first()) ? $schedule->pet()->first() : [];

            $timestamp = strtotime($schedule->hour) + ($schedule->time * 60);
            $hour = strftime('%H:%M:%S', $timestamp);

            $schedule->title = ($schedule->category) ? $schedule->category['description'] : $schedule->service['description'];
            $schedule->title .= ': ' . $schedule->pet['name'];

            if ($schedule->service) {
                if ($schedule->service['type'] === 'HOTEL') {
                    $schedule->startTime = $schedule->date_checkin . ' ' . $schedule->hour_checkin;
                    $schedule->endTime = $schedule->date_checkout . ' ' . $schedule->hour_checkout;
                } else {
                    $schedule->startTime = $schedule->date . ' ' . $schedule->hour;
                    $schedule->endTime = $schedule->date . ' ' . $hour;
                }
            } else {
                $schedule->startTime = $schedule->date_checkin . ' ' . $schedule->hour_checkin;
                $schedule->endTime = $schedule->date_checkin . ' ' . $schedule->hour_checkout;
            }

            $schedule->allDay = false;
            $schedule->desc = ($schedule->category) ? $schedule->category['description'] : $schedule->service['description'];
            $schedule->desc .= ': ' . $schedule->pet['name'];
        }
        return $schedules;
    }

    public function daycare($id)
    {
        $schedules = Schedule::whereNotNull('category')->get();
        foreach ($schedules as $schedule) {
            $schedule->pet = ($schedule->pet()->first()) ? $schedule->pet()->first() : [];
            $schedule->pet->user = ($schedule->pet->user()->first()) ? $schedule->pet->user()->first() : [];
        }
        return $schedules;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Responses
     */
    public function store(Request $request)
    {
        $request['unity'] = auth()->user()->unity[0]['unity'];
        $service = UnityService::where([['service', $request->service], ['size', $request->pet['size']['id']]])->first();
        if ($service) {
            if ($request['date_checkin']) {
                $request['date_checkin'] = date('Y-m-d', strtotime($request->date_checkin));
                $request['hour_checkin'] = date('H:i:s', strtotime($request->hour_checkin));
                $request['date_checkout'] = date('Y-m-d', strtotime($request->date_checkout));
                $request['hour_checkout'] = date('H:i:s', strtotime($request->hour_checkout));

                $request['room'] = ($request['room']) ? $request->room['id'] : null;
                $request['pet'] = $request->pet['id'];

                if ($request->room['id']) {
                    $resort_check = Schedule::where([
                            'date_checkin' => $request['date_checkin'],
                            'room' => $request['room'],
                            'pet' => $request['pet']]
                    )->exists();
                    if ($resort_check) {
                        return response()->json(['erro' => true, 'message' => 'Hóspede já está com a reserva para este quarto neste dia'], 500);
                    } else {
                        $schedule = Schedule::create($request->all());
                        $schedule['service'] = $service;
                        return $schedule;
                    }
                } else {
                    $schedule = Schedule::create($request->all());
                    $schedule['service'] = $service;
                    return $schedule;
                }
            }

            $request['date'] = date('Y-m-d', strtotime($request->date));
            $request['hour'] = date('H:i:s', strtotime($request->hour));

            $request['pet'] = $request->pet['id'];
            $request['service'] = $request->service;
            $request['user'] = $request->user['id'];

            $schedule = Schedule::create($request->all());
            $schedule['service'] = $service;
            return $schedule;
        } else {
            return response()->json(['erro' => true, 'message' => 'Serviço não encontrato para o porte do pet!'], 500);
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
        return Schedule::findOrFail($id);
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
        $request['date'] = date('Y-m-d', strtotime($request->date));
        $request['hour'] = date('H:i:s', strtotime($request->hour));

        $request['pet'] = $request->pet['id'];
        $request['service'] = $request->service['id'];
        $request['user'] = $request->user['id'];

        $schedule = Schedule::findOrFail($id);
        $schedule->update($request->all());
        return $schedule;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $schedule = Schedule::findOrFail($id);
        $schedule->delete();
        return $schedule;
    }
}
