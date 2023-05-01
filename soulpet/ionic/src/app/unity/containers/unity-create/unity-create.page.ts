import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {AlertController} from '@ionic/angular';

import {Subscription} from 'rxjs';

import {UnitySandbox} from '../../unity.sandbox';
import {ProvinceSandbox} from '../../../shared/mokups/province/province.sandbox';
import {CitySandbox} from '../../../shared/mokups/city/city.sandbox';

@Component({
    selector: 'app-unity-create',
    templateUrl: './unity-create.page.html',
    styleUrls: ['./unity-create.page.scss'],
})
export class UnityCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() isEditing;

    public isLoading$ = this.unitySandbox.isLoading$;

    public provincesCollection$ = this.provinceSandbox.provincesCollection$;

    public citiesCollection$ = this.citySandbox.citiesCollection$;

    public isLoadingCity$ = this.citySandbox.isLoading$;

    public categoriesCollection$ = this.unitySandbox.categoriesCollection$;

    public servicesCollection$ = this.unitySandbox.servicesCollection$;

    public subServicesCollection$ = this.unitySandbox.subServicesCollection$;

    public showersCollection$ = this.unitySandbox.showersCollection$;

    public subShowersCollection$ = this.unitySandbox.subShowersCollection$;

    public transportsCollection$ = this.unitySandbox.transportsCollection$;

    public petSittersCollection$ = this.unitySandbox.petSittersCollection$;

    public dayCaresCollection$ = this.unitySandbox.dayCaresCollection$;

    public hotelsCollection$ = this.unitySandbox.hotelsCollection$;

    public othersCollection$ = this.unitySandbox.othersCollection$;

    public isLoadingImageUnity$ = this.unitySandbox.isLoadingImageUnity$;

    public imageUnity$ = this.unitySandbox.imageUnity$;

    public formGroup: FormGroup;

    public color = '#f4f4f4';

    private subscriptions = new Subscription();

    public validationMessages = {
        fantasy: [
            {type: 'required', message: 'Informe o Nome Fantasia.'},
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 150 caracteres.'}
        ],
        email: [
            {type: 'required', message: 'Informe o E-mail.'},
            {type: 'email', message: 'Informe um E-mail válido.'}
        ],
        cnpj: [
            {type: 'required', message: 'Informe o CNPJ.'},
            {type: 'minlength', message: 'Mínimo 18 caracteres.'},
            {type: 'maxlength', message: 'Máximo 18 caracteres.'}
        ],
        zipcode: [
            {type: 'required', message: 'Informe o CEP.'},
            {type: 'minlength', message: 'Mínimo 9 caracteres.'},
            {type: 'maxlength', message: 'Máximo 9 caracteres.'}
        ],
        street: [
            {type: 'required', message: 'Informe o Rua.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        number: [
            {type: 'required', message: 'Informe o Número.'},
            {type: 'minlength', message: 'Mínimo 1 caracteres.'},
            {type: 'maxlength', message: 'Máximo 10 caracteres.'}
        ],
        district: [
            {type: 'required', message: 'Informe o Bairro.'},
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        country: [
            {type: 'required', message: 'Informe o País.'}
        ],
        province: [
            {type: 'required', message: 'Informe o Estado.'}
        ],
        city: [
            {type: 'required', message: 'Informe a Cidade.'}
        ]
    };

    compareWithFn = (o1, o2) => {
        return o1 && o2 ? o1.id === o2.id : o1 === o2;
    };

    constructor(private formBuilder: FormBuilder,
                private unitySandbox: UnitySandbox,
                private provinceSandbox: ProvinceSandbox,
                private citySandbox: CitySandbox,
                private alertController: AlertController) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            fantasy: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(150)]],
            email: ['', [Validators.required, Validators.email]],
            cnpj: ['', [Validators.required, Validators.minLength(18), Validators.maxLength(18)]],
            color: [''],
            logo: [null],
            zipcode: ['', [Validators.required, Validators.minLength(9), Validators.maxLength(9)]],
            street: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(100)]],
            number: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
            district: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
            country: [null, [Validators.required]],
            province: [null, [Validators.required]],
            city: [null, [Validators.required]],
            sunday: [false],
            monday: [true],
            tuesday: [true],
            wednesday: [true],
            thursday: [true],
            friday: [true],
            saturday: [false],
            status: ['ACTIVE'],
            categories: [null],
            services: [null]
        });
    }

    ngOnInit() {
        this.subscriptions.add(
            this.imageUnity$.subscribe(image => {
                if (image) {
                    this.formGroup.get('logo').patchValue(image);
                }
            })
        );

        this.subscriptions.add(
            this.categoriesCollection$.subscribe(category => {
                this.formGroup.get('categories').patchValue(category);
            })
        );

        this.subscriptions.add(
            this.servicesCollection$.subscribe(service => {
                this.formGroup.get('services').patchValue(service);
            })
        );

        this.provinceSandbox.loadProvinces();
        this.unitySandbox.loadCategoriesUnity(this.isEditing);
        this.unitySandbox.loadServicesUnity();
        this.unitySandbox.loadSubServices();
        this.unitySandbox.loadShowersUnity(this.isEditing);
        this.unitySandbox.loadSubShowersUnity(this.isEditing);
        this.unitySandbox.loadTransportsUnity(this.isEditing);
        this.unitySandbox.loadPetSittersUnity(this.isEditing);
        this.unitySandbox.loadDayCaresUnity(this.isEditing);
        this.unitySandbox.loadHotelsUnity(this.isEditing);
        this.unitySandbox.loadOthersUnity(this.isEditing);

        if (this.form) {
            this.citySandbox.loadCities(this.form.province.id);
            this.formGroup.patchValue(this.form);
        }
    }

    public changeProvince($event) {
        this.citySandbox.loadCities($event.detail.value.id);
    }

    public onFileUpload(event) {
        const formData = new FormData();
        const file = (event.target as HTMLInputElement).files[0];
        formData.append('image', file);
        this.unitySandbox.uploadImageUnity(formData);
    }

    public onClickCancel() {
        this.unitySandbox.closeModal();
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.isEditing ? this.unitySandbox.updateUnity(this.formGroup.value) : this.unitySandbox.createUnity(this.formGroup.value);
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

    async presentModalCategory() {
        this.unitySandbox.openModalCategory(false);
    }

    public selectCategory(category) {
        this.unitySandbox.selectCategory(category);
        this.unitySandbox.openModalCategory(true, category);
    }

    async confirmCategory(category) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir a categoria: <strong>${category.description}</strong>?`,
            buttons: [
                {
                    text: 'Cancelar',
                    role: 'cancel',
                    cssClass: 'secondary',
                    handler: () => {
                        console.log('Cancelou');
                    }
                }, {
                    text: 'Sim',
                    handler: () => {
                        this.unitySandbox.deleteCategory(category);
                    }
                }
            ]
        });
        await alert.present();
    }

    ngOnDestroy() {
        this.subscriptions.unsubscribe();
    }
}
