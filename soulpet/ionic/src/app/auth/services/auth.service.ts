import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Router} from '@angular/router';

import {tap} from 'rxjs/operators';
import {Observable} from 'rxjs';

import {environment} from '../../../environments/environment';

import {SignInDto} from '../../shared/dtos/signin.dto';

import {UserInterface} from '../../shared/interfaces/user.interface';

import {UnitySandbox} from '../../unity/unity.sandbox';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor(private http: HttpClient,
                private router: Router,
                private unitySandbox: UnitySandbox) {
    }

    checkUser(): boolean {
        if (localStorage.getItem('session.user')) {
            const userDate = JSON.parse(localStorage.getItem('session.user'));
            this.unitySandbox.selectUnity(userDate.unityFull);
            this.unitySandbox.selectCategories(userDate.categories);
            this.unitySandbox.selectServiceShower(userDate.serviceShower);
            this.unitySandbox.selectServiceHotel(userDate.serviceHotel);
            this.unitySandbox.selectServiceDaycare(userDate.serviceDaycare);
        }
        return localStorage.getItem('user') ? true : false;
    }

    signin(credentials: SignInDto): Observable<boolean> {
        return this.http.post<any>(`${environment.api}/auth/login`, credentials)
            .pipe(
                tap((response) => {
                    localStorage.setItem('token', response.accessToken);
                    localStorage.setItem('user', btoa(JSON.stringify(response.user)));
                })
            );
    }

    refreshToken(credentials: SignInDto): Observable<boolean> {
        return this.http.post<any>(`${environment.api}/auth/login`, credentials)
            .pipe(
                tap((response) => {
                    localStorage.setItem('token', response.accessToken);
                    localStorage.setItem('user', btoa(JSON.stringify(response.user)));
                })
            );
    }

    logout(): void {
        this.http.get(`${environment.api}/auth/logout`).subscribe(() => {
            localStorage.clear();
            this.router.navigate(['/auth']);
        });
    }

    getUser(): UserInterface {
        return localStorage.getItem('user') ? JSON.parse(atob(localStorage.getItem('user'))) : null;
    }

    setUser(): Promise<boolean> {
        return this.http.get<any>(`${environment.api}/auth/me`)
            .toPromise()
            .then(data => {
                if (data.user) {
                    localStorage.setItem('user', btoa(JSON.stringify(data.user)));
                    return true;
                }
                return false;
            });
    }
}
