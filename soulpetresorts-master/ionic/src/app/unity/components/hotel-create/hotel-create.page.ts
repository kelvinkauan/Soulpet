import {Component, Input, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {UnitySandbox} from '../../unity.sandbox';
import {SettingSandbox} from '../../../setting/setting.sandbox';

@Component({
    selector: 'app-hotel-create',
    templateUrl: './hotel-create.page.html',
    styleUrls: ['./hotel-create.page.scss'],
})
export class HotelCreatePage implements OnInit {

    @Input() form;

    @Input() isEditing;

    public isLoading$ = this.unitySandbox.isLoadingHotel$;

    public sizesCollection$ = this.settingSandbox.sizesCollection$;

    public formGroup: FormGroup;

    public validationMessages = {
        size: [
            {type: 'required', message: 'Informe o Porte.'}
        ],
        period: [
            {type: 'required', message: 'Informe o Período.'}
        ],
        price: [
            {type: 'required', message: 'Informe o Preço.'}
        ]
    };

    constructor(private formBuilder: FormBuilder,
                private unitySandbox: UnitySandbox,
                private settingSandbox: SettingSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            unity: [null],
            service: [null],
            size: [null, [Validators.required]],
            period: ['', [Validators.required]],
            price: [null, [Validators.required]],
            status: [true]
        });
    }

    ngOnInit() {
        this.settingSandbox.loadSizes();

        if (this.form) {
            this.formGroup.get('service').patchValue(this.form.id);
        }
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.unitySandbox.createHotel(this.formGroup.value);
        }
    }

    public onClickCancel() {
        this.unitySandbox.closeModalHotel();
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
}
