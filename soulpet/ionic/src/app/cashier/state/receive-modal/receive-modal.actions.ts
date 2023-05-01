export class OpenReceiveModal {
    static readonly type = '[Receives] Open Receive Modal';

    constructor(public payload: { editing: boolean }) {
    }
}

export class CloseReceiveModal {
    static readonly type = '[Receives] Close Receive Modal';
}

