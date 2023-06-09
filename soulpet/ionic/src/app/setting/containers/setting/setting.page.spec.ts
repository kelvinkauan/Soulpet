import pkg from '@angular/core';
const CUSTOM_ELEMENTS_SCHEMA = pkg.CUSTOM_ELEMENTS_SCHEMA;
const NO_ERRORS_SCHEMA = pkg.NO_ERRORS_SCHEMA;

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
