import {UnityModel} from './unity.model';
import {UserModel} from './user.model';
import {PetModel} from './pet.model';
import {ServiceModel} from './service.model';
import {RoomModel} from './room.model';

export interface ScheduleModel {
    id?: number;
    unity: UnityModel;
    user: UserModel;
    pet: PetModel;
    service: ServiceModel;
    room: RoomModel;
    date: string;
    hour: string;
    time: number;
    date_checkin: string;
    hour_checkin: string;
    date_checkout: string;
    hour_checkout: string;
    daily: number;
    custom: number;
    status: boolean;
    title: string;
    startTime: string;
    endTime: string;
    allDay: boolean;
    desc: string;
}
