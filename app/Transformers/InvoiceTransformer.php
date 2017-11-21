<?php

namespace App\Transformers;

use App\Models\Invoice;
use League\Fractal\TransformerAbstract;

class InvoiceTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(Invoice $invoice)
    {
        return [
            'identifier'  => (int)$invoice->id,
            'buyer'       => isset($invoice->user->name) ? (string)$invoice->user->name: null,
            'quantity'    => isset($invoice->transactions[0]->pivot->quantity) ? (int) $invoice->transactions[0]->pivot->quantity:null,
            'product'     => isset($invoice->transactions[0]->name) ? (string) $invoice->transactions[0]->name:null,
            'unit_price'  => isset($invoice->transactions[0]->pivot->unit_price) ? (float) $invoice->transactions[0]->pivot->unit_price: null,
            'tota_price'  => isset($invoice->transactions[0]->pivot->total_price) ? (float) $invoice->transactions[0]->pivot->total_price: null,
            'dateCreated' => (string)$invoice->created_at,
            'dateUpdated' => (string)$invoice->updated_at,
            'dateDeleted' => isset($invoice->deleted_at) ? (string) $invoice->deleted_at: null,
            'links' => [
                [
                    'rel' => 'self',
                    'href' => route("invoices.show", $invoice->id)
                ]
            ]
        ];
    }

    public static function originalAttribute($index)
    {
        $attributes = [
            'identifier'  => 'id',
            'buyer'       => 'user_id',
            'quantity'    => 'quantity',
            'product'     => 'product',
            'dateCreated' => 'created_at',
            'dateUpdated' => 'updated_at',
            'dateDeleted' => 'deleted_at',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }

    public static function transformedAttribute($index)
    {
        $attributes = [
            'id'         => 'identifier',
            'user_id'    => 'buyer',
            'product' => 'product',
            'quantity'   => 'quantity',
            'created_at' => 'dateCreated',
            'updated_at' => 'dateUpdated',
            'deleted_at' => 'dateDeleted',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }
}
