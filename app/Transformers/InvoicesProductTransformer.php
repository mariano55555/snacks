<?php

namespace App\Transformers;

use App\Models\InvoicesProduct;
use League\Fractal\TransformerAbstract;

class InvoicesProductTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(InvoicesProduct $detail)
    {
        return [
            //
        ];
    }
}
