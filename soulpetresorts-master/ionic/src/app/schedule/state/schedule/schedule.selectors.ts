import {Selector} from '@ngxs/store';

import {ScheduleState, ScheduleStateModel} from './schedule.state';

import {NgxsEntityStateSelector} from '../../../shared/libs/ngxs-entity-state/src/lib';

export class ScheduleSelectors {
    @Selector([ScheduleState.entities])
    static entities(entities: ScheduleStateModel['entities']) {
        return new NgxsEntityStateSelector().getEntities(entities);
    }

    @Selector([ScheduleState.selected])
    static selected(selected: ScheduleStateModel['selected']) {
        return selected;
    }

    @Selector([ScheduleState.isLoading])
    static isLoading(isLoading: ScheduleStateModel['isLoading']) {
        return isLoading;
    }
}
