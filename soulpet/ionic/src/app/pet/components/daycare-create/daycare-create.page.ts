import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {Subscription} from 'rxjs';

import {ScheduleSandbox} from '../../../schedule/schedule.sandbox';
import {PetSandbox} from '../../pet.sandbox';

@Component({
    selector: 'app-daycare-create',
    templateUrl: './daycare-create.page.html',
    styleUrls: ['./daycare-create.page.scss'],
})
export class DaycareCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() service;

    public isLoading$ = this.scheduleSandbox.isLoadingSchedule$;

    public formGroup: FormGroup;

    private subscriptions = new Subscription();

    public validationMessages = {
        daily: [
            {type: 'required', message: 'Informe a Diária.'}
        ],
        date_checkin: [
            {type: 'required', message: 'Informe o Check-in.'}
        ],
        hour_checkin: [
            {type: 'required', message: 'Informe o Horário Entrada.'}
        ],
        hour_checkout: [
            {type: 'required', message: 'Informe o Horário Saída.'}
        ]
    };

    constructor(private formBuilder: FormBuilder,
                private scheduleSandbox: ScheduleSandbox,
                private petSandbox: PetSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            pet: [null],
            unity: [null],
            service: [null, [Validators.required]],
            daily: [null, [Validators.required]],
            date_checkin: [null, [Validators.required]],
            hour_checkin: ['', [Validators.required]],
            hour_checkout: [null, [Validators.required]],
            custom: [null],
            status: [true]
        });
    }

    ngOnInit() {
        if (this.form) {
            this.formGroup.get('pet').patchValue(this.form);
        }

        if (this.service) {
            this.formGroup.get('service').patchValue(this.service.id);
        }
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.scheduleSandbox.createSchedule(this.formGroup.value);
        }
    }

    public onClickCancel() {
        this.petSandbox.closeDaycareCreateModal();
    }

    private validateAllFormFields(formGroup: FormGroup) {
        Object.keys(formGroup.controls).forEach(field => {
            const control = formGroup.get(field);
            if (control instanceof FormControl) {
                control.markAsTouched({onlySelf: true});
            } else if (control instanceof FormGroup) {
                this.validateAllFormFields(control);
            }
        });
    }

    ngOnDestroy() {
        this.subscriptions.unsubscribe();
    }
}
