import {Action, State, StateContext} from '@ngxs/store';

import {OpenReceiveModal, CloseReceiveModal} from './receive-modal.actions';

import {ReceiveModalService} from '../../services/receive-modal.service';

export interface ReceiveModalStateModel {
    isLoading: boolean;
}

@State<ReceiveModalStateModel>({
    name: 'receiveModal',
    defaults: {
        isLoading: false
    }
})

export class ReceiveModalState {

    constructor(private receiveModalService: ReceiveModalService) {
    }

    @Action(OpenReceiveModal)
    async openTutorModal(ctx: StateContext<ReceiveModalStateModel>, {payload}: OpenReceiveModal) {
        await this.receiveModalService.open(payload.editing);
    }

    @Action(CloseReceiveModal)
    closeTutorModal(ctx: StateContext<ReceiveModalStateModel>) {
        this.receiveModalService.close();
    }

}
