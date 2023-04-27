import {Injectable} from '@angular/core';

import {Select, Store} from '@ngxs/store';

import {Observable} from 'rxjs';

import {ScheduleSelectors} from './state/schedule/schedule.selectors';

import {ScheduleModel} from '../shared/models/schedule.model';

import {
    SelectSchedule,
    LoadSchedules,
    CreateSchedule,
    UpdateSchedule,
    DeleteSchedule, LoadDaycare
} from './state/schedule/schedule.actions';
import {
    OpenScheduleListModal,
    CloseScheduleListModal
} from './state/schedule-list-modal/schedule-list-modal.actions';

@Injectable({
    providedIn: 'root'
})
export class ScheduleSandbox {

    @Select(ScheduleSelectors.entities) schedulesCollection$: Observable<ScheduleModel[]>;

    @Select(ScheduleSelectors.selected) scheduleSelected$: Observable<ScheduleModel>;

    @Select(ScheduleSelectors.isLoading) isLoadingSchedule$: Observable<boolean>;

    constructor(private store: Store) {
    }

    public selectSchedule(schedule: ScheduleModel) {
        this.store.dispatch(new SelectSchedule(schedule));
    }

    public loadSchedules() {
        this.store.dispatch(new LoadSchedules());
    }

    public loadDaycare() {
        this.store.dispatch(new LoadDaycare());
    }

    public createSchedule(schedule: ScheduleModel) {
        this.store.dispatch(new CreateSchedule(schedule));
    }

    public updateSchedule(schedule: ScheduleModel) {
        this.store.dispatch(new UpdateSchedule(schedule));
    }

    public deleteSchedule(schedule: ScheduleModel) {
        this.store.dispatch(new DeleteSchedule(schedule));
    }

    public openScheduleListModal() {
        this.store.dispatch(new OpenScheduleListModal());
    }

    public closeScheduleListModal() {
        this.store.dispatch(new CloseScheduleListModal());
    }
}
