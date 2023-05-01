import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {AlertController} from '@ionic/angular';

import {Subscription} from 'rxjs';

import {UserSandbox} from '../../../user/user.sandbox';
import {UnitySandbox} from '../../../unity/unity.sandbox';

@Component({
    selector: 'app-user-create',
    templateUrl: './user-create.page.html',
    styleUrls: ['./user-create.page.scss'],
})
export class UserCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() isEditing;

    public isLoadingUser$ = this.userSandbox.isLoadingUser$;

    public isLoadingImageUser$ = this.userSandbox.isLoadingImageUser$;

    public imageUser$ = this.userSandbox.imageUser$;

    public unitsCollection$ = this.unitySandbox.unitsCollection$;

    public formGroup: FormGroup;

    private subscriptions = new Subscription();

    public validationMessages = {
        name: [
            {type: 'required', message: 'Informe o Nome.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        password: [
            {type: 'required', message: 'Informe a Senha.'},
            {type: 'minlength', message: 'Mínimo 6 caracteres.'},
            {type: 'maxlength', message: 'Máximo 14 caracteres.'}
        ],
        email: [
            {type: 'required', message: 'Informe o E-mail.'},
            {type: 'email', message: 'Informe um E-mail válido.'}
        ],
        units: [
            {type: 'required', message: 'Informe pelo menos uma Loja.'}
        ],
        role: [
            {type: 'required', message: 'Informe o Setor.'}
        ]
    };

    constructor(private formBuilder: FormBuilder,
                private alertController: AlertController,
                private userSandbox: UserSandbox,
                private unitySandbox: UnitySandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            avatar: [null],
            name: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(100)]],
            password: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(14)]],
            email: ['', [Validators.required, Validators.email]],
            units: [null, [Validators.required]],
            role: [null, [Validators.required]],
            status: ['ACTIVE']
        });
    }

    ngOnInit() {
        this.unitySandbox.loadUnits();

        this.subscriptions.add(
            this.imageUser$.subscribe(image => {
                if (image) {
                    this.formGroup.get('avatar').patchValue(image);
                }
            })
        );

        if (this.form) {
            this.formGroup.patchValue(this.form);
        }
    }

    public onFileUpload(event) {
        const formData = new FormData();
        const file = (event.target as HTMLInputElement).files[0];
        formData.append('image', file);
        this.userSandbox.uploadImageUser(formData);
    }

    public onClickCancel() {
        this.userSandbox.closeModal();
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.isEditing ? this.userSandbox.updateUser(this.formGroup.value) : this.userSandbox.createUser(this.formGroup.value);
        }
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
