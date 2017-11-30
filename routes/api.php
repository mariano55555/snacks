<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


/**
 * PRODUCTS END-POINTS
 * Adding products
 * Removing products 
 * and set their stock quantity.
 * Obtain a list of all the available products. (INDEX)
    * * The list should have pagination functionality
    * * Search through the products by name.
 * Modify the price of the products (UPDATE)
 * Save a log of the price updates for a product. (UPDATE)
 * Liking a product (LIKE)
*/


// USERS ENDPOINTS
Route::resource('users', 'UsersController', ['except' => ['create', 'edit']]);
Route::name('verify')->get('users/verify/{token}', 'UsersController@verify');
Route::name('resend')->get('users/{user}/resend', 'UsersController@resend');


//PRODUCTS ENDPOINTS
Route::resource('products', 'ProductsController',['except' => ['edit', 'create']]);
Route::post('products/{product}/like', 'ProductsController@like');
Route::post('products/{product}/stock', 'ProductsController@setStock');
Route::post('products/{product}/price', 'ProductsController@setPrice');


//TRANSACTIONS ENDPOINTS
Route::resource('invoices', 'InvoicesController',['except' => ['edit', 'create', 'destroy', 'update']]);


// TOKEN GENERATOR
Route::post('oauth/token', '\Laravel\Passport\Http\Controllers\AccessTokenController@issueToken');


/**
 * Buy a product (INVOICE CREATE)
 * 
 *  ---Buying a product should reduce its stock. (INVENTORY-INVOICE)
 * 
 * Keep a log of all the purchases (who bought it, how many, when).
 * 
 * * The list should be sortable by name (default), and by popularity (likes) 

 

 
 * 
 */

