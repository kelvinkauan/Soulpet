import {Component, Input, OnInit} from '@angular/core';
import {AlertController} from '@ionic/angular';

import {PetSandbox} from '../../../pet/pet.sandbox';
import {TutorSandbox} from '../../tutor.sandbox';

import {UserModel} from '../../../shared/models/user.model';

@Component({
    selector: 'app-tutor-view',
    templateUrl: './tutor-view.page.html',
    styleUrls: ['./tutor-view.page.scss'],
})
export class TutorViewPage implements OnInit {

    @Input() tutor: UserModel;

    constructor(private alertController: AlertController,
                private petSandbox: PetSandbox,
                private tutorSandbox: TutorSandbox) {
    }

    ngOnInit() {
    }

    public openModelPet() {
        this.petSandbox.openModal(false);
    }

    public selectPet(pet) {
        this.petSandbox.openModal(true, pet);
    }

    public selectTutor(tutor) {
        this.tutorSandbox.selectTutor(tutor);
        this.tutorSandbox.openModal(true, tutor);
    }

    async confirmPet(pet) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o pet: <strong>${pet.name}</strong>?`,
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
                        this.petSandbox.deletePet(pet);
                    }
                }
            ]
        });
        await alert.present();
    }

    public openResponsibleModal() {
        this.tutorSandbox.openResponsibleModal(this.tutor);
    }
}
