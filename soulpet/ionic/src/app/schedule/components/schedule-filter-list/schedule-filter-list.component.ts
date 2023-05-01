import {Component, Input, OnInit} from '@angular/core';

@Component({
    selector: 'app-schedule-filter-list',
    templateUrl: './schedule-filter-list.component.html',
    styleUrls: ['./schedule-filter-list.component.scss'],
})
export class ScheduleFilterListComponent implements OnInit {

    @Input() currentDate: Date;

    constructor() {
    }

    ngOnInit() {
    }

}
