import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {MainRoutingModule} from './routers/main-routing.module';

import {UnityModule} from '../unity/unity.module';

import {MainPage} from './containers/main/main.page';
import {MenuHeaderComponent} from './components/menu-header/menu-header.component';
import {MenuContentComponent} from './components/menu-content/menu-content.component';

@NgModule({
    declarations: [
        MainPage,
        MenuHeaderComponent,
        MenuContentComponent
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        MainRoutingModule,
        UnityModule
    ]
})
export class MainModule {
}
