import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';

import {NgxsModule} from '@ngxs/store';

import {DaycareModalState} from './state/daycare-modal/daycare-modal.state';

import {DaycareModalService} from './services/daycare-modal.service';

import {DaycareRoutingModule} from './routers/daycare-routing.module';
import {HeaderModule} from '../shared/components/header/header.module';

import {DailyPage} from './containers/daily/daily.page';
import {DaycarePage} from './containers/daycare/daycare.page';
import {DaycareCheckPage} from './containers/daycare-check/daycare-check.page';
import {DaycareClassPage} from './containers/daycare-class/daycare-class.page';
import {DailyCardsPage} from './components/daily-cards/daily-cards.page';

@NgModule({
    declarations: [
        DailyPage,
        DaycarePage,
        DaycareCheckPage,
        DaycareClassPage,
        DailyCardsPage
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        NgxDatatableModule,
        DaycareRoutingModule,
        NgxsModule.forFeature([
            DaycareModalState
        ]),
        HeaderModule
    ],
    providers: [
        DaycareModalService
    ],
    entryComponents: [
        DaycarePage,
        DaycareCheckPage,
        DaycareClassPage
    ]
})
export class DaycareModule {
}
