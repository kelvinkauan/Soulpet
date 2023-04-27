import {Selector} from '@ngxs/store';

import {ServiceState, ServiceStateModel} from './service.state';

import {NgxsEntityStateSelector} from '../../../shared/libs/ngxs-entity-state/src/lib';

export class ServiceSelectors {
    @Selector( [ ServiceState.entities ] )
    static entities( entities: ServiceStateModel['entities'] ) {
        return new NgxsEntityStateSelector().getEntities( entities );
    }

    @Selector( [ ServiceState.selected ] )
    static selected( selected: ServiceStateModel['selected'] ) {
        return selected;
    }

    @Selector( [ ServiceState.isLoading ] )
    static isLoading( isLoading: ServiceStateModel['isLoading'] ) {
        return isLoading;
    }
}
