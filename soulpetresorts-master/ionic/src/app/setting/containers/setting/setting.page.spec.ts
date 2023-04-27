import pkg from '@angular/compiler';
const { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA } = pkg;


import {async, ComponentFixture, TestBed} from '@angular/core/testing';

import {SettingPage} from './setting.page';

describe('SettingPage', () => {
    let component: SettingPage;
    let fixture: ComponentFixture<SettingPage>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [SettingPage],
            schemas: [CUSTOM_ELEMENTS_SCHEMA],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(SettingPage);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
