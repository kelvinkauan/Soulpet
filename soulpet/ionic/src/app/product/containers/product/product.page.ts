import {Component, OnInit} from '@angular/core';

import {AlertController} from '@ionic/angular';

import {ProductSandbox} from '../../product.sandbox';

@Component({
    selector: 'app-product',
    templateUrl: './product.page.html',
    styleUrls: ['./product.page.scss'],
})
export class ProductPage implements OnInit {

    public productsCollection$ = this.productSandbox.productsCollection$;

    public isLoading$;

    public CATEGORY = ['', 'Acessórios', 'Medicamentos', 'Petiscos', 'Rações', 'Shampoos', 'Venenos'];

    constructor(private productSandbox: ProductSandbox, private alertController: AlertController) {
    }

    ngOnInit() {
        this.productSandbox.loadProducts();
    }

    public presentModal() {
        this.productSandbox.openModal(false);
    }

    public openImportModal() {
        this.productSandbox.openImportModal();
    }

    public selectProduct(product) {
        this.productSandbox.openModal(true, product);
    }

    public presentViewModal(product) {
        this.productSandbox.openViewModal(product);
    }

    async confirmProduct(product) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o produto: <strong>${product.description}</strong>?`,
            buttons: [
                {
                    text: 'Cancelar',
                    role: 'cancel',
                    cssClass: 'secondary',
                    handler: () => {
                        console.log('Cancelou');
                    }
                }, {
                    text: 'Sim',
                    handler: () => {
                        this.productSandbox.deleteProduct(product);
                    }
                }
            ]
        });
        await alert.present();
    }
}
