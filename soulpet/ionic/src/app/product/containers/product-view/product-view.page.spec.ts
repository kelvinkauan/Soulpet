import {CUSTOM_ELEMENTS_SCHEMA} from '@angular/core';
import {async, ComponentFixture, TestBed} from '@angular/core/testing';

import {ProductViewPage} from './product-view.page';

describe('ProductViewPage', () => {
    let component: ProductViewPage;
    let fixture: ComponentFixture<ProductViewPage>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProductViewPage],
            schemas: [CUSTOM_ELEMENTS_SCHEMA],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProductViewPage);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
