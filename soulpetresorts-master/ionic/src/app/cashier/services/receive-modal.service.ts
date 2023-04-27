import {Injectable} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {CashierReceivePage} from '../containers/cashier-receive/cashier-receive.page';

@Injectable()
export class ReceiveModalService {

    private modal;

    constructor(private modalController: ModalController) {
    }

    async open(editing, data?) {
        this.modal = await this.modalController.create({
            component: CashierReceivePage,
            componentProps: {isEditing: editing, form: data},
            cssClass: 'modal-lg'
        });
        await this.modal.present();
    }

    close() {
        this.modal.dismiss();
    }

}
