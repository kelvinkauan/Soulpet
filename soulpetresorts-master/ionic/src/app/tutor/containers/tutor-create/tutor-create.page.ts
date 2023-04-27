import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {AlertController} from '@ionic/angular';

import {Subscription} from 'rxjs';

import {TutorSandbox} from '../../tutor.sandbox';
import {ProvinceSandbox} from '../../../shared/mokups/province/province.sandbox';
import {CitySandbox} from '../../../shared/mokups/city/city.sandbox';
import {PetSandbox} from '../../../pet/pet.sandbox';
import {ViaCepSandbox} from '../../../shared/components/via-cep/via-cep.sandbox';

import {PetModel} from '../../../shared/models/pet.model';

import {GenericValidator} from '../../../shared/validators/generic-validator';

@Component({
    selector: 'app-tutor-create',
    templateUrl: './tutor-create.page.html',
    styleUrls: ['./tutor-create.page.scss'],
})
export class TutorCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() isEditing;

    public isLoadingTutor$ = this.tutorSandbox.isLoadingTutor$;

    public isLoadingImageTutor$ = this.tutorSandbox.isLoadingImageTutor$;

    public imageTutor$ = this.tutorSandbox.imageTutor$;

    public provincesCollection$ = this.provinceSandbox.provincesCollection$;

    public citiesCollection$ = this.citySandbox.citiesCollection$;

    public petSelected$ = this.petSandbox.petSelected$;

    public petsCollection$ = this.petSandbox.petsCollection$;

    public viaCepSelected$ = this.viaCepSandbox.viaCepSelected$;

    public formGroup: FormGroup;

    private pets: PetModel[];

    private subscriptions = new Subscription();

    public validationMessages = {
        name: [
            {type: 'required', message: 'Informe o Nome.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        cpf: [
            {type: 'required', message: 'Informe o CPF.'},
            {type: 'minlength', message: 'Mínimo 14 caracteres.'},
            {type: 'maxlength', message: 'Máximo 14 caracteres.'},
            {type: 'cpfNotValid', message: 'O cpf não é válido.'}
        ],
        rg: [
            {type: 'required', message: 'Informe o RG.'},
            {type: 'minlength', message: 'Mínimo 9 caracteres.'},
            {type: 'maxlength', message: 'Máximo 15 caracteres.'}
        ],
        document: [
            {type: 'required', message: 'Informe o Documento 1.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 20 caracteres.'}
        ],
        passport: [
            {type: 'required', message: 'Informe o Passaporte.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 20 caracteres.'}
        ],
        phone: [
            {type: 'required', message: 'Informe o Telefone.'},
            {type: 'minlength', message: 'Mínimo 14 caracteres.'},
            {type: 'maxlength', message: 'Máximo 15 caracteres.'}
        ],
        cell_phone: [
            {type: 'required', message: 'Informe o Celular.'},
            {type: 'minlength', message: 'Mínimo 8 caracteres.'},
            {type: 'maxlength', message: 'Máximo 20 caracteres.'}
        ],
        email: [
            {type: 'required', message: 'Informe o E-mail.'},
            {type: 'email', message: 'Informe um E-mail válido.'}
        ],
        phone_residential: [
            {type: 'minlength', message: 'Mínimo 14 caracteres.'},
            {type: 'maxlength', message: 'Máximo 15 caracteres.'}
        ],
        phone_company: [
            {type: 'minlength', message: 'Mínimo 14 caracteres.'},
            {type: 'maxlength', message: 'Máximo 15 caracteres.'}
        ],
        address: {
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
        },
        additional: {
            additional_one: [
                {type: 'minlength', message: 'Mínimo 2 caracteres.'},
                {type: 'maxlength', message: 'Máximo 150 caracteres.'}
            ],
            additional_two: [
                {type: 'minlength', message: 'Mínimo 2 caracteres.'},
                {type: 'maxlength', message: 'Máximo 150 caracteres.'}
            ],
            additional_three: [
                {type: 'minlength', message: 'Mínimo 2 caracteres.'},
                {type: 'maxlength', message: 'Máximo 150 caracteres.'}
            ],
            obs_general: [
                {type: 'minlength', message: 'Mínimo 2 caracteres.'},
                {type: 'maxlength', message: 'Máximo 500 caracteres.'}
            ],
            obs_alert: [
                {type: 'minlength', message: 'Mínimo 2 caracteres.'},
                {type: 'maxlength', message: 'Máximo 500 caracteres.'}
            ]
        }
    };

    constructor(private formBuilder: FormBuilder,
                private alertController: AlertController,
                private tutorSandbox: TutorSandbox,
                private provinceSandbox: ProvinceSandbox,
                private citySandbox: CitySandbox,
                private petSandbox: PetSandbox,
                private viaCepSandbox: ViaCepSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            avatar: [null],
            foreign: [false],
            name: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(100)]],
            date_birth: [''],
            cpf: ['', [Validators.required, Validators.minLength(14), Validators.maxLength(14), GenericValidator.isValidCpf()]],
            rg: ['', [Validators.minLength(9), Validators.maxLength(15)]],
            document: [''],
            passport: [''],
            phone: ['', [Validators.required, Validators.minLength(14), Validators.maxLength(15)]],
            cell_phone: [''],
            email: ['', [Validators.required, Validators.email]],
            phone_residential: ['', [Validators.minLength(14), Validators.maxLength(15)]],
            phone_company: ['', [Validators.minLength(14), Validators.maxLength(15)]],
            role: ['CLIENT'],
            address: this.formBuilder.group({
                id: [null],
                user: [null],
                zipcode: ['', [Validators.required, Validators.minLength(9), Validators.maxLength(9)]],
                street: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(100)]],
                number: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
                district: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
                country: [null, [Validators.required]],
                province: [null, [Validators.required]],
                city: [null, [Validators.required]]
            }),
            additional: this.formBuilder.group({
                id: [null],
                user: [null],
                found_us: [null],
                additional_one: ['', [Validators.minLength(2), Validators.maxLength(150)]],
                additional_two: ['', [Validators.minLength(2), Validators.maxLength(150)]],
                additional_three: ['', [Validators.minLength(2), Validators.maxLength(150)]],
                obs_general: ['', [Validators.minLength(2), Validators.maxLength(500)]],
                has_services: [false],
                special_attention: [false],
                attention: [false],
                obs_alert: ['', [Validators.minLength(2), Validators.maxLength(500)]]
            }),
            pets: [null]
        });
    }

    ngOnInit() {
        this.subscriptions.add(
            this.petSelected$.subscribe((pet) => {
                if (pet) {
                    this.pets = (pet && this.pets === undefined) ? [pet] : [...this.pets, pet];
                    this.formGroup.get('pets').patchValue(this.pets);
                }
            })
        );

        this.subscriptions.add(
            this.imageTutor$.subscribe(image => {
                if (image) {
                    this.formGroup.get('avatar').patchValue(image);
                }
            })
        );

        this.subscriptions.add(
            this.viaCepSelected$.subscribe(cep => {
                if (cep) {
                    this.citySandbox.loadCities(cep.province);
                    this.formGroup.get('address').get('street').patchValue(cep.logradouro);
                    this.formGroup.get('address').get('district').patchValue(cep.bairro);
                    this.formGroup.get('address').get('country').patchValue(1);
                    this.formGroup.get('address').get('province').patchValue(cep.province);
                    setTimeout(() => {
                        this.formGroup.get('address').get('city').patchValue(cep.city);
                    }, 1000);
                }
            })
        );

        this.petSandbox.loadPetsTutor(this.isEditing);
        this.provinceSandbox.loadProvinces();
        this.pathForm();
    }

    private pathForm() {
        if (this.form) {
            this.formGroup.patchValue(this.form);
            if (this.form.foreign === 1) {
                this.isForeign();
            }
        }

        if (this.isProvince()) {
            this.citySandbox.loadCities(this.form.address.province);
        }

        if (this.isPets()) {
            this.pets = this.form.pets;
        }
    }

    private isProvince() {
        return this.form && this.form.address.province;
    }

    private isPets() {
        return this.form && this.form.pets;
    }

    public changeProvince($event) {
        if ($event.detail.value !== '') {
            this.citySandbox.loadCities($event.detail.value);
        }
    }

    public changeCep() {
        const cep = this.formGroup.get('address').get('zipcode').value;
        if (cep !== '') {
            this.viaCepSandbox.loadViaCep(cep);
        }
    }

    public openModelPet() {
        this.petSandbox.openModal(false);
    }

    public selectPet(pet) {
        this.petSandbox.openModal(true, pet);
    }

    async confirmPet(pet) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o pet: <strong>${pet.name}</strong>?`,
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
                        this.petSandbox.deletePet(pet);
                    }
                }
            ]
        });
        await alert.present();
    }

    public onFileUpload(event) {
        const formData = new FormData();
        const file = (event.target as HTMLInputElement).files[0];
        formData.append('image', file);
        this.tutorSandbox.uploadImageTutor(formData);
    }

    public changeForeign() {
        if (this.formGroup.get('foreign').value === true) {
            this.isForeign();
        } else {
            this.notForeign();
        }
    }

    private clearValidate(control: string) {
        this.formGroup.get(control).clearValidators();
        this.formGroup.get(control).setValue(null);
        this.updateValueAndValidity(control);
    }

    private setValidate(control: string) {
        this.formGroup.get(control).setValidators([Validators.required]);
        this.updateValueAndValidity(control);
    }

    private updateValueAndValidity(control: string) {
        this.formGroup.get(control).updateValueAndValidity();
    }

    private isForeign() {
        this.resetIsForeign();
        this.setValidate('document');
        this.setValidate('cell_phone');
    }

    private resetIsForeign() {
        this.clearValidate('cpf');
        this.clearValidate('rg');
        this.clearValidate('phone');
    }

    private notForeign() {
        this.resetNotForeign();
        this.setValidate('cpf');
        this.setValidate('phone');
    }

    private resetNotForeign() {
        this.clearValidate('document');
        this.clearValidate('passport');
        this.clearValidate('cell_phone');
    }

    public onClickCancel() {
        this.tutorSandbox.closeModal();
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.isEditing ? this.tutorSandbox.updateTutor(this.formGroup.value) : this.tutorSandbox.createTutor(this.formGroup.value);
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
