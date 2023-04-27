<?php

use Illuminate\Http\Request;



// Rotas de autenticação
Route::group(['middleware' => ['api'], 'prefix' => 'auth'], function ($router) {
    Route::post('login', 'Api\AuthController@login')->name('login');
    Route::get('logout', 'Api\AuthController@logout');
    Route::post('forgot', 'Api\AuthController@forgot');
    Route::post('refresh', 'Api\AuthController@refresh');
    Route::post('me', 'Api\AuthController@me');
    Route::post('check', 'Api\AuthController@check');
});


//Rotas autenticadas
Route::group(['prefix' => '/', 'namespace' => 'Api\\', 'middleware' => ['auth:api']], function ($router) {

});

//Rotas Sem autenticaçao
Route::group(['prefix' => '/', 'namespace' => 'Api\\', 'middleware' => ['api']], function ($router) {
    // UNITY
    Route::apiResource('unit-categories', 'UnityCategoryController');
    Route::get('unit-categories/{unity}/load-per-unity', 'UnityCategoryController@loadPerUnity')->name('unit-categories.load-per-unity');
    Route::apiResource('unit-services', 'UnityServiceController');
    Route::get('unit-services/{unity}/load-sub-service', 'UnityServiceController@loadSubService')->name('unit-services.load-sub-service');
    Route::get('unit-services/{unity}/load-per-unity', 'UnityServiceController@loadPerUnity')->name('unit-services.load-per-unity');
    Route::get('unit-services/{unity}/load-showers', 'UnityServiceController@loadShowers')->name('unit-services.load-showers');
    Route::get('unit-services/{unity}/load-sub-showers', 'UnityServiceController@loadSubShowers')->name('unit-services.load-sub-showers');
    Route::get('unit-services/{unity}/load-transports', 'UnityServiceController@loadTransports')->name('unit-services.load-transports');
    Route::get('unit-services/{unity}/load-pet-sitters', 'UnityServiceController@loadPetSitters')->name('unit-services.load-pet-sitters');
    Route::get('unit-services/{unity}/load-day-cares', 'UnityServiceController@loadDayCares')->name('unit-services.load-day-cares');
    Route::get('unit-services/{unity}/load-hotels', 'UnityServiceController@loadHotels')->name('unit-services.load-hotels');
    Route::get('unit-services/{unity}/load-others', 'UnityServiceController@loadOthers')->name('unit-services.load-others');
    Route::get('unit-services/{service}/{size}', 'UnityServiceController@expectedTimeService')->name('unit-services.expected-time-service');
    Route::apiResource('unit-rooms', 'UnityRoomController');
    Route::apiResource('unit-districts', 'UnityDistrictController');
    Route::apiResource('unit-regions', 'UnityRegionController');
    Route::apiResource('unit-checks', 'UnityCheckController');
    Route::get('unit-checks/{unity}/load-per-unity', 'UnityCheckController@loadPerUnity')->name('unit-checks.load-per-unity');
    Route::apiResource('unit-price-variations', 'UnityPriceVariationController');
    Route::get('unit-price-variations/{unity}/load-per-unity', 'UnityPriceVariationController@loadPerUnity')->name('unit-price-variations.load-per-unity');
    Route::apiResource('units', 'UnityController');
    Route::get('units/{unity}/rest-days', 'UnityController@restDays')->name('units.rest-days');
    // CLOSE UNITY

    // TUTORS AND USERS
    Route::apiResource('users', 'UserController');
    Route::get('users/{unity}/load-per-admin', 'UserController@loadPerAdmin')->name('users.load-per-admin');
    Route::post('users/update-unity', 'UserController@updateUnity')->name('users.update-unity');
    Route::get('users/search/term', 'UserController@search')->name('users.search.term');
    // CLOSE TUTORS AND USERS

    // PETS
    Route::apiResource('pet-behaviors', 'PetBehaviorController');
    Route::apiResource('pet-breeds', 'PetBreedController');
    Route::apiResource('pet-sizes', 'PetSizeController');
    Route::apiResource('pet-type-furs', 'PetTypeFurController');
    Route::apiResource('pet-types', 'PetTypeController');
    Route::apiResource('pet-evaluation', 'PetEvaluationController');
    Route::get('pet-evaluation/{pet}/load-per-pet', 'PetEvaluationController@loadPerPet')->name('pets.load-per-pet');
    Route::apiResource('pets', 'PetController');
    Route::get('pets/{user}/load-per-tutor', 'PetController@loadPerTutor')->name('pets.load-per-tutor');
    // CLOSE PETS

    // SCHEDULE
    Route::apiResource('schedules', 'ScheduleController');
    Route::get('schedules/{unity}/daycare', 'ScheduleController@daycare')->name('schedules.daycare');
    // CLOSE SCHEDULES

    // ORDER
    Route::apiResource('unit-orders', 'UnityOrderController');
    Route::post('unit-orders/destroy', 'UnityOrderController@destroy')->name('unit-orders.destroy');
    Route::post('unit-orders/update-discount', 'UnityOrderController@updateDiscount')->name('unit-orders.update-discount');
    // CLOSE ORDER

    // UPLOAD IMAGE
    Route::post('upload-image', 'UploadImageController@uploadImage');
    // CLOSE UPLOAD IMAGE

    // VIA CEP
    Route::get('cep/{cep}', 'ViaCepController@index');
    // CLOSE VIA CEP

    // HOLIDAYS
    Route::get('holidays', 'HolidayController@index');
    // CLOSE HOLIDAYS

    Route::apiResource('cities', 'CityController');
    Route::apiResource('functionaries', 'FunctionaryController');
    Route::apiResource('plans', 'PlanController');
    Route::apiResource('products', 'ProductController');
    Route::apiResource('provinces', 'ProvinceController');
    Route::apiResource('rations', 'RationController');
    Route::apiResource('useradresses', 'UserAdressController');
    Route::apiResource('userdatas', 'UserDataController');

    //rotas de upload
    Route::post('/createImagem', 'UploadPhoto@createImagem');
    Route::post('/salvarfoto_flutter/{user_id}', 'UploadPhoto@gravarFotoAvatar');

    Route::apiResource('terms', 'TermsController');
    Route::apiResource('rules-manual', 'RulesManualController');

    Route::get('invoice', 'InvoiceController@index');

});
