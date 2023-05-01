import {ScheduleModel} from '../../../shared/models/schedule.model';

export class SelectSchedule {
    static readonly type = '[Schedules] Select Schedule Success';

    constructor(public payload: ScheduleModel) {
    }
}

export class LoadSchedules {
    static readonly type = '[Schedules] Load Schedules';
}

export class LoadSchedulesSuccess {
    static readonly type = '[Schedules] Load Schedules Success';

    constructor(public payload: ScheduleModel[]) {
    }
}

export class LoadSchedulesFail {
    static readonly type = '[Schedules] Load Schedules Fail';

    constructor(public payload: any) {
    }
}

export class LoadDaycare {
    static readonly type = '[Schedules] Load Daycare';
}

export class LoadDaycareSuccess {
    static readonly type = '[Schedules] Load Daycare Success';

    constructor(public payload: ScheduleModel[]) {
    }
}

export class LoadDaycareFail {
    static readonly type = '[Schedules] Load Daycare Fail';

    constructor(public payload: any) {
    }
}

export class CreateSchedule {
    static readonly type = '[Schedules] Create Schedule';

    constructor(public payload: ScheduleModel) {
    }
}

export class CreateScheduleSuccess {
    static readonly type = '[Schedules] Create Schedule Success';

    constructor(public payload: ScheduleModel) {
    }
}

export class CreateScheduleFail {
    static readonly type = '[Schedules] Create Schedule Fail';

    constructor(public payload: any) {
    }
}

export class UpdateSchedule {
    static readonly type = '[Schedules] Update Schedule';

    constructor(public payload: ScheduleModel) {
    }
}

export class UpdateScheduleSuccess {
    static readonly type = '[Schedules] Update Schedule Success';

    constructor(public payload: ScheduleModel) {
    }
}

export class UpdateScheduleFail {
    static readonly type = '[Schedules] Update Schedule Fail';

    constructor(public payload: any) {
    }
}

export class DeleteSchedule {
    static readonly type = '[Schedules] Delete Schedule';

    constructor(public payload: ScheduleModel) {
    }
}

export class DeleteScheduleSuccess {
    static readonly type = '[Schedules] Delete Schedule Success';

    constructor(public payload: ScheduleModel) {
    }
}

export class DeleteScheduleFail {
    static readonly type = '[Schedules] Delete Schedule Fail';

    constructor(public payload: any) {
    }
}
