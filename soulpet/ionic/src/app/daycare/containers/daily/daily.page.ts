import {Component, OnInit} from '@angular/core';

import {DaycareSandbox} from '../../daycare.sandbox';

@Component({
    selector: 'app-daily',
    templateUrl: './daily.page.html',
    styleUrls: ['./daily.page.scss'],
})
export class DailyPage implements OnInit {

    public rows: any[];

    constructor(private daycareSandbox: DaycareSandbox) {
    }

    ngOnInit() {
        setTimeout(() => {
            this.rows = [
                {
                    id: 0,
                    turmas: 'Banho e tosa',
                    cachorros: '18 Cachorros'
                },
                {
                    id: 1,
                    turmas: 'Transporte',
                    cachorros: '18 Cachorros'
                },
                {
                    id: 2,
                    turmas: 'Hotel',
                    cachorros: '13 Cachorros'
                },
                {
                    id: 3,
                    turmas: 'Daycare',
                    cachorros: '18 Cachorros'
                },
                {
                    id: 4,
                    turmas: 'Pet Sitter',
                    cachorros: '12 Cachorros'
                }
            ];
        }, 500);
    }

    openDaycare() {
        this.daycareSandbox.openModalDaycare();
    }

    openClass() {
        this.daycareSandbox.openModalDaycareClass();
    }

    openCheck() {
        this.daycareSandbox.openModalDaycareCheck();
    }
}
