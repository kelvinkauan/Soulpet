import {Component, OnInit} from '@angular/core';

import {VeterinarySandbox} from '../../veterinary.sandbox';

@Component({
    selector: 'app-veterinary',
    templateUrl: './veterinary.page.html',
    styleUrls: ['./veterinary.page.scss'],
})
export class VeterinaryPage implements OnInit {

    public rows: any[];

    constructor(private veterinarySandbox: VeterinarySandbox) {
    }

    ngOnInit() {
        setTimeout(() => {
            this.rows = [
                {
                    id: 1,
                    veterinario: 'Andressa Soares',
                    tutor: 'Andressa Soares',
                    pet: 'Fred',
                    data: '22/01/2020'
                }
            ];
        }, 500);
    }

    openModalVeterinaryCreate() {
        this.veterinarySandbox.openModalVeterinaryCreate();
    }

    openModalVeterinaryView() {
        this.veterinarySandbox.openModalVeterinaryView();
    }
}
