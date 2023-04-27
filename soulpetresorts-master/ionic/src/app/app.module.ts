import {LOCALE_ID, NgModule} from '@angular/core';
import {HashLocationStrategy, LocationStrategy, registerLocaleData} from '@angular/common';
import {BrowserModule} from '@angular/platform-browser';
import {RouteReuseStrategy} from '@angular/router';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import localePt from '@angular/common/locales/pt';

registerLocaleData(localePt, 'pt-BR');

import {IonicModule, IonicRouteStrategy} from '@ionic/angular';
import {SplashScreen} from '@ionic-native/splash-screen/ngx';
import {StatusBar} from '@ionic-native/status-bar/ngx';

import {NgxMaskModule} from 'ngx-mask';

import {NgxsModule} from '@ngxs/store';
import {NgxsSelectSnapshotModule} from '@ngxs-labs/select-snapshot';
import {NgxsLoggerPluginModule} from '@ngxs/logger-plugin';
import {NgxsReduxDevtoolsPluginModule} from '@ngxs/devtools-plugin';
import {NgxsRouterPluginModule} from '@ngxs/router-plugin';
import {NgxsStoragePluginModule} from '@ngxs/storage-plugin';
import {NgxsConfiguration, NgxsLoggerPluginConfiguration} from './shared/core/configurations/ngxs.configuration';

import {AppRoutingModule} from './app-routing.module';
import {SessionModule} from './session/session.module';

import {RequestInterceptor} from './shared/intercepetors/request.interceptor';
import {RefreshInterceptor} from './shared/intercepetors/refresh.interceptor';

import {AppComponent} from './app.component';

@NgModule({
    declarations: [AppComponent],
    entryComponents: [],
    imports: [
        BrowserModule,
        IonicModule.forRoot(),

        NgxMaskModule.forRoot(),

        NgxsModule.forRoot([], NgxsConfiguration),
        NgxsSelectSnapshotModule.forRoot(),
        NgxsLoggerPluginModule.forRoot(NgxsLoggerPluginConfiguration),
        NgxsReduxDevtoolsPluginModule.forRoot(),
        NgxsRouterPluginModule.forRoot(),
        NgxsStoragePluginModule.forRoot({key: ['session.accessToken', 'session.refreshToken', 'session.user']}),

        HttpClientModule,
        AppRoutingModule,
        SessionModule
    ],
    providers: [
        StatusBar,
        SplashScreen,
        {provide: RouteReuseStrategy, useClass: IonicRouteStrategy},
        {provide: HTTP_INTERCEPTORS, useClass: RequestInterceptor, multi: true},
        {provide: HTTP_INTERCEPTORS, useClass: RefreshInterceptor, multi: true},
        {provide: LocationStrategy, useClass: HashLocationStrategy},
        {provide: LOCALE_ID, useValue: 'pt-BR'}
    ],
    bootstrap: [AppComponent]
})
export class AppModule {
}
