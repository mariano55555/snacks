@component('mail::message')
# Hello {{$user->name}}

You have changed your email address. Please, verify the new address using the following button:

@component('mail::button', ['url' => route('verify', $user->verification_token)])
Confirm my account
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent