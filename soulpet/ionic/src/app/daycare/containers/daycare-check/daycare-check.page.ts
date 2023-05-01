import {Component, OnInit} from '@angular/core';

@Component({
    selector: 'app-daycare-check',
    templateUrl: './daycare-check.page.html',
    styleUrls: ['./daycare-check.page.scss'],
})
export class DaycareCheckPage implements OnInit {

    public rows: any[];

    public buttons$: any[];

    public selectedButton: number;

    constructor() {
    }

    ngOnInit() {
        setTimeout(() => {
            this.rows = [
                {
                    id: 1,
                    nome: 'Aldo',
                    presenca: 'Pernoite',
                },
                {
                    id: 2,
                    nome: 'Bida',
                    presenca: 'daycare',
                },
                {
                    id: 3,
                    nome: 'Bine',
                    presenca: 'Daycare',
                },
                {
                    id: 4,
                    nome: 'Clovis',
                    presenca: 'Saída',
                },
                {
                    id: 5,
                    nome: 'Flamingo',
                    presenca: 'Hotel',
                },
            ];
            this.buttons$ = [
                {
                    id: 1,
                    name: 'Presença',
                },
                {
                    id: 2,
                    name: 'Xixi',
                },
                {
                    id: 3,
                    name: 'Cocô',
                },
                {
                    id: 4,
                    name: 'Refeição 1',
                },
                {
                    id: 5,
                    name: 'Refeição 2',
                },
            ];
        }, 500);
    }

    public selectButton(value: any) {
        this.selectedButton = value.id;
    }
}
