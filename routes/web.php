<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/test', function () {
    echo 111;
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

  // printer Routes
  Route::group([
    'as'     => 'printer.',
    'prefix' => 'printer',
  ], function ()  {
    $namespacePrefix = 'Admin\\';
    Route::get('/', ['uses' => $namespacePrefix.'PrinterController@form', 'as' => 'form']);
    Route::post('/save', ['uses' => $namespacePrefix.'PrinterController@save', 'as' => 'save']);
  });


  // color Routes
  Route::group([
    'as'     => 'color.',
    'prefix' => 'color',
  ], function ()  {
    $namespacePrefix = 'Admin\\';
    Route::get('/', ['uses' => $namespacePrefix.'ColorController@form', 'as' => 'form']);
    Route::get('/delete/{id}', ['uses' => $namespacePrefix.'ColorController@delete', 'as' => 'delete']);
    Route::get('/save', ['uses' => $namespacePrefix.'ColorController@save', 'as' => 'save']);
  });

    // orders Routes
    Route::group([
        'as'     => 'order.',
        'prefix' => 'order',
    ], function ()  {
        $namespacePrefix = 'Admin\\';
        Route::get('/', ['uses' => $namespacePrefix.'OrderController@index', 'as' => 'index']);
        Route::get('/delete/{id}', ['uses' => $namespacePrefix.'OrderController@delete', 'as' => 'delete']);
        Route::get('/search', ['uses' => $namespacePrefix.'OrderController@search', 'as' => 'search']);
    });


});




