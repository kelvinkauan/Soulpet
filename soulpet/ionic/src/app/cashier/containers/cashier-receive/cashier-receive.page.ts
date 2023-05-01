import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup} from '@angular/forms';

import {CashierSandbox} from '../../cashier.sandbox';

@Component({
    selector: 'app-cashier-receive',
    templateUrl: './cashier-receive.page.html',
    styleUrls: ['./cashier-receive.page.scss'],
})
export class CashierReceivePage implements OnInit {

    public formGroup: FormGroup;

    constructor(private formBuilder: FormBuilder, private cashierSandbox: CashierSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null]
        });
    }

    ngOnInit() {
    }

    public onClickCancel() {
        this.cashierSandbox.closeModal();
    }

    public onClickConfirm() {
        this.cashierSandbox.closeModal();
    }
}
