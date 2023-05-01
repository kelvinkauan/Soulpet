import {Component, OnInit} from '@angular/core';

import {ScheduleSandbox} from '../../schedule.sandbox';
import {CartSandbox} from '../../../cart/cart.sandbox';

@Component({
    selector: 'app-schedule',
    templateUrl: './schedule.page.html',
    styleUrls: ['./schedule.page.scss'],
})
export class SchedulePage implements OnInit {

    public currentDate = new Date();

    public schedulesCollection$ = this.scheduleSandbox.schedulesCollection$;

    public orderSelected$ = this.cartSandbox.orderSelected$;

    constructor(private scheduleSandbox: ScheduleSandbox,
                private cartSandbox: CartSandbox) {
    }

    ngOnInit() {
        this.scheduleSandbox.loadSchedules();
        this.cartSandbox.loadOrder();
    }

    changeDate($event) {
        this.currentDate = $event;
    }

    backDate() {
        this.currentDate = new Date(this.currentDate.setMonth(this.currentDate.getMonth() - 1));

    }

    forwardDate() {
        this.currentDate = new Date(this.currentDate.setMonth(this.currentDate.getMonth() + 1));
    }

    openScheduleList() {
        this.scheduleSandbox.openScheduleListModal();
    }
}
