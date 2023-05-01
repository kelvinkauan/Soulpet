import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {Observable} from 'rxjs';

import {UserModel} from '../models/user.model';
import {UnityModel} from '../models/unity.model';

import {environment} from '../../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class UserResource {
    private usersUrl = `${environment.api}/users`;

    constructor(private http: HttpClient) {
    }

    find(): Observable<UserModel[]> {
        return this.http.get<UserModel[]>(this.usersUrl);
    }

    loadNextPageTutor(skip: number, termo: string): Observable<UserModel[]> {
        return this.http.get<UserModel[]>(`${this.usersUrl}/search/term?skip=${skip}&limit=100&filter=${termo}`);
    }

    findPerAdmin(): Observable<UserModel[]> {
        return this.http.get<UserModel[]>(`${this.usersUrl}/1/load-per-admin`);
    }

    updateUnity(payload: UnityModel): Observable<UnityModel> {
        return this.http.post<UnityModel>(`${this.usersUrl}/update-unity`, payload);
    }

    findOne(payload: number): Observable<UserModel> {
        return this.http.get<UserModel>(`${this.usersUrl}/${payload}`);
    }

    create(payload: UserModel): Observable<UserModel> {
        return this.http.post<UserModel>(this.usersUrl, payload);
    }

    update(payload: UserModel): Observable<UserModel> {
        return this.http.patch<UserModel>(`${this.usersUrl}/${payload.id}`, payload);
    }

    destroy(payload: UserModel) {
        return this.http.delete(`${this.usersUrl}/${payload.id}`);
    }

    uploadImage(payload: FormData) {
        return this.http.post(`${environment.api}/upload-image`, payload);
    }
}
