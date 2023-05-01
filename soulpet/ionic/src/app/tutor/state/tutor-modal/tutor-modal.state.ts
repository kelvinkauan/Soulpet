import {Action, State, StateContext} from '@ngxs/store';

import {OpenTutorModal, CloseTutorModal} from './tutor-modal.actions';

import {TutorModalService} from '../../services/tutor-modal.service';

export interface TutorModalStateModel {
    isLoading: boolean;
}

@State<TutorModalStateModel>({
    name: 'tutorModal',
    defaults: {
        isLoading: false
    }
})

export class TutorModalState {

    constructor(private tutorModalService: TutorModalService) {
    }

    @Action(OpenTutorModal)
    async openTutorModal(ctx: StateContext<TutorModalStateModel>, {payload}: OpenTutorModal) {
        await this.tutorModalService.open(payload.editing, (payload.data) ? payload.data : null);
    }

    @Action(CloseTutorModal)
    closeTutorModal(ctx: StateContext<TutorModalStateModel>) {
        this.tutorModalService.close();
    }

}
