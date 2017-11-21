<?php

namespace App\Transformers;

use App\Models\User;
use League\Fractal\TransformerAbstract;

class UserTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(User $user)
    {
        return [
            'identifier' => (int)$user->id,
            'full_name' => (string)$user->name,
            'email' => (string)$user->email,
            'isVerified' => (int)$user->active,
            'dateCreated' => (string)$user->created_at,
            'dateUpdated' => (string)$user->updated_at,
            'dateDeleted' => isset($user->deleted_at) ? (string) $user->deleted_at : null,
            'links' => [
                [
                    'rel' => 'self',
                    'href' => route("users.show", $user->id)
                ]
            ]
        ];
    }

    public static function originalAttribute($index)
    {
        $attributes = [
            'identifier' => 'id',
            'full_name' => 'name',
            'email' => 'email',
            'password' => 'password',
            'password_confirmation' => 'password_confirmation',
            'admin' => 'admin',
            'isVerified' => 'active',
            'dateCreated' => 'created_at',
            'dateUpdated' => 'updated_at',
            'dateDeleted' => 'deleted_at',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }

    public static function transformedAttribute($index)
    {
        $attributes = [
            'id' => 'identifier',
            'name' => 'full_name',
            'email' => 'email',
            'password' => 'password',
            'password_confirmation' => 'password_confirmation',
            'admin' => 'admin',
            'active' => 'isVerified',
            'created_at' => 'dateCreated',
            'updated_at' => 'dateUpdated',
            'deleted_at' => 'dateDeleted',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }
}
