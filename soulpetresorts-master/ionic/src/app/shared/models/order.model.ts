import {UnityModel} from './unity.model';
import {UserModel} from './user.model';
import {ProductModel} from './product.model';
import {ServiceModel} from './service.model';

export interface OrderModel {
    id?: number;
    unity: UnityModel;
    user: UserModel;
    payment_form: string;
    quantity: number;
    amount: number;
    discount: number;
    status: string;
    products: ProductModel[];
    services: ServiceModel[];
}
