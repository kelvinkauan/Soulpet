import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';

import {NgxsModule} from '@ngxs/store';

import {CashierRoutingModule} from './routers/cashier-routing.module';

import {ReceiveModalService} from './services/receive-modal.service';

import {ReceiveModalState} from './state/receive-modal/receive-modal.state';

import {HeaderModule} from '../shared/components/header/header.module';
import {HeaderModalModule} from '../shared/components/header-modal/header-modal.module';
import {FooterModalModule} from '../shared/components/footer-modal/footer-modal.module';

import {CashierPage} from './containers/cashier/cashier.page';
import {CashierReceivePage} from './containers/cashier-receive/cashier-receive.page';
import {CashierTabsComponent} from './components/cashier-tabs/cashier-tabs.component';
import {CashierCardComponent} from './components/cashier-card/cashier-card.component';

@NgModule({
    declarations: [
        CashierPage,
        CashierReceivePage,
        CashierTabsComponent,
        CashierCardComponent
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        NgxDatatableModule,
        CashierRoutingModule,
        NgxsModule.forFeature([
            ReceiveModalState
        ]),
        HeaderModule,
        HeaderModalModule,
        FooterModalModule
    ],
    providers: [
        ReceiveModalService
    ],
    entryComponents: [
        CashierReceivePage
    ]
})
export class CashierModule {
}
