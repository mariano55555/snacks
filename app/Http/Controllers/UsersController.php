<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Mail\UserCreated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Transformers\UserTransformer;
use App\Http\Controllers\ApiController;

class UsersController extends ApiController
{

    public function __construct()
    {
        $this->middleware("client.credentials")->only(["store", "resend"]);
        $this->middleware("auth:api")->except(["store", "resend", "verify"]);
        $this->middleware("transform.input:" . UserTransformer::class)->only(["store", "update"]);
        $this->middleware("can:view,user")->only("show");
        $this->middleware("can:update,user")->only("update");
        $this->middleware("can:delete,user")->only("destroy");
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->allowedAdminAction();
        $users = User::all();
        return $this->showAll($users);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $rules = [
            'name'     => 'required',
            'email'    => 'required|email|unique:users',
            'password' => 'required|min:6|confirmed'
        ];
        

        $this->validate($request, $rules);

        $fields = $request->all();
        $fields["password"]           = bcrypt($request->password);
        $fields["active"]             = User::USER_NOT_VERIFIED;
        $fields["verification_token"] = User::generateVerificationToken();
        

        $user = User::create($fields);
        $user->role()->attach(User::USER_REGULAR);
        return $this->showOne($user, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        $this->allowedAdminAction();
        return $this->showOne($user);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $rules = [
            'email'    => 'email|unique:users,email,'.$user->id,
            'password' => 'min:6|confirmed',
            'admin'    => 'in:' . User::USER_ADMIN . ',' . User::USER_REGULAR,
        ];
        

        $this->validate($request, $rules);

        if($request->has("name")){
            $user->name = $request->name;
        }

        if($request->has("email") && $user->email != $request->email){
            $user->active             = User::USER_NOT_VERIFIED;
            $user->verification_token = User::generateVerificationToken();
            $user->email              = $request->email;
        }
        
        if($request->has("password")){
            $user->password = bcrypt($request->password);
        }

        if ($request->has('admin')) {
            $this->allowedAdminAction();
            
            if (!$user->userIsActivated()) {
                return $this->errorResponse('Only verified users can change their role', 409);
            }

            if( $request->admin == 1 && !$user->isAdmin()){
                return $this->errorResponse('Only admin users can update roles', 409);
            }
        }
        if (!$user->isDirty()) {
            return $this->errorResponse('You must specify at least one different field to update', 422);
        }
        $user->save();
        $user->role()->sync($request->admin);
        return $this->showOne($user);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $this->allowedAdminAction();
        $user->delete();
        return $this->showOne($user);
    }


    public function verify($token)
    {
        $user = User::where('verification_token', $token)->firstOrFail();
        $user->active = User::USER_VERIFIED;
        $user->verification_token = null;
        $user->save();
        return $this->showMessage('The account has been verified');
    }
    
    public function resend(User $user)
    {
        if ($user->userIsActivated()) {
            return $this->errorResponse('The user is already verified.', 409);
        }
        retry(5, function() use ($user) {
            Mail::to($user)->send(new UserCreated($user));
        }, 100);
        return $this->showMessage('El correo de verificación se ha reenviado');
    }



}
