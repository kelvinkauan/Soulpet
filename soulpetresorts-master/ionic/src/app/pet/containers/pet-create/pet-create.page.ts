import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';

import {Subscription} from 'rxjs';

import {PetSandbox} from '../../pet.sandbox';
import {SettingSandbox} from '../../../setting/setting.sandbox';

@Component({
    selector: 'app-pet-create',
    templateUrl: './pet-create.page.html',
    styleUrls: ['./pet-create.page.scss'],
})
export class PetCreatePage implements OnInit, OnDestroy {

    @Input() form;

    @Input() isEditing;

    public isLoadingPet$ = this.petSandbox.isLoadingPet$;

    public isLoadingImagePet$ = this.petSandbox.isLoadingImagePet$;

    public isLoadingImageCarterPet$ = this.petSandbox.isLoadingImageCarterPet$;

    public imagePet$ = this.petSandbox.imagePet$;

    public imagePetCarter$ = this.petSandbox.imagePetCarter$;

    public behaviorsCollection$ = this.settingSandbox.behaviorsCollection$;

    public breedsCollection$ = this.settingSandbox.breedsCollection$;

    public sizesCollection$ = this.settingSandbox.sizesCollection$;

    public typeFursCollection$ = this.settingSandbox.typeFursCollection$;

    public typesCollection$ = this.settingSandbox.typesCollection$;

    public formGroup: FormGroup;

    private subscriptions = new Subscription();

    public validationMessages = {
        name: [
            {type: 'required', message: 'Informe o Nome.'},
            {type: 'minlength', message: 'Mínimo 4 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        type: [
            {type: 'required', message: 'Informe o Tipo.'}
        ],
        breed: [
            {type: 'required', message: 'Informe a Raça.'}
        ],
        gender: [
            {type: 'required', message: 'Informe o Sexo.'}
        ],
        size: [
            {type: 'required', message: 'Informe o Porte.'}
        ],
        type_fur: [
            {type: 'required', message: 'Informe o Tipo do Pelo.'}
        ],
        date_birth: [
            {type: 'required', message: 'Informe a Data de Nascimento.'}
        ],
        ration_brand: [
            {type: 'required', message: 'Informe a Marca da Ração.'},
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 50 caracteres.'}
        ],
        times_day: [
            {type: 'required', message: 'Informe a Quantidade de vezes por dia.'},
            {type: 'min', message: 'Mínimo 1 vez.'},
            {type: 'max', message: 'Máximo 10 vezes.'}
        ],
        amount_time: [
            {type: 'required', message: 'Informe a Quantia por vez.'},
            {type: 'min', message: 'Mínimo 10g por vez.'},
            {type: 'max', message: 'Máximo 1000g por vez.'}
        ],
        types_food: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 150 caracteres.'}
        ],
        obs_food: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 200 caracteres.'}
        ],
        obs_general: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 500 caracteres.'}
        ],
        vet_name: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 100 caracteres.'}
        ],
        obs_medical: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 500 caracteres.'}
        ],
        case_emergency: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 150 caracteres.'}
        ],
        case_symptoms: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 150 caracteres.'}
        ],
        behavior: [
            {type: 'required', message: 'Informe o Comportamento.'}
        ],
        obs_alert: [
            {type: 'minlength', message: 'Mínimo 2 caracteres.'},
            {type: 'maxlength', message: 'Máximo 500 caracteres.'}
        ]
    };

    constructor(private petSandbox: PetSandbox,
                private formBuilder: FormBuilder,
                private settingSandbox: SettingSandbox) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            user: [null],
            avatar: [null],
            name: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(100)]],
            type: ['', [Validators.required]],
            breed: ['', [Validators.required]],
            gender: ['', [Validators.required]],
            size: ['', [Validators.required]],
            type_fur: ['', [Validators.required]],
            date_birth: ['', [Validators.required]],
            castrated: [false],
            ration_brand: ['', [Validators.minLength(2), Validators.maxLength(50)]],
            times_day: ['', [Validators.min(1), Validators.max(10)]],
            amount_time: ['', [Validators.min(10), Validators.max(1000)]],
            types_food: ['', [Validators.minLength(2), Validators.maxLength(150)]],
            obs_food: ['', [Validators.minLength(2), Validators.maxLength(200)]],
            sachet: [false],
            perfume: [false],
            ornament: [false],
            alive: [true],
            pool: [false],
            obs_general: ['', [Validators.minLength(2), Validators.maxLength(500)]],
            vet_name: ['', [Validators.minLength(2), Validators.maxLength(100)]],
            vet_phone: [''],
            obs_medical: ['', [Validators.minLength(2), Validators.maxLength(500)]],
            vaccination_carter: [null],
            case_emergency: ['', [Validators.minLength(2), Validators.maxLength(150)]],
            case_symptoms: ['', [Validators.minLength(2), Validators.maxLength(150)]],
            date_cio: [''],
            date_evaluation: [''],
            behavior: ['', [Validators.required]],
            has_services: [false],
            special_attention: [false],
            attention: [false],
            obs_alert: ['', [Validators.minLength(2), Validators.maxLength(500)]],
            status: ['ACTIVE']
        });
    }

    ngOnInit() {
        this.subscriptions.add(
            this.imagePet$.subscribe(image => {
                if (image) {
                    this.formGroup.get('avatar').patchValue(image);
                }
            })
        );

        this.subscriptions.add(
            this.imagePetCarter$.subscribe(image => {
                if (image) {
                    this.formGroup.get('vaccination_carter').patchValue(image);
                }
            })
        );

        this.settingSandbox.loadBehaviors();
        this.settingSandbox.loadBreeds();
        this.settingSandbox.loadSizes();
        this.settingSandbox.loadTypeFurs();
        this.settingSandbox.loadTypes();

        if (this.form) {
            this.formGroup.patchValue(this.form);
            this.formGroup.updateValueAndValidity();
        }
    }

    public onFileUploadPet(event) {
        const formData = new FormData();
        const file = (event.target as HTMLInputElement).files[0];
        formData.append('image', file);
        this.petSandbox.uploadImagePet(formData);
    }

    public onFileUploadCarterPet(event) {
        const formData = new FormData();
        const file = (event.target as HTMLInputElement).files[0];
        formData.append('image', file);
        this.petSandbox.uploadImageCarterPet(formData);
    }

    public onClickCancel() {
        this.petSandbox.closeModal();
    }

    public onClickConfirm() {
        if (!this.formGroup.valid) {
            this.validateAllFormFields(this.formGroup);
        } else {
            this.isEditing ? this.petSandbox.updatePet(this.formGroup.value) : this.petSandbox.createPet(this.formGroup.value);
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
