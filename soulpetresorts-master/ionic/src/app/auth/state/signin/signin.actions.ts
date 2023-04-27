import {SignInDto} from '../../../shared/dtos/signin.dto';

export class Signin {
    static readonly type = '[LOGIN] Signin';

    constructor(public payload: SignInDto) {
    }
}

export class SigninSuccess {
    static readonly type = '[LOGIN] SignIn Success';

    constructor(public payload: any) {
    }
}

export class SigninError {
    static readonly type = '[LOGIN] SignIn Error';

    constructor(public payload: any) {
    }
}

export class Logout {
    static readonly type = '[LOGIN] Logout';
}
