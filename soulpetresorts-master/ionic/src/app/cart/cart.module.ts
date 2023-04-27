import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';
import {BrMaskerModule} from 'br-mask';

import {NgxsModule} from '@ngxs/store';

import {CartRoutingModule} from './routers/cart-routing.module';

import {OrderState} from './state/order/order.state';

import {HeaderModule} from '../shared/components/header/header.module';

import {CartPage} from './containers/cart/cart.page';
import {CartItensPage} from './components/cart-itens/cart-itens.page';
import {CartTotalPage} from './components/cart-total/cart-total.page';
import {CartDiscountPage} from './components/cart-discount/cart-discount.page';

@NgModule({
    declarations: [
        CartPage,
        CartItensPage,
        CartTotalPage,
        CartDiscountPage
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        NgxDatatableModule,
        BrMaskerModule,
        CartRoutingModule,
        NgxsModule.forFeature([
            OrderState
        ]),
        HeaderModule
    ],
    providers: [],
    entryComponents: []
})
export class CartPageModule {
}
