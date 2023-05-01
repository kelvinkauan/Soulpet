import {Component, OnInit} from '@angular/core';

import {AlertController} from '@ionic/angular';

import {UserSandbox} from '../../../user/user.sandbox';

@Component({
    selector: 'app-user',
    templateUrl: './user.page.html',
    styleUrls: ['./user.page.scss'],
})
export class UserPage implements OnInit {

    public tab = 'user';

    public usersCollection$ = this.userSandbox.usersCollection$;

    public isLoading$ = this.userSandbox.isLoadingUser$;

    constructor(private userSandbox: UserSandbox, private alertController: AlertController) {
    }

    ngOnInit() {
        this.userSandbox.loadUsers();
    }

    public onTab(tab) {
        this.tab = tab;
    }

    public presentModal() {
        this.userSandbox.openModal(false);
    }

    public selectUser(user) {
        this.userSandbox.selectUser(user);
        this.userSandbox.openModal(true, user);
    }

    async confirmUser(user) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o usuário: <strong>${user.name}</strong>?`,
            buttons: [
                {
                    text: 'Cancelar',
                    role: 'cancel',
                    cssClass: 'secondary',
                    handler: () => {
                        console.log('Cancelou');
                    }
                }, {
                    text: 'Sim',
                    handler: () => {
                        this.userSandbox.deleteUser(user);
                    }
                }
            ]
        });
        await alert.present();
    }

}
