import {Selector} from '@ngxs/store';

import {TutorState, TutorStateModel} from './tutor.state';

import {NgxsEntityStateSelector} from '../../../shared/libs/ngxs-entity-state/src/lib';

export class TutorSelectors {
    @Selector([TutorState.entities])
    static entities(entities: TutorStateModel['entities']) {
        return new NgxsEntityStateSelector().getEntities(entities);
    }

    @Selector([TutorState.selected])
    static selected(selected: TutorStateModel['selected']) {
        return selected;
    }

    @Selector([TutorState.isLoading])
    static isLoading(isLoading: TutorStateModel['isLoading']) {
        return isLoading;
    }

    @Selector([TutorState.isLoadingImage])
    static isLoadingImage(isLoadingImage: TutorStateModel['isLoadingImage']) {
        return isLoadingImage;
    }

    @Selector([TutorState.image])
    static image(image: TutorStateModel['image']) {
        return image;
    }
}
