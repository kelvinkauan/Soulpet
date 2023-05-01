import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {Observable} from 'rxjs';

import {OrderModel} from '../models/order.model';
import {ProductModel} from '../models/product.model';
import {ServiceModel} from '../models/service.model';

import {environment} from '../../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class OrderResource {
    private ordersUrl = `${environment.api}/unit-orders`;

    constructor(private http: HttpClient) {
    }

    find(): Observable<OrderModel[]> {
        return this.http.get<OrderModel[]>(this.ordersUrl);
    }

    findOne(payload: number): Observable<OrderModel> {
        return this.http.get<OrderModel>(`${this.ordersUrl}/${payload}`);
    }

    create(payload: ProductModel | ServiceModel): Observable<OrderModel> {
        return this.http.post<OrderModel>(this.ordersUrl, payload);
    }

    update(payload: { item: ProductModel | ServiceModel, quantity: number }): Observable<OrderModel> {
        return this.http.patch<OrderModel>(`${this.ordersUrl}/${payload.quantity}`, payload.item);
    }

    updateDiscount(payload: number): Observable<OrderModel> {
        return this.http.post<OrderModel>(`${this.ordersUrl}/update-discount`, {discount: payload});
    }

    destroy(payload: ProductModel | ServiceModel) {
        return this.http.post(`${this.ordersUrl}/destroy`, payload);
    }
}
