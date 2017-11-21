<?php

namespace App\Providers;

use App\Models\User;
use App\Models\Product;
use App\Mail\UserCreated;
use App\Models\Inventory;
use App\Mail\UserMailChanged;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        User::created(function($user) {
            retry(5, function() use ($user) {
                Mail::to($user)->send(new UserCreated($user));
            }, 100);
        });
        User::updated(function($user) {
            if ($user->isDirty('email')) {
                retry(5, function() use ($user) {
                    Mail::to($user)->send(new UserMailChanged($user));
                }, 100);
            }
        });

        // Product::updated(function($product) {
        //     $get_current_stock = Inventory::where("product_id", $product->id)->first();
        //     if ($product->quantity == 0 && $product->estaDisponible()) {
        //         $product->status = Product::PRODUCTO_NO_DISPONIBLE;
        //         $product->save();
        //     }
        // });

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
