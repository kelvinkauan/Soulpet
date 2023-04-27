import {Injectable} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {PetPackagePage} from '../containers/pet-package/pet-package.page';

@Injectable()
export class PetPackageModalService {

    private modal;

    constructor(private modalController: ModalController) {
    }

    async open(data) {
        this.modal = await this.modalController.create({
            component: PetPackagePage,
            componentProps: {pet: data},
            cssClass: 'modal-full'
        });
        await this.modal.present();
    }

    close() {
        this.modal.dismiss();
    }

}
