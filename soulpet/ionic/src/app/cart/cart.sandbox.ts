import {Injectable} from '@angular/core';

import {Select, Store} from '@ngxs/store';
import {Observable} from 'rxjs';

import {OrderSelectors} from './state/order/order.selectors';

import {OrderModel} from '../shared/models/order.model';
import {ProductModel} from '../shared/models/product.model';
import {ServiceModel} from '../shared/models/service.model';

import {LoadOrder, AddItem, UpdateDiscount, UpdateItem, RemoveItem} from './state/order/order.actions';

import {SessionSandbox} from '../session/session.sandbox';

@Injectable({
    providedIn: 'root'
})
export class CartSandbox {

    @Select(OrderSelectors.selected) orderSelected$: Observable<OrderModel>;

    constructor(private store: Store,
                private sessionSandbox: SessionSandbox) {
    }

    public addItem(item: ProductModel | ServiceModel) {
        this.store.dispatch(new AddItem(item));
    }

    public updateDiscount(amount) {
        this.store.dispatch(new UpdateDiscount(amount));
    }

    public updateQuantityItem(item) {
        this.store.dispatch(new UpdateItem(item));
    }

    public removeItem(item: ProductModel | ServiceModel) {
        this.store.dispatch(new RemoveItem(item));
    }

    public loadOrder() {
        this.store.dispatch(new LoadOrder(this.sessionSandbox.userData));
    }

}
