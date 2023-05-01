import {Component, OnInit} from '@angular/core';

import {ScheduleSandbox} from '../../schedule.sandbox';

@Component({
    selector: 'app-schedule-list',
    templateUrl: './schedule-list.page.html',
    styleUrls: ['./schedule-list.page.scss'],
})
export class ScheduleListPage implements OnInit {

    public tab = 'all';

    public schedulesCollection$ = this.scheduleSandbox.schedulesCollection$;

    public isLoading$ = this.scheduleSandbox.isLoadingSchedule$;

    constructor(private scheduleSandbox: ScheduleSandbox) {
    }

    ngOnInit() {
        this.scheduleSandbox.loadSchedules();
    }

    public onTab(tab) {
        this.tab = tab;
    }
}
