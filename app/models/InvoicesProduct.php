<?php

namespace App\Models;

use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class InvoicesProduct extends Model
{
    use Userstamps, SoftDeletes;
    
    protected $table = 'invoices_products';
    //
    protected $fillable = [
        'invoice_id', 'product_id', 'quantity', 'unit_price', 'total_price'
    ];
        
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at','created_at', 'updated_at'];
}
