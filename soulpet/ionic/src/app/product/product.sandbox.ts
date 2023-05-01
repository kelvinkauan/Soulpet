import {Injectable} from '@angular/core';

import {Select, Store} from '@ngxs/store';

import {Observable} from 'rxjs';

import {ProductSelectors} from './state/product/product.selectors';

import {ProductModel} from '../shared/models/product.model';

import {
    SelectProduct,
    LoadProducts,
    CreateProduct,
    UpdateProduct,
    DeleteProduct,
    UploadImageProduct
} from './state/product/product.actions';
import {CloseProductModal, OpenProductModal} from './state/product-modal/product-modal.actions';
import {CloseProductViewModal, OpenProductViewModal} from './state/product-view-modal/product-view-modal.actions';
import {CloseImportModal, OpenImportModal} from './state/import-modal/import-modal.actions';

@Injectable({
    providedIn: 'root'
})
export class ProductSandbox {

    @Select(ProductSelectors.entities) productsCollection$: Observable<ProductModel[]>;

    @Select(ProductSelectors.selected) productSelected$: Observable<ProductModel>;

    @Select(ProductSelectors.image) imageProduct$: Observable<string>;

    @Select(ProductSelectors.isLoading) isLoadingProduct$: Observable<boolean>;

    @Select(ProductSelectors.isLoadingImage) isLoadingImageProduct$: Observable<boolean>;

    constructor(private store: Store) {
    }

    public selectProduct(product: ProductModel) {
        this.store.dispatch(new SelectProduct(product));
    }

    public loadProducts() {
        this.store.dispatch(new LoadProducts());
    }

    public createProduct(product: ProductModel) {
        this.store.dispatch(new CreateProduct(product));
    }

    public updateProduct(product: ProductModel) {
        this.store.dispatch(new UpdateProduct(product));
    }

    public deleteProduct(product: ProductModel) {
        this.store.dispatch(new DeleteProduct(product));
    }

    public uploadImageProduct(image: FormData) {
        this.store.dispatch(new UploadImageProduct(image));
    }

    public openModal(editing, data?) {
        this.store.dispatch(new OpenProductModal({editing, data}));
    }

    public closeModal() {
        this.store.dispatch(new CloseProductModal());
    }

    public openViewModal(data) {
        this.store.dispatch(new OpenProductViewModal(data));
    }

    public closeViewModal() {
        this.store.dispatch(new CloseProductViewModal());
    }

    public openImportModal() {
        this.store.dispatch(new OpenImportModal());
    }

    public closeImportModal() {
        this.store.dispatch(new CloseImportModal());
    }

}
