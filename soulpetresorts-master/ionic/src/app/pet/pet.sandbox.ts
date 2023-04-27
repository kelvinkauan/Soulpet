import {Injectable} from '@angular/core';

import {Select, Store} from '@ngxs/store';

import {Observable} from 'rxjs';

import {PetSelectors} from './state/pet/pet.selectors';
import {TutorSelectors} from '../tutor/state/tutor/tutor.selectors';
import {PetEvaluationSelectors} from './state/pet-evaluation/pet-evaluation.selectors';

import {PetModel} from '../shared/models/pet.model';
import {UserModel} from '../shared/models/user.model';
import {EvaluationModel} from '../shared/models/evaluation.model';

import {
    SelectPet,
    LoadPets,
    LoadPetsTutor,
    CreatePet,
    UpdatePet,
    DeletePet,
    UploadImagePet,
    UploadImageCarterPet
} from './state/pet/pet.actions';

import {
    SelectEvaluation,
    LoadEvaluations,
    CreateEvaluation,
    UpdateEvaluation,
    DeleteEvaluation
} from './state/pet-evaluation/pet-evaluation.actions';

import {
    OpenPetModal,
    ClosePetModal
} from './state/pet-modal/pet-modal.actions';
import {
    OpenPetServiceModal,
    ClosePetServiceModal
} from './state/pet-service-modal/pet-service-modal.actions';
import {
    ClosePetProfileModal,
    OpenPetProfileModal
} from './state/pet-profile-modal/pet-profile-modal.actions';
import {
    ClosePetEvaluationModal,
    OpenPetEvaluationModal
} from './state/pet-evaluation-modal/pet-evaluation-modal.actions';
import {
    OpenPetEvaluationInfoModal,
    ClosePetEvaluationInfoModal
} from './state/pet-evaluation-info-modal/pet-evaluation-info-modal.actions';
import {
    OpenModuleHotelModal,
    CloseModuleHotelModal
} from './state/module-hotel-modal/module-hotel-modal.actions';
import {
    OpenServicePetSitterModal,
    CloseServicePetSitterModal
} from './state/service-pet-sitter-modal/service-pet-sitter-modal.actions';
import {
    OpenPetSpaModal,
    ClosePetSpaModal
} from './state/pet-spa-modal/pet-spa-modal.actions';
import {
    OpenPetScheduleModal,
    ClosePetScheduleModal
} from './state/pet-schedule-modal/pet-schedule-modal.actions';
import {
    OpenPetCartModal,
    ClosePetCartModal
} from './state/pet-cart-modal/pet-cart-modal.actions';
import {
    OpenDaycareCreateModal,
    CloseDaycareCreateModal
} from './state/daycare-create-modal/daycare-create-modal.actions';
import {
    OpenPetPackageModal,
    ClosePetPackageModal
} from './state/pet-package-modal/pet-package-modal.actions';

@Injectable({
    providedIn: 'root'
})
export class PetSandbox {

    @Select(PetSelectors.entities) petsCollection$: Observable<PetModel[]>;

    @Select(PetSelectors.selected) petSelected$: Observable<PetModel>;

    @Select(PetSelectors.image) imagePet$: Observable<string>;

    @Select(PetSelectors.imageCarter) imagePetCarter$: Observable<string>;

    @Select(PetSelectors.isLoading) isLoadingPet$: Observable<boolean>;

    @Select(PetSelectors.isLoadingImage) isLoadingImagePet$: Observable<boolean>;

    @Select(PetSelectors.isLoadingImageCarter) isLoadingImageCarterPet$: Observable<boolean>;

    @Select(PetEvaluationSelectors.entities) evaluationsCollection$: Observable<EvaluationModel[]>;

    @Select(PetEvaluationSelectors.selected) evaluationSelected$: Observable<EvaluationModel>;

    @Select(PetEvaluationSelectors.isLoading) isLoadingEvaluation$: Observable<boolean>;

    constructor(private store: Store) {
    }

    public selectPet(pet: PetModel) {
        this.store.dispatch(new SelectPet(pet));
    }

    public loadPets() {
        this.store.dispatch(new LoadPets());
    }

    public loadPetsTutor(isEditing: boolean) {
        this.store.dispatch(new LoadPetsTutor((isEditing) ? this.tutorSnapshot() : {id: 0} as UserModel));
    }

    public createPet(pet: PetModel) {
        this.store.dispatch(new CreatePet(pet));
    }

    public updatePet(pet: PetModel) {
        this.store.dispatch(new UpdatePet(pet));
    }

    public deletePet(pet: PetModel) {
        this.store.dispatch(new DeletePet(pet));
    }

    public uploadImagePet(image: FormData) {
        this.store.dispatch(new UploadImagePet(image));
    }

    public uploadImageCarterPet(image: FormData) {
        this.store.dispatch(new UploadImageCarterPet(image));
    }

    public selectEvaluation(evaluation: EvaluationModel) {
        this.store.dispatch(new SelectEvaluation(evaluation));
    }

    public loadEvaluations(pet: PetModel) {
        this.store.dispatch(new LoadEvaluations(pet));
    }

    public createEvaluation(evaluation: EvaluationModel) {
        this.store.dispatch(new CreateEvaluation(evaluation));
    }

    public updateEvaluation(evaluation: EvaluationModel) {
        this.store.dispatch(new UpdateEvaluation(evaluation));
    }

    public deleteEvaluation(evaluation: EvaluationModel) {
        this.store.dispatch(new DeleteEvaluation(evaluation));
    }

    tutorSnapshot() {
        return this.store.selectSnapshot(TutorSelectors.selected);
    }

    public openModal(editing, data?) {
        this.store.dispatch(new OpenPetModal({editing, data}));
    }

    public closeModal() {
        this.store.dispatch(new ClosePetModal());
    }

    public openModalService(data) {
        this.store.dispatch(new OpenPetServiceModal(data));
    }

    public closeModalService() {
        this.store.dispatch(new ClosePetServiceModal());
    }

    public openModalProfile(data) {
        this.store.dispatch(new OpenPetProfileModal(data));
    }

    public closeModalProfile() {
        this.store.dispatch(new ClosePetProfileModal());
    }

    public openModalEvaluation(data) {
        this.store.dispatch(new OpenPetEvaluationModal(data));
    }

    public closeModalEvaluation() {
        this.store.dispatch(new ClosePetEvaluationModal());
    }

    public openModalEvaluationInfo(data) {
        this.store.dispatch(new OpenPetEvaluationInfoModal(data));
    }

    public closeModalEvaluationInfo() {
        this.store.dispatch(new ClosePetEvaluationInfoModal());
    }

    public openModalModuleHotel(data) {
        this.store.dispatch(new OpenModuleHotelModal(data));
    }

    public closeModalModuleHotel() {
        this.store.dispatch(new CloseModuleHotelModal());
    }

    public openModalPetSitter() {
        this.store.dispatch(new OpenServicePetSitterModal());
    }

    public closeModalPetSitter() {
        this.store.dispatch(new CloseServicePetSitterModal());
    }

    public openModalSpa(data, category) {
        this.store.dispatch(new OpenPetSpaModal({data, category}));
    }

    public closeModalSpa() {
        this.store.dispatch(new ClosePetSpaModal());
    }

    public openPetScheduleModal(service, data?) {
        this.store.dispatch(new OpenPetScheduleModal({service, data}));
    }

    public closePetScheduleModal() {
        this.store.dispatch(new ClosePetScheduleModal());
    }

    public openPetCartModal() {
        this.store.dispatch(new OpenPetCartModal());
    }

    public closePetCartModal() {
        this.store.dispatch(new ClosePetCartModal());
    }

    public openDaycareCreateModal(service, data?) {
        this.store.dispatch(new OpenDaycareCreateModal({service, data}));
    }

    public closeDaycareCreateModal() {
        this.store.dispatch(new CloseDaycareCreateModal());
    }

    public openModalPackage(data) {
        this.store.dispatch(new OpenPetPackageModal(data));
    }

    public closeModalPackage() {
        this.store.dispatch(new ClosePetPackageModal());
    }

}
