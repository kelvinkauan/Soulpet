import {Component, EventEmitter, OnInit, Output} from '@angular/core';

@Component({
    selector: 'app-daily-cards',
    templateUrl: './daily-cards.page.html',
    styleUrls: ['./daily-cards.page.scss'],
})
export class DailyCardsPage implements OnInit {

    @Output() buttonClick = new EventEmitter();

    constructor() {
    }

    ngOnInit() {
    }
}
