import {Injectable} from '@angular/core';

import {ToastController} from '@ionic/angular';

import {Action, Selector, State, StateContext} from '@ngxs/store';

import {catchError, map} from 'rxjs/operators';

import {NgxsEntityStateAdapter, NgxsEntityStateStateModel} from '../../../shared/libs/ngxs-entity-state/src/lib';

import {
    SelectSchedule,
    LoadSchedules,
    LoadSchedulesSuccess,
    LoadSchedulesFail,
    LoadDaycare,
    LoadDaycareSuccess,
    LoadDaycareFail,
    CreateSchedule,
    CreateScheduleSuccess,
    CreateScheduleFail,
    UpdateSchedule,
    UpdateScheduleSuccess,
    UpdateScheduleFail,
    DeleteSchedule,
    DeleteScheduleSuccess,
    DeleteScheduleFail
} from './schedule.actions';
import {AddItem} from '../../../cart/state/order/order.actions';
import {ClosePetScheduleModal} from '../../../pet/state/pet-schedule-modal/pet-schedule-modal.actions';
import {OpenPetCartModal} from '../../../pet/state/pet-cart-modal/pet-cart-modal.actions';
import {CloseDaycareCreateModal} from '../../../pet/state/daycare-create-modal/daycare-create-modal.actions';

import {ScheduleModel} from '../../../shared/models/schedule.model';

import {ScheduleResource} from '../../../shared/resources/schedule.resource';

export class ScheduleStateModel extends NgxsEntityStateStateModel<ScheduleModel> {
    isLoading: boolean;
}

@State<ScheduleStateModel>({
    name: 'schedule',
    defaults: {
        ids: [],
        entities: {},
        selected: null,
        isLoading: false
    }
})
@Injectable()
export class ScheduleState {

    @Selector()
    static selected(state: ScheduleStateModel) {
        return state.entities[state.selected.id];
    }

    @Selector()
    static isLoading(state: ScheduleStateModel) {
        return state.isLoading;
    }

    @Selector()
    static entities(state: ScheduleStateModel) {
        return state.entities;
    }

    constructor(private scheduleResource: ScheduleResource,
                private toastController: ToastController) {
    }

    @Action(SelectSchedule)
    selectSchedule(ctx: StateContext<ScheduleStateModel>, {payload}: SelectSchedule) {
        NgxsEntityStateAdapter.select(payload, ctx);
    }

    @Action(LoadSchedules)
    loadSchedules(ctx: StateContext<ScheduleStateModel>) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.scheduleResource.find().pipe(
            map((Schedule: ScheduleModel[]) => ctx.dispatch(new LoadSchedulesSuccess(Schedule))),
            catchError((error) => ctx.dispatch(new LoadSchedulesFail(error)))
        );
    }

    @Action(LoadSchedulesSuccess)
    loadSchedulesSuccess(ctx: StateContext<ScheduleStateModel>, {payload}: LoadSchedulesSuccess) {
        NgxsEntityStateAdapter.addAll(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(LoadSchedulesFail)
    loadSchedulesFail(ctx: StateContext<ScheduleStateModel>, {payload}: LoadSchedulesFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(LoadDaycare)
    loadDaycare(ctx: StateContext<ScheduleStateModel>) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.scheduleResource.findDaycare().pipe(
            map((Schedule: ScheduleModel[]) => ctx.dispatch(new LoadDaycareSuccess(Schedule))),
            catchError((error) => ctx.dispatch(new LoadDaycareFail(error)))
        );
    }

    @Action(LoadDaycareSuccess)
    loadDaycareSuccess(ctx: StateContext<ScheduleStateModel>, {payload}: LoadDaycareSuccess) {
        NgxsEntityStateAdapter.addAll(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(LoadDaycareFail)
    loadDaycareFail(ctx: StateContext<ScheduleStateModel>, {payload}: LoadDaycareFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(CreateSchedule)
    createSchedule(ctx: StateContext<ScheduleStateModel>, action: CreateSchedule) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.scheduleResource.create(action.payload).pipe(
            map((Schedule: ScheduleModel) => ctx.dispatch(new CreateScheduleSuccess(Schedule))),
            catchError((error) => ctx.dispatch(new CreateScheduleFail(error)))
        );
    }

    @Action(CreateScheduleSuccess)
    createScheduleSuccess(ctx: StateContext<ScheduleStateModel>, {payload}: CreateScheduleSuccess) {
        NgxsEntityStateAdapter.addOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Agendamento do serviço realizado com sucesso!');
        ctx.dispatch(new AddItem(payload.service));
        ctx.dispatch(new OpenPetCartModal());
        ctx.dispatch(new SelectSchedule(payload));
        ctx.dispatch(new ClosePetScheduleModal());
        ctx.dispatch(new CloseDaycareCreateModal());
    }

    @Action(CreateScheduleFail)
    createScheduleFail(ctx: StateContext<ScheduleStateModel>, {payload}: CreateScheduleFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(UpdateSchedule)
    updateSchedule(ctx: StateContext<ScheduleStateModel>, action: UpdateSchedule) {
        ctx.patchState({isLoading: true});
        return this.scheduleResource.update(action.payload).pipe(
            map((Schedule: ScheduleModel) => ctx.dispatch(new UpdateScheduleSuccess(Schedule))),
            catchError((error) => ctx.dispatch(new UpdateScheduleFail(error)))
        );
    }

    @Action(UpdateScheduleSuccess)
    updateScheduleSuccess(ctx: StateContext<ScheduleStateModel>, {payload}: UpdateScheduleSuccess) {
        NgxsEntityStateAdapter.updateOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Agendamento do serviço atualizado com sucesso!');
        ctx.dispatch(new ClosePetScheduleModal());
        ctx.dispatch(new CloseDaycareCreateModal());
    }

    @Action(UpdateScheduleFail)
    updateScheduleFail(ctx: StateContext<ScheduleStateModel>, {payload}: UpdateScheduleFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
    }

    @Action(DeleteSchedule)
    deleteSchedule(ctx: StateContext<ScheduleStateModel>, action: DeleteSchedule) {
        NgxsEntityStateAdapter.startLoading(ctx);
        return this.scheduleResource.destroy(action.payload).pipe(
            map((Schedule: ScheduleModel) => ctx.dispatch(new DeleteScheduleSuccess(Schedule))),
            catchError((error) => ctx.dispatch(new DeleteScheduleFail(error)))
        );
    }

    @Action(DeleteScheduleSuccess)
    deleteScheduleSuccess(ctx: StateContext<ScheduleStateModel>, {payload}: DeleteScheduleSuccess) {
        NgxsEntityStateAdapter.removeOne(payload, ctx);
        NgxsEntityStateAdapter.stopLoading(ctx);
        this.presentToast('Agendamento do serviço excluído com sucesso!');
    }

    @Action(DeleteScheduleFail)
    deleteScheduleFail(ctx: StateContext<ScheduleStateModel>, {payload}: DeleteScheduleFail) {
        this.presentToast(payload.error.message, 'danger');
        NgxsEntityStateAdapter.stopLoading(ctx);
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
