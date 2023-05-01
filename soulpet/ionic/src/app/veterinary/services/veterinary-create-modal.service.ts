import {Injectable} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {VeterinaryCreatePage} from '../containers/veterinary-create/veterinary-create.page';

@Injectable()
export class VeterinaryCreateModalService {

    private modal;

    constructor(private modalController: ModalController) {
    }

    async open() {
        this.modal = await this.modalController.create({
            component: VeterinaryCreatePage,
            cssClass: 'modal-full'
        });
        await this.modal.present();
    }

    close() {
        this.modal.dismiss();
    }

}
