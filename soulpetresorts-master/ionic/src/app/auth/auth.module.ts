import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxsModule} from '@ngxs/store';

import {SigninState} from './state/signin/signin.state';

import {AlertModule} from '../shared/components/alert/alert.module';

import {AuthRoutingModule} from './routers/auth-routing.module';

import {LoginPage} from './containers/login/login.page';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        AlertModule,
        AuthRoutingModule,
        NgxsModule.forFeature([
            SigninState
        ])
    ],
    declarations: [
        LoginPage
    ]
})
export class AuthModule {
}
