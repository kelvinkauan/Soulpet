import {Injectable} from '@angular/core';

import {ToastController} from '@ionic/angular';

import {Action, Selector, State, StateContext} from '@ngxs/store';

import {catchError, map} from 'rxjs/operators';

import {NgxsEntityStateAdapter, NgxsEntityStateStateModel} from '../../../shared/libs/ngxs-entity-state/src/lib';

import {
    SelectTutor,
    LoadTutors,
    LoadTutorsSuccess,
    LoadTutorsFail,
    LoadNextPageTutor,
    CreateTutor,
    CreateTutorSuccess,
    CreateTutorFail,
    UpdateTutor,
    UpdateTutorSuccess,
    UpdateTutorFail,
    DeleteTutor,
    DeleteTutorSuccess,
    DeleteTutorFail,
    UploadImageTutor,
    UploadImageTutorSuccess,
    UploadImageTutorFail
} from './tutor.actions';
import {CloseTutorModal} from '../tutor-modal/tutor-modal.actions';

import {UserModel} from '../../../shared/models/user.model';

import {UserResource} from '../../../shared/resources/user.resource';

export class TutorStateModel extends NgxsEntityStateStateModel<UserModel> {
    image: string;
    isLoadingImage: boolean;
    isLoading: boolean;
}

@State<TutorStateModel>({
    name: 'tutor',
    defaults: {
        ids: [],
        entities: {},
        selected: null,
        image: null,
        isLoadingImage: false,
        isLoading: false
    }
})

@Injectable()
export class TutorState {

    @Selector()
    static selected(state: TutorStateModel) {
        return state.entities[state.selected.id];
    }

    @Selector()
    static isLoading(state: TutorStateModel) {
        return state.isLoading;
    }

    @Selector()
    static isLoadingImage(state: TutorStateModel) {
        return state.isLoadingImage;
    }

    @Selector()
    static entities(state: TutorStateModel) {
        return state.entities;
    }

    @Selector()
    static image(state: TutorStateModel) {
        return state.image;
    }

    constructor(private userResource: UserResource,
                private toastController: ToastController) {
    }

    @Action(SelectTutor)
    selectTutor(ctx: StateContext<TutorStateModel>, {payload}: SelectTutor) {
        NgxsEntityStateAdapter.select(payload, ctx);
    }

    @Action(LoadTutors)
    loadTutors(ctx: StateContext<TutorStateModel>) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.userResource.find().pipe(
            map((Tutor: UserModel[]) => ctx.dispatch(new LoadTutorsSuccess(Tutor))),
            catchError((error) => ctx.dispatch(new LoadTutorsFail(error)))
        );
    }

    @Action(LoadTutorsSuccess)
    loadTutorsSuccess(ctx: StateContext<TutorStateModel>, {payload}: LoadTutorsSuccess) {
        NgxsEntityStateAdapter.addAll(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(LoadTutorsFail)
    loadTutorsFail(ctx: StateContext<TutorStateModel>, {payload}: LoadTutorsFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(LoadNextPageTutor)
    loadNextPageTutor(ctx: StateContext<TutorStateModel>, {payload}: LoadNextPageTutor) {
        return this.userResource.loadNextPageTutor(payload.skip, payload.termo).pipe(
            map((Tutor: UserModel[]) => ctx.dispatch(new LoadTutorsSuccess(Tutor))),
            catchError((error) => ctx.dispatch(new LoadTutorsFail(error)))
        );
    }

    @Action(CreateTutor)
    createTutor(ctx: StateContext<TutorStateModel>, action: CreateTutor) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.userResource.create(action.payload).pipe(
            map((Tutor: UserModel) => ctx.dispatch(new CreateTutorSuccess(Tutor))),
            catchError((error) => ctx.dispatch(new CreateTutorFail(error)))
        );
    }

    @Action(CreateTutorSuccess)
    createTutorSuccess(ctx: StateContext<TutorStateModel>, {payload}: CreateTutorSuccess) {
        NgxsEntityStateAdapter.addOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Tutor cadastrado com sucesso!');
        ctx.dispatch(new CloseTutorModal());
    }

    @Action(CreateTutorFail)
    createTutorFail(ctx: StateContext<TutorStateModel>, {payload}: CreateTutorFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(UpdateTutor)
    updateTutor(ctx: StateContext<TutorStateModel>, action: UpdateTutor) {
        ctx.patchState({isLoading: true});
        return this.userResource.update(action.payload).pipe(
            map((Tutor: UserModel) => ctx.dispatch(new UpdateTutorSuccess(Tutor))),
            catchError((error) => ctx.dispatch(new UpdateTutorFail(error)))
        );
    }

    @Action(UpdateTutorSuccess)
    updateTutorSuccess(ctx: StateContext<TutorStateModel>, {payload}: UpdateTutorSuccess) {
        NgxsEntityStateAdapter.updateOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Tutor atualizado com sucesso!');
        ctx.dispatch(new CloseTutorModal());
    }

    @Action(UpdateTutorFail)
    updateTutorFail(ctx: StateContext<TutorStateModel>, {payload}: UpdateTutorFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(DeleteTutor)
    deleteTutor(ctx: StateContext<TutorStateModel>, action: DeleteTutor) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.userResource.destroy(action.payload).pipe(
            map((Tutor: UserModel) => ctx.dispatch(new DeleteTutorSuccess(Tutor))),
            catchError((error) => ctx.dispatch(new DeleteTutorFail(error)))
        );
    }

    @Action(DeleteTutorSuccess)
    deleteTutorSuccess(ctx: StateContext<TutorStateModel>, {payload}: DeleteTutorSuccess) {
        NgxsEntityStateAdapter.removeOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Tutor excluído com sucesso!');
    }

    @Action(DeleteTutorFail)
    deleteTutorFail(ctx: StateContext<TutorStateModel>, {payload}: DeleteTutorFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(UploadImageTutor)
    uploadImageTutor(ctx: StateContext<TutorStateModel>, action: UploadImageTutor) {
        ctx.patchState({isLoadingImage: true});
        return this.userResource.uploadImage(action.payload).pipe(
            map((image: any) => ctx.dispatch(new UploadImageTutorSuccess(image))),
            catchError((error) => ctx.dispatch(new UploadImageTutorFail(error)))
        );
    }

    @Action(UploadImageTutorSuccess)
    uploadImageTutorSuccess(ctx: StateContext<TutorStateModel>, {payload}: UploadImageTutorSuccess) {
        ctx.patchState({image: payload});
        ctx.patchState({isLoadingImage: false});
    }

    @Action(UploadImageTutorFail)
    uploadImageTutorFail(ctx: StateContext<TutorStateModel>, {payload}: UploadImageTutorFail) {
        this.presentToast(payload.error.message, 'danger');
        ctx.patchState({isLoadingImage: false});
    }

    async presentToast(msg, type: string = 'success') {
        const toast = await this.toastController.create({
            message: msg,
            duration: 2000,
            color: type
        });
        toast.present();
    }
}
