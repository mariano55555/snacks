<?php

namespace App\Providers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Invoice;
use App\Policies\UserPolicy;
use App\Policies\BuyerPolicy;
use Laravel\Passport\Passport;
use App\Policies\InvoicePolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Invoice::class => InvoicePolicy::class,
        User::class    => UserPolicy::class
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('admin-action', function($user) {
            return $user->isAdmin();
        });

        Passport::routes();
        Passport::tokensExpireIn(Carbon::now()->addDays(30));
        Passport::refreshTokensExpireIn(Carbon::now()->addDays(30));
        Passport::enableImplicitGrant();

        Passport::tokensCan([
            'purchase-product' => 'Crear transacciones para comprar productos',
            'manage-products'  => 'Crear, ver, actualizar y eliminar productos',
            'manage-account'   => 'Obtener la información de la cuenta, nombre, email, estado (Sin contraseña), modificar datos como email, nombre y contraseña. No puede eliminar la cuenta',
            'read-general'     => 'Obtner información general, categorias donde se compra y se vende, productos vendidos o comprados, transacciones, compras y ventas.'
        ]);
    }
}
