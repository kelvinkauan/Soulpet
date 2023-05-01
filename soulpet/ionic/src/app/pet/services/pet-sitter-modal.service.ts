import {Injectable} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {PetSitterPage} from '../containers/pet-sitter/pet-sitter.page';

@Injectable()
export class PetSitterModalService {

    private modal;

    constructor(private modalController: ModalController) {
    }

    async open() {
        this.modal = await this.modalController.create({
            component: PetSitterPage,
            cssClass: 'modal-full'
        });
        await this.modal.present();
    }

    close() {
        this.modal.dismiss();
    }

}
