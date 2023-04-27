import {Component, Input, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

import {AlertController} from '@ionic/angular';

import {PetSandbox} from '../../pet.sandbox';
import {ScheduleSandbox} from '../../../schedule/schedule.sandbox';
import {SettingSandbox} from '../../../setting/setting.sandbox';

import {PetModel} from '../../../shared/models/pet.model';
import {RoomModel} from '../../../shared/models/room.model';

@Component({
    selector: 'app-module-hotel',
    templateUrl: './module-hotel.page.html',
    styleUrls: ['./module-hotel.page.scss'],
})
export class ModuleHotelPage implements OnInit {

    @Input() pet: PetModel;

    public roomsCollection$ = this.settingSandbox.roomsCollection$;

    public checksCollection$ = this.settingSandbox.checksCollection$;

    public checkIn$ = this.settingSandbox.checkIn$;

    public checkOut$ = this.settingSandbox.checkOut$;

    public serviceHotel = this.settingSandbox.serviceHotel;

    @ViewChild('totalDays', {static: false}) totalDays;

    public formGroup: FormGroup;

    public selectedRoom: number;

    constructor(private petSandbox: PetSandbox,
                private scheduleSandbox: ScheduleSandbox,
                private settingSandbox: SettingSandbox,
                private formBuilder: FormBuilder,
                private alertController: AlertController) {
        this.formGroup = this.formBuilder.group({
            id: [null],
            service: [null],
            date_checkin: ['', [Validators.required]],
            hour_checkin: ['', [Validators.required]],
            date_checkout: ['', [Validators.required]],
            hour_checkout: ['', [Validators.required]],
            room: ['', [Validators.required]],
            pet: ['', [Validators.required]]
        });
    }

    ngOnInit() {
        this.settingSandbox.loadRooms();
        this.settingSandbox.loadChecks();

        if (this.pet) {
            this.formGroup.get('service').patchValue(this.serviceHotel.id);
            this.formGroup.get('pet').patchValue(this.pet);
        }
    }

    public selectRoom(room: RoomModel) {
        this.selectedRoom = room.id;
        this.formGroup.get('room').patchValue(room);
        this.totalDays.calculateDaily();
    }

    async confirmPet(pet) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o pet: <strong>${pet.name}</strong>?`,
            buttons: [
                {
                    text: 'Cancelar',
                    role: 'cancel',
                    cssClass: 'secondary',
                    handler: () => {
                        console.log('Cancelou');
                    }
                }, {
                    text: 'Sim',
                    handler: () => {
                        this.pet = null;
                    }
                }
            ]
        });
        await alert.present();
    }

    public onClickCancel() {
        this.petSandbox.closeModalModuleHotel();
    }

    public onClickConfirm() {
        this.scheduleSandbox.createSchedule(this.formGroup.value);
    }

    String(type: number) {
        return String(type);
    }
}
