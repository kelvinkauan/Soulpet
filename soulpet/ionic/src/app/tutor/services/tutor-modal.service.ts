import {Injectable} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {TutorCreatePage} from '../containers/tutor-create/tutor-create.page';

@Injectable()
export class TutorModalService {

    private modal;

    constructor(private modalController: ModalController) {
    }

    async open(editing, data?) {
        this.modal = await this.modalController.create({
            component: TutorCreatePage,
            componentProps: {isEditing: editing, form: data},
            cssClass: 'modal-full'
        });
        await this.modal.present();
    }

    close() {
        this.modal.dismiss();
    }

}
