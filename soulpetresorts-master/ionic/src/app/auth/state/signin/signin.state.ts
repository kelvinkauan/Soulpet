import {Navigate} from '@ngxs/router-plugin';
import {Action, Selector, State, StateContext} from '@ngxs/store';
import {catchError, map} from 'rxjs/operators';

import {
    Signin,
    SigninError,
    SigninSuccess,
    Logout
} from './signin.actions';
import {UpdateSessionToken} from '../../../session/state/session.actions';

import {AlertService} from '../../../shared/components/alert/services/alert.service';
import {AuthService} from '../../services/auth.service';

export interface SigninStateModel {
    loading: boolean;
}

@State<SigninStateModel>({
    name: 'signin',
    defaults: {
        loading: false
    }
})
export class SigninState {

    @Selector()
    static loading(state: SigninStateModel) {
        return state.loading;
    }

    constructor(private authService: AuthService,
                private alertService: AlertService) {
    }

    @Action(Signin)
    signin(ctx: StateContext<SigninStateModel>, {payload}: Signin) {
        ctx.patchState({loading: true});
        return this.authService.signin(payload).pipe(
            map((data) => ctx.dispatch(new SigninSuccess(data))),
            catchError((error) => ctx.dispatch(new SigninError(error.message)))
        );
    }

    @Action(SigninSuccess)
    signinSuccess(ctx: StateContext<SigninStateModel>, {payload}: SigninSuccess) {
        ctx.dispatch(new Navigate(['/main']));
        ctx.dispatch(new UpdateSessionToken(payload));
        ctx.patchState({loading: false});
    }

    @Action(SigninError)
    async signinError(ctx: StateContext<SigninStateModel>, {payload}: SigninError) {
        ctx.patchState({loading: false});
        this.alertService.presentAlert('Erro', payload, 'danger', 2000);
    }

    @Action(Logout)
    logout(ctx: StateContext<Logout>) {
        return this.authService.logout();
    }

}
