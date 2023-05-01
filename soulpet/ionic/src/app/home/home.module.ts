import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {HomeRoutingModule} from './routers/home-routing.module';

import {HeaderModule} from '../shared/components/header/header.module';

import {HomePage} from './containers/home/home.page';

@NgModule({
    declarations: [
        HomePage
    ],
    imports: [
        CommonModule,
        FormsModule,
        IonicModule,
        HomeRoutingModule,
        HeaderModule
    ]
})
export class HomeModule {
}
