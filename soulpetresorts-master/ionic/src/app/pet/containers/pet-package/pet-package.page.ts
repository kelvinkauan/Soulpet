import {Component, Input, OnInit} from '@angular/core';

import {PetModel} from '../../../shared/models/pet.model';

@Component({
    selector: 'app-pet-package',
    templateUrl: './pet-package.page.html',
    styleUrls: ['./pet-package.page.scss'],
})
export class PetPackagePage implements OnInit {

    @Input() pet: PetModel;

    constructor() {
    }

    ngOnInit() {
    }
}
