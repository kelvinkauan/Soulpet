import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';

@Component({
    selector: 'app-schedule-filter',
    templateUrl: './schedule-filter.component.html',
    styleUrls: ['./schedule-filter.component.scss'],
})
export class ScheduleFilterComponent implements OnInit {

    @Input() currentDate: Date;

    @Output() clickView = new EventEmitter();

    @Output() backDate = new EventEmitter();

    @Output() forwardDate = new EventEmitter();

    constructor() {
    }

    ngOnInit() {
    }

}
