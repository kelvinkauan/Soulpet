import {Component, Input, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {SettingSandbox} from '../../setting.sandbox';

import {DistrictModel} from '../../../shared/models/district.model';

@Component({
    selector: 'app-region-create',
    templateUrl: './region-create.page.html',
    styleUrls: ['./region-create.page.scss'],
})
export class RegionCreatePage implements OnInit {

    @Input() form;

    @Input() isEditing;

    public isLoading$ = this.settingSandbox.isLoadingRegion$;

    public districtsCollection$ = this.settingSandbox.districtsCollection$;

    public formGroup: FormGroup;

    public districts: DistrictModel[];

    public validationMessages = {
        description: [
            {type: 'required', message: 'Informe a Descrição.'},
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ]
    };

    constructor(private formBuilder: FormBuilder,
                private settingSandbox: SettingSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            unity: [null],
            districts: [null],
            description: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
            status: ['ACTIVE']
        });
    }

    ngOnInit() {
        if (this.form) {
            this.formGroup.patchValue(this.form);
        }
    }

    public conpareDistrict(id) {
        // return this.formGroup.get('districts').value.map(e => e.id).indexOf(id) !== -1;
    }

    public onCheckDistrict($event) {
        const checked = $event.detail.checked;
        const district = $event.detail.value;

        if (this.districts) {
            if (!(this.districts.map(e => e).indexOf(district) !== -1)) {
                this.districts = [...this.districts, district];
            } else {
                this.districts.splice(this.districts.findIndex(value => value === district), 1);
            }
        } else {
            this.districts = [district];
        }
        this.formGroup.get('districts').patchValue(this.districts);
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.isEditing ?
                this.settingSandbox.updateRegion(this.formGroup.value) : this.settingSandbox.createRegion(this.formGroup.value);
        }
    }

    public onClickCancel() {
        this.settingSandbox.closeModalRegion();
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
