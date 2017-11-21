<?php

namespace App\Transformers;

use App\Models\Like;
use League\Fractal\TransformerAbstract;

class LikeTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(Like $like)
    {
        return [
            //
        ];
    }
}
