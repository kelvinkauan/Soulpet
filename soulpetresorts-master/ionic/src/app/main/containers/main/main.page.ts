import {Component, OnInit} from '@angular/core';

import {UnitySandbox} from '../../../unity/unity.sandbox';
import {UserSandbox} from '../../../user/user.sandbox';
import {SessionSandbox} from '../../../session/session.sandbox';

@Component({
    selector: 'app-main',
    templateUrl: './main.page.html',
    styleUrls: ['./main.page.scss'],
})
export class MainPage implements OnInit {

    public unitsCollection$ = this.unitySandbox.unitsCollection$;

    constructor(private unitySandbox: UnitySandbox,
                private userSandbox: UserSandbox,
                public sessionSandbox: SessionSandbox) {
    }

    ngOnInit() {
        this.unitySandbox.loadUnits();
    }

    public selectUnity($event) {
        this.userSandbox.updateUserUnity($event);
    }

}
