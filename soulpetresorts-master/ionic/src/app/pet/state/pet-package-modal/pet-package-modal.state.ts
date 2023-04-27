import {Action, State, StateContext} from '@ngxs/store';

import {OpenPetPackageModal, ClosePetPackageModal} from './pet-package-modal.actions';

import {PetPackageModalService} from '../../services/pet-package-modal.service';

export interface PetPackageModalStateModel {
    isLoading: boolean;
}

@State<PetPackageModalStateModel>({
    name: 'petPackageModal',
    defaults: {
        isLoading: false
    }
})

export class PetPackageModalState {

    constructor(private petPackageModalService: PetPackageModalService) {
    }

    @Action(OpenPetPackageModal)
    async openTutorModal(ctx: StateContext<PetPackageModalStateModel>, {payload}: OpenPetPackageModal) {
        await this.petPackageModalService.open(payload);
    }

    @Action(ClosePetPackageModal)
    closeTutorModal(ctx: StateContext<PetPackageModalStateModel>) {
        this.petPackageModalService.close();
    }

}
