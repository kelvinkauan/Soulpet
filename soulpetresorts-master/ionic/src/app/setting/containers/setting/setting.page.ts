import {Component, OnInit} from '@angular/core';

import {AlertController} from '@ionic/angular';

import {SettingSandbox} from '../../setting.sandbox';

@Component({
    selector: 'app-setting',
    templateUrl: './setting.page.html',
    styleUrls: ['./setting.page.scss'],
})
export class SettingPage implements OnInit {

    public behaviorsCollection$ = this.settingSandbox.behaviorsCollection$;

    public breedsCollection$ = this.settingSandbox.breedsCollection$;

    public sizesCollection$ = this.settingSandbox.sizesCollection$;

    public typeFursCollection$ = this.settingSandbox.typeFursCollection$;

    public typesCollection$ = this.settingSandbox.typesCollection$;

    public districtsCollection$ = this.settingSandbox.districtsCollection$;

    public roomsCollection$ = this.settingSandbox.roomsCollection$;

    public regionsCollection$ = this.settingSandbox.regionsCollection$;

    public checksCollection$ = this.settingSandbox.checksCollection$;

    public priceVariationsCollection$ = this.settingSandbox.priceVariationsCollection$;

    constructor(private settingSandbox: SettingSandbox,
                private alertController: AlertController) {
    }

    ngOnInit() {
        this.settingSandbox.loadBehaviors();
        this.settingSandbox.loadBreeds();
        this.settingSandbox.loadSizes();
        this.settingSandbox.loadTypeFurs();
        this.settingSandbox.loadTypes();
        this.settingSandbox.loadDistricts();
        this.settingSandbox.loadRooms();
        this.settingSandbox.loadRegions();
        this.settingSandbox.loadChecks();
        this.settingSandbox.loadPriceVariations();
    }

    public presentModalBehavior() {
        this.settingSandbox.openModalBehavior(false);
    }

    public selectBehavior(behavior) {
        this.settingSandbox.openModalBehavior(true, behavior);
    }

    public presentModalBreed() {
        this.settingSandbox.openModalBreed(false);
    }

    public selectBreed(breed) {
        this.settingSandbox.openModalBreed(true, breed);
    }

    public presentModalSize() {
        this.settingSandbox.openModalSize(false);
    }

    public selectSize(size) {
        this.settingSandbox.openModalSize(true, size);
    }

    public presentModalTypeFur() {
        this.settingSandbox.openModalTypeFur(false);
    }

    public selectTypeFur(typeFur) {
        this.settingSandbox.openModalTypeFur(true, typeFur);
    }

    public presentModalType() {
        this.settingSandbox.openModalType(false);
    }

    public selectType(type) {
        this.settingSandbox.openModalType(true, type);
    }

    public presentModalDistrict() {
        this.settingSandbox.openModalDistrict(false);
    }

    public selectDistrict(type) {
        this.settingSandbox.openModalDistrict(true, type);
    }

    public presentModalRoom() {
        this.settingSandbox.openModalRoom(false);
    }

    public selectRoom(room) {
        this.settingSandbox.openModalRoom(true, room);
    }

    public presentModalRegion() {
        this.settingSandbox.openModalRegion(false);
    }

    public selectRegion(room) {
        this.settingSandbox.openModalRegion(true, room);
    }

    public presentModalCheck() {
        this.settingSandbox.openModalCheck(false);
    }

    public selectCheck(check) {
        this.settingSandbox.openModalCheck(true, check);
    }

    public presentModalPriceVariation() {
        this.settingSandbox.openModalPriceVariation(false);
    }

    public selectPriceVariation(check) {
        this.settingSandbox.openModalPriceVariation(true, check);
    }

    async confirmDelete(item, model: string) {
        const alert = await this.alertController.create({
            header: 'Confirma a exclusão?',
            message: `Ter certeza que deseja excluir o registro: <strong>${item.description}</strong>?`,
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
                        this.getMethodToDelete(item, model);
                    }
                }
            ]
        });
        await alert.present();
    }

    private getMethodToDelete(item, index) {
        const page = {
            behavior: () => this.settingSandbox.deleteBehavior(item),
            breed: () => this.settingSandbox.deleteBreed(item),
            size: () => this.settingSandbox.deleteSize(item),
            typeFur: () => this.settingSandbox.deleteTypeFur(item),
            type: () => this.settingSandbox.deleteType(item),
            district: () => this.settingSandbox.deleteDistrict(item),
            room: () => this.settingSandbox.deleteRoom(item),
            region: () => this.settingSandbox.deleteRegion(item),
            check: () => this.settingSandbox.deleteCheck(item),
            priceVariation: () => this.settingSandbox.deletePriceVariation(item)
        };
        return page[index]();
    }

    String(type: number) {
        return String(type);
    }
}
