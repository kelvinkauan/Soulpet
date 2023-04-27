import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {Subscription} from 'rxjs';

import {ScheduleSandbox} from '../../../schedule/schedule.sandbox';
import {PetSandbox} from '../../pet.sandbox';
import {UserSandbox} from '../../../user/user.sandbox';
import {UnitySandbox} from '../../../unity/unity.sandbox';

@Component({
    selector: 'app-schedule-create',
    templateUrl: './schedule-create.page.html',
    styleUrls: ['./schedule-create.page.scss'],
})
export class ScheduleCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() service;

    public isLoading$ = this.scheduleSandbox.isLoadingSchedule$;

    public usersCollection$ = this.userSandbox.usersCollection$;

    public expectedTime$ = this.unitySandbox.expectedTime$;

    public formGroup: FormGroup;

    private subscriptions = new Subscription();

    public validationMessages = {
        service: [
            {type: 'required', message: 'Informe o Serviço.'}
        ],
        date: [
            {type: 'required', message: 'Informe a Data.'}
        ],
        hour: [
            {type: 'required', message: 'Informe o Horário de Início.'}
        ],
        time: [
            {type: 'required', message: 'Informe o Tempo Estimado.'}
        ],
        user: [
            {type: 'required', message: 'Informe o Responsável.'}
        ]
    };

    constructor(private formBuilder: FormBuilder,
                private scheduleSandbox: ScheduleSandbox,
                private petSandbox: PetSandbox,
                private userSandbox: UserSandbox,
                private unitySandbox: UnitySandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            pet: [null],
            unity: [null],
            service: [null, [Validators.required]],
            date: [null, [Validators.required]],
            hour: [null, [Validators.required]],
            time: ['', [Validators.required]],
            user: [null, [Validators.required]],
            status: [true]
        });
    }

    ngOnInit() {
        this.userSandbox.loadUsers();

        if (this.form) {
            this.formGroup.get('pet').patchValue(this.form);
        }

        if (this.service) {
            this.formGroup.get('service').patchValue(this.service.id);
        }

        this.subscriptions.add(
            this.expectedTime$.subscribe(value => {
                this.formGroup.get('time').patchValue(value);
            })
        );
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.scheduleSandbox.createSchedule(this.formGroup.value);
        }
    }

    public onClickCancel() {
        this.petSandbox.closePetScheduleModal();
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
