import {ChangeDetectorRef, Component, OnInit} from '@angular/core';

import {AlertController} from '@ionic/angular';

import {TutorSandbox} from '../../tutor.sandbox';

@Component({
    selector: 'app-tutor',
    templateUrl: './tutor.page.html',
    styleUrls: ['./tutor.page.scss'],
})
export class TutorPage implements OnInit {

    public tutorsCollection$ = this.tutorSandbox.tutorsCollection$;

    public isLoading$ = this.tutorSandbox.isLoadingTutor$;

    public filtering = false;

    public searchField;

    constructor(private tutorSandbox: TutorSandbox,
                private alertController: AlertController,
                private changes: ChangeDetectorRef) {
    }

    ngOnInit() {
        this.tutorSandbox.loadTutors();
    }

    onChangeSearch($event) {
        this.filtering = true;
        this.tutorSandbox.loadNextPage(0, $event);
        this.changes.detectChanges();
    }

    public presentModal() {
        this.tutorSandbox.openModal(false);
    }

    public selectTutor(tutor) {
        this.tutorSandbox.selectTutor(tutor);
        this.tutorSandbox.openModal(true, tutor);
    }

    async confirmTutor(tutor) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o tutor: <strong>${tutor.name}</strong>?`,
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
                        this.tutorSandbox.deleteTutor(tutor);
                    }
                }
            ]
        });
        await alert.present();
    }

    openViewTutor(tutor) {
        this.tutorSandbox.openTutorViewModal(tutor);
    }

}
