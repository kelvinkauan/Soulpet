import {Action, State, StateContext} from '@ngxs/store';

import {OpenVeterinaryViewModal, CloseVeterinaryViewModal} from './veterinary-view-modal.actions';

import {VeterinaryViewModalService} from '../../services/veterinary-view-modal.service';

export interface VeterinaryViewModalStateModel {
    isLoading: boolean;
}

@State<VeterinaryViewModalStateModel>({
    name: 'veterinaryViewModal',
    defaults: {
        isLoading: false
    }
})

export class VeterinaryViewModalState {

    constructor(private veterinaryViewModalService: VeterinaryViewModalService) {
    }

    @Action(OpenVeterinaryViewModal)
    async openTutorModal(ctx: StateContext<VeterinaryViewModalStateModel>) {
        await this.veterinaryViewModalService.open();
    }

    @Action(CloseVeterinaryViewModal)
    closeTutorModal(ctx: StateContext<VeterinaryViewModalStateModel>) {
        this.veterinaryViewModalService.close();
    }

}
