import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';

import {IonicModule} from '@ionic/angular';

import {ReportRoutingModule} from './routers/report-routing.module';

import {HeaderModule} from '../shared/components/header/header.module';

import {ReportPage} from './containers/report/report.page';

@NgModule({
    declarations: [
        ReportPage
    ],
    imports: [
        CommonModule,
        IonicModule,
        ReportRoutingModule,
        HeaderModule
    ]
})
export class ReportModule {
}
