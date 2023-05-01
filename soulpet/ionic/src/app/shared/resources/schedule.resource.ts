import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {Observable} from 'rxjs';

import {ScheduleModel} from '../models/schedule.model';

import {environment} from '../../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class ScheduleResource {
    private schedulesUrl = `${environment.api}/schedules`;

    constructor(private http: HttpClient) {
    }

    find(): Observable<ScheduleModel[]> {
        return this.http.get<ScheduleModel[]>(this.schedulesUrl);
    }

    findDaycare(): Observable<ScheduleModel[]> {
        return this.http.get<ScheduleModel[]>(`${this.schedulesUrl}/1/daycare`);
    }

    findOne(payload: number): Observable<ScheduleModel> {
        return this.http.get<ScheduleModel>(`${this.schedulesUrl}/${payload}`);
    }

    create(payload: ScheduleModel): Observable<ScheduleModel> {
        return this.http.post<ScheduleModel>(this.schedulesUrl, payload);
    }

    update(payload: ScheduleModel): Observable<ScheduleModel> {
        return this.http.patch<ScheduleModel>(`${this.schedulesUrl}/${payload.id}`, payload);
    }

    destroy(payload: ScheduleModel) {
        return this.http.delete(`${this.schedulesUrl}/${payload.id}`);
    }
}
