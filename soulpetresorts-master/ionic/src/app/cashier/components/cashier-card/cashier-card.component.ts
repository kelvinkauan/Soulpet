import {Component, Input, OnInit} from '@angular/core';

@Component({
    selector: 'app-cashier-card',
    templateUrl: './cashier-card.component.html',
    styleUrls: ['./cashier-card.component.scss'],
})
export class CashierCardComponent implements OnInit {

    @Input() subtitle: string;

    @Input() title: string;

    @Input() colorTitle: string;

    constructor() {
    }

    ngOnInit() {
    }

}
