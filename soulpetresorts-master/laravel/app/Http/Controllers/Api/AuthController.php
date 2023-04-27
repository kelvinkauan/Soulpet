<?php

namespace App\Http\Controllers\Api;

use App\Models\Unity;
use App\Models\UnityCategory;
use App\Models\UnityService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Hash;
use App\Mail\ResetPassword;
use App\Models\User;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        if (!\Request()->token) {
            $this->middleware('auth:api', ['except' => ['login', 'logout', 'forgot', 'check', 'refresh']]);
        }
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $credentials = request(['email', 'password']);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['erro' => true, 'message' => 'Sem autorização.'], 401);
        }

        return $this->respondWithToken($token);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json([
            'id' => auth()->user()->id,
            'name' => auth()->user()->name,
            'email' => auth()->user()->email,
            'roles' => auth()->user()->roles,
            'avatar' => auth()->user()->avatar,
        ]);
    }


    /**
     * Check if user is logedin
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function check()
    {
        return response()->json(['token' => auth()->check()]);
    }


    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        if (auth()->check()) {
            return $this->respondWithToken(auth()->refresh());
        } else {
            return response()->json(['erro' => true, 'message' => 'Token Inválido']);
        }
    }

    /**
     * Get the token array structure.
     *
     * @param string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        if (auth()->user()->unity[0]['unity']) {
            $unityId = auth()->user()->unity[0]['unity'];
            $unity = Unity::findOrFail($unityId);
            $categories = UnityCategory::where('unity', $unityId)->get();
            $serviceShower = UnityService::where([['unity', '=', $unityId], ['type', 'LIKE', '%SHOWER']])->get();
            $serviceHotel = UnityService::where(['unity' => $unityId, 'type' => 'HOTEL'])->first();
            $serviceDaycare = UnityService::where([['unity', '=', $unityId], ['type', 'DAY_CARE']])->first();
        }
        return response()->json([
            'accessToken' => $token,
            'refreshToken' => $token,
            'IdToken' => $token,
            'tokenType' => 'bearer',
            'expiresIn' => auth('api')->factory()->getTTL() * 6000, // 60
            'user' => [
                'id' => auth()->user()->id,
                'unity' => $unity->id,
                'unityFull' => $unity,
                'categories' => ($categories) ? $categories : [],
                'serviceShower' => ($serviceShower) ? $serviceShower : [],
                'serviceHotel' => $serviceHotel,
                'serviceDaycare' => ($serviceDaycare) ? $serviceDaycare : [],
                'name' => auth()->user()->name,
                'email' => auth()->user()->email,
                'roles' => auth()->user()->roles,
                'avatar' => auth()->user()->avatar,
            ],
        ]);
    }


    public function forgot(Request $request)
    {
        if (!isset($request->token)) {
            $user = User::whereEmail($request->email)->first();

            if ($user) {
                $token = Hash::make($user->email) . "-" . Hash::make(now());
                $token = \str_replace('/', '-', $token);
                $table = DB::table('password_resets')->insert(['email' => $request->email, 'token' => $token, 'created_at' => now()]);
                return $this->sendResetToken($user, $token);
            }
        } else {
            return $this->newPass($request);
        }
    }

    public function doForgot($token)
    {
        if (!$reset = DB::table('password_resets')->where('token', $token)->first()) {
            return redirect('/forgot');
        }
    }

    private function sendResetToken($user, $token)
    {
        $data = $user;
        $data['token'] = $token;
        $data['to'] = $user->email;
        Mail::to($data['to'])->send(new ResetPassword($data));
        return response()->json([], 200);
    }

    public function newPass(Request $request)
    {
        if ($reset = DB::table('password_resets')->where('token', $request->token)->first()) {
            $user = User::whereEmail($reset->email)->first();

            if ($user->update(['password' => Hash::make($request->password)])) {
                DB::table('password_resets')->where('token', $request->token)->where('email', $user->email)->delete();
                return response()->json([], 200);
            }
            return response()->json([], 500);
        }
        return response()->json([], 404);
    }
}
