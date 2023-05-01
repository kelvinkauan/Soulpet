import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {Router} from '@angular/router';

import {ModalController} from '@ionic/angular';

import {SessionSandbox} from '../../../../session/session.sandbox';

import {UserModel} from '../../../models/user.model';
import {OrderModel} from '../../../models/order.model';

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {

    @Input() title: string;

    @Input() showButtonBack = false;

    @Input() headerActions = false;

    @Input() isCart = false;

    @Input() order: OrderModel;

    @Input() profile: UserModel;

    @Input() buttonTitle: string;

    @Input() descriptionSearch: string;

    @Output() actionButton = new EventEmitter();

    constructor(private modalController: ModalController, private router: Router, public sessionSandbox: SessionSandbox) {
    }

    ngOnInit() {
    }

    public onClickBack() {
        this.modalController.dismiss();
    }

    public onClickCart() {
        this.closeModals().then(() => {
            this.router.navigate(['main/cart']);
        });
    }

    async closeModals() {
        await this.modalController.dismiss().catch(reason => console.log('reason: ', reason));
    }

}
