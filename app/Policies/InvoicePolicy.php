<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Invoice;
use App\Traits\AdminActions;
use Illuminate\Auth\Access\HandlesAuthorization;

class InvoicePolicy
{
    use HandlesAuthorization, AdminActions;

    /**
     * Determine whether the user can view the invoice.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Invoice  $invoice
     * @return mixed
     */
    public function view(User $user, Invoice $invoice)
    {
        return $user->id === $invoice->user_id;
    }

    /**
     * Determine whether the user can create invoices.
     *
     * @param  \App\Models\User  $user
     * @return mixed
     */
    public function create(User $user, Invoice $invoice)
    {
        return $user->id === $invoice->user_id;
    }

}
