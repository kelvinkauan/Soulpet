import {Component, OnInit} from '@angular/core';

import {TutorSandbox} from '../../../tutor/tutor.sandbox';
import {PetSandbox} from '../../pet.sandbox';

@Component({
    selector: 'app-pet',
    templateUrl: './pet.page.html',
    styleUrls: ['./pet.page.scss'],
})
export class PetPage implements OnInit {

    public petsCollection$ = this.petSandbox.petsCollection$;

    constructor(private tutorSandbox: TutorSandbox, private petSandbox: PetSandbox) {
    }

    ngOnInit() {
        this.petSandbox.loadPets();
    }

    openModalTutor() {
        this.tutorSandbox.openModal(false);
    }

    openModalService(pet) {
        this.petSandbox.selectPet(pet);
        this.petSandbox.openModalService(pet);
    }

}
