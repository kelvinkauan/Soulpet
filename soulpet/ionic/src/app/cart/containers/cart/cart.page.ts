import {Component, OnInit} from '@angular/core';

import {CashierSandbox} from '../../../cashier/cashier.sandbox';
import {CartSandbox} from '../../cart.sandbox';

@Component({
    selector: 'app-cart',
    templateUrl: './cart.page.html',
    styleUrls: ['./cart.page.scss'],
})
export class CartPage implements OnInit {

    public orderSelected$ = this.cartSandbox.orderSelected$;

    constructor(private cashierSandbox: CashierSandbox,
                private cartSandbox: CartSandbox) {
    }

    ngOnInit() {
        this.cartSandbox.loadOrder();
    }

    public applyDiscount($event) {
        this.cartSandbox.updateDiscount($event);
    }

    public changeQuantityItem($event) {
        this.cartSandbox.updateQuantityItem($event);
    }

    public onClickDelete($event) {
        this.cartSandbox.removeItem($event);
    }

    public onClickReceive() {
        this.cashierSandbox.openModal(true);
    }

}
