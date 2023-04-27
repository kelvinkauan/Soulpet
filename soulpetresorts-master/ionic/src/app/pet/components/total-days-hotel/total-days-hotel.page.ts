import {Component, Input, OnInit} from '@angular/core';
import {FormGroup} from '@angular/forms';

import {ToastController} from '@ionic/angular';

@Component({
    selector: 'app-total-days-hotel',
    templateUrl: './total-days-hotel.page.html',
    styleUrls: ['./total-days-hotel.page.scss'],
})
export class TotalDaysHotelPage implements OnInit {

    @Input() checkIn;

    @Input() checkOut;

    @Input() formGroup: FormGroup;

    public differenceDays = 1;

    constructor(private toastController: ToastController) {
    }

    ngOnInit() {
    }

    public calculateDaily() {
        if (this.formGroup.valid) {
            let additionalcheckIn = 0;
            let additionalcheckOut = 0;

            const dateStart = new Date(this.formGroup.value.date_checkin);
            const hourStart = new Date(this.formGroup.value.hour_checkin);
            const dateEnd = new Date(this.formGroup.value.date_checkout);
            const hourEnd = new Date(this.formGroup.value.hour_checkout);

            if (new Date(hourStart).getTime() <
                new Date(new Date().setHours(this.checkIn.substr(0, 2), this.checkIn.substr(3, 2))).getTime()) {
                additionalcheckIn = 0.5;
            }

            if (new Date(hourEnd).getTime() >
                new Date(new Date().setHours(this.checkOut.substr(0, 2), this.checkOut.substr(3, 2))).getTime()) {
                additionalcheckOut = 0.5;
            }

            const newStart = new Date(dateStart).setHours(hourStart.getHours(), hourStart.getMinutes());
            const newEnd = new Date(dateEnd).setHours(hourEnd.getHours(), hourEnd.getMinutes());

            const timeDifference = Math.abs(newStart - newEnd);
            this.differenceDays = Math.ceil((timeDifference / (1000 * 3600 * 24)) - 1);
            this.differenceDays += additionalcheckIn + additionalcheckOut;

            if (newEnd < newStart) {
                this.presentToast('Data de Check-out deve ser maior que a de check-in!', 'danger');
                this.formGroup.get('hour_checkout').patchValue('');
            }
        }
    }

    async presentToast(msg, type: string = 'success') {
        const toast = await this.toastController.create({
            message: msg,
            duration: 2000,
            color: type
        });
        toast.present();
    }
}
