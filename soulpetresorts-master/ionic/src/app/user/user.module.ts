import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxsModule} from '@ngxs/store';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';
import {BrMaskerModule} from 'br-mask';

import {UserRoutingModule} from './routers/user-routing.module';

import {UnityModule} from '../unity/unity.module';
import {HeaderModule} from '../shared/components/header/header.module';
import {FooterButtonModule} from '../shared/components/footer-button/footer-button.module';
import {FileModule} from '../shared/components/file/file.module';
import {ValidationMessageModule} from '../shared/components/validation-message/validation-message.module';

import {UserModalService} from './services/user-modal.service';

import {UserState} from './state/user/user.state';
import {UserModalState} from './state/user-modal/user-modal.state';

import {UserPage} from './containers/user/user.page';
import {UserCreatePage} from './containers/user-create/user-create.page';
import {UserTabsComponent} from './components/user-tabs/user-tabs.component';

@NgModule({
    declarations: [
        UserPage,
        UserCreatePage,
        UserTabsComponent
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        UserRoutingModule,
        NgxDatatableModule,
        BrMaskerModule,
        NgxsModule.forFeature([
            UserState,
            UserModalState
        ]),
        UnityModule,
        HeaderModule,
        FooterButtonModule,
        FileModule,
        ValidationMessageModule,
    ],
    providers: [
        UserModalService
    ],
    entryComponents: [
        UserCreatePage
    ]
})
export class UserModule {
}
