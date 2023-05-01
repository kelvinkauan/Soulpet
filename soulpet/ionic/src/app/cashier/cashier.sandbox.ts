import {Injectable} from '@angular/core';

import {Store} from '@ngxs/store';

import {CloseReceiveModal, OpenReceiveModal} from './state/receive-modal/receive-modal.actions';

@Injectable({
    providedIn: 'root'
})
export class CashierSandbox {

    constructor(private store: Store) {
    }

    public openModal(editing) {
        this.store.dispatch(new OpenReceiveModal({editing}));
    }

    public closeModal() {
        this.store.dispatch(new CloseReceiveModal());
    }

}
