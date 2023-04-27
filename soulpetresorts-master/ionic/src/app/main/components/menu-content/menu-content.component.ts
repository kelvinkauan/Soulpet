import {Component, OnInit} from '@angular/core';

import {ModalController} from '@ionic/angular';

import {AuthSandbox} from '../../../auth/auth.sandbox';

@Component({
    selector: 'app-menu-content',
    templateUrl: './menu-content.component.html',
    styleUrls: ['./menu-content.component.scss'],
})
export class MenuContentComponent implements OnInit {

    public appPages = [
        {
            title: 'Pets',
            url: '/main/pets',
            icon: 'assets/icon/pets.svg'
        },
        {
            title: 'Caixa',
            url: '/main/cashier',
            icon: 'assets/icon/money.svg'
        },
        {
            title: 'Produtos',
            url: '/main/products',
            icon: 'assets/icon/cart.svg'
        },
        {
            title: 'Calendário',
            url: '/main/schedule',
            icon: 'assets/icon/calendar.svg'
        },
        {
            title: 'Diário',
            url: '/main/daycare',
            icon: 'assets/icon/daily.svg'
        },
        {
            title: 'Veterinário',
            url: '/main/veterinary',
            icon: 'assets/icon/stats.svg'
        },
        {
            title: 'Tutores',
            url: '/main/tutors',
            icon: 'assets/icon/smile.svg'
        },
        {
            title: 'Usuários',
            url: '/main/users',
            icon: 'assets/icon/people.svg'
        },
        {
            title: 'Relatórios',
            url: '/main/reports',
            icon: 'assets/icon/reports.svg'
        },
        {
            title: 'Unidades',
            url: '/main/units',
            icon: 'assets/icon/marker.svg'
        },
        {
            title: 'Configurações',
            url: '/main/settings',
            icon: 'assets/icon/settings.svg'
        }
    ];

    constructor(private modalController: ModalController, private authSandbox: AuthSandbox) {
    }

    ngOnInit() {
    }

    async closeModals() {
        await this.modalController.dismiss().catch(reason => console.log('reason: ', reason));
    }

    public logout() {
        this.authSandbox.logout();
    }

}
