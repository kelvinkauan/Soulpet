import {Component, EventEmitter, Inject, Input, LOCALE_ID, OnInit, Output, ViewChild} from '@angular/core';
import {formatDate} from '@angular/common';

import {AlertController} from '@ionic/angular';

import {CalendarComponent} from 'ionic2-calendar/calendar';

import {ScheduleModel} from '../../../shared/models/schedule.model';

@Component({
    selector: 'app-schedule-calendar',
    templateUrl: './schedule-calendar.component.html',
    styleUrls: ['./schedule-calendar.component.scss'],
})
export class ScheduleCalendarComponent implements OnInit {

    @Input() schedule: ScheduleModel[];

    @Input() currentDate: Date;

    @Input() mode = 'week';

    @Output() changeDate = new EventEmitter();

    public eventSource = [];

    public viewTitle = '';

    public event = {
        title: '',
        desc: '',
        startTime: '',
        endTime: '',
        allDay: false
    };

    @ViewChild(CalendarComponent, {static: false}) myCal: CalendarComponent;

    constructor(private alertCtrl: AlertController, @Inject(LOCALE_ID) private locale: string) {
    }

    ngOnInit() {
        this.resetEvent();
        setTimeout(() => {
            this.loadSchedule();
        }, 2000);
    }

    changedDate($event) {
        this.changeDate.emit($event);
    }

    loadSchedule() {
        this.schedule.forEach(event => {
            const eventSchedule = {
                title: event.title,
                startTime: new Date(event.startTime),
                endTime: new Date(event.endTime),
                allDay: event.allDay,
                desc: ''
            };
            this.eventSource.push(eventSchedule);
        });
        this.myCal.loadEvents();
        this.resetEvent();
    }

    addEvent() {
        const eventCopy = {
            title: this.event.title,
            startTime: new Date(this.event.startTime),
            endTime: new Date(this.event.endTime),
            allDay: this.event.allDay,
            desc: this.event.desc
        };

        if (eventCopy.allDay) {
            const start = eventCopy.startTime;
            const end = eventCopy.endTime;

            eventCopy.startTime = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth(), start.getUTCDate()));
            eventCopy.endTime = new Date(Date.UTC(end.getUTCFullYear(), end.getUTCMonth(), end.getUTCDate() + 1));
        }

        this.eventSource.push(eventCopy);
        this.myCal.loadEvents();
        this.resetEvent();
    }

    resetEvent() {
        this.event = {
            title: '',
            desc: '',
            startTime: new Date().toISOString(),
            endTime: new Date().toISOString(),
            allDay: false
        };
    }

    async onEventSelected(event) {
        const start = formatDate(event.startTime, 'medium', this.locale);
        const end = formatDate(event.endTime, 'medium', this.locale);

        const alert = await this.alertCtrl.create({
            header: event.title,
            subHeader: event.desc,
            message: 'De: ' + start + '<br>Até: ' + end,
            buttons: ['OK']
        });
        alert.present();
    }

    onViewTitleChanged(title) {
        this.viewTitle = title;
    }

    onTimeSelected(ev) {
        const selected = new Date(ev.selectedTime);
        this.event.startTime = selected.toISOString();
        selected.setHours(selected.getHours() + 1);
        this.event.endTime = (selected.toISOString());
    }
}
