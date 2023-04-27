import {Component, OnInit} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {CashierSandbox} from '../../cashier.sandbox';

@Component({
    selector: 'app-cashier',
    templateUrl: './cashier.page.html',
    styleUrls: ['./cashier.page.scss'],
})
export class CashierPage implements OnInit {

    public tab = 'receive';

    public rows: any[];

    public modal;

    constructor(private modalController: ModalController, private cashierSandbox: CashierSandbox) {
    }

    ngOnInit() {
        setTimeout(() => {
            this.rows = [
                {id: 1, name: 'Hospedagem', client: 'Luiz Fernando', phone: '(45) 9 5509-8844', value: 'R$ 34,35'},
                {id: 2, name: 'Guia Retrátil até 15 Kg - Azul', client: 'Jéssica Martins', phone: '(45) 9 5509-8844', value: 'R$ 29,90'},
                {id: 3, name: 'Pacote', client: 'Pietro Anold', phone: '(45) 9 5509-8844', value: 'R$ 100,00'},
            ];
        }, 500);
    }

    public onTab(tab) {
        this.tab = tab;
    }

    public onClickReceive() {
        this.cashierSandbox.openModal(true);
    }

    public onClick(row) {
    }

}
