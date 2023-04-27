import {Injectable} from '@angular/core';

import {Store} from '@ngxs/store';

import {
    OpenVeterinaryCreateModal,
    CloseVeterinaryCreateModal
} from './state/veterinary-create-modal/veterinary-create-modal.actions';
import {
    OpenVeterinaryViewModal,
    CloseVeterinaryViewModal
} from './state/veterinary-view-modal/veterinary-view-modal.actions';

@Injectable({
    providedIn: 'root'
})
export class VeterinarySandbox {

    constructor(private store: Store) {
    }

    public openModalVeterinaryCreate() {
        this.store.dispatch(new OpenVeterinaryCreateModal());
    }

    public closeModalVeterinaryCreate() {
        this.store.dispatch(new CloseVeterinaryCreateModal());
    }

    public openModalVeterinaryView() {
        this.store.dispatch(new OpenVeterinaryViewModal());
    }

    public closeModalVeterinaryView() {
        this.store.dispatch(new CloseVeterinaryViewModal());
    }
}
