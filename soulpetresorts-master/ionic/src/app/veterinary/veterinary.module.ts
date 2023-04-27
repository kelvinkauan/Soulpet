import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';

import {NgxsModule} from '@ngxs/store';

import {VeterinaryCreateModalState} from './state/veterinary-create-modal/veterinary-create-modal.state';
import {VeterinaryViewModalState} from './state/veterinary-view-modal/veterinary-view-modal.state';

import {VeterinaryRoutingModule} from './routers/veterinary-routing.module';

import {HeaderModule} from '../shared/components/header/header.module';
import {FooterButtonModule} from '../shared/components/footer-button/footer-button.module';
import {FooterModalModule} from '../shared/components/footer-modal/footer-modal.module';

import {VeterinaryCreateModalService} from './services/veterinary-create-modal.service';
import {VeterinaryViewModalService} from './services/veterinary-view-modal.service';

import {VeterinaryPage} from './containers/veterinary/veterinary.page';
import {VeterinaryCreatePage} from './containers/veterinary-create/veterinary-create.page';
import {VeterinaryViewPage} from './containers/veterinary-view/veterinary-view.page';

@NgModule({
    declarations: [
        VeterinaryPage,
        VeterinaryCreatePage,
        VeterinaryViewPage
    ],
    imports: [
        CommonModule,
        IonicModule,
        NgxDatatableModule,
        VeterinaryRoutingModule,
        NgxsModule.forFeature([
            VeterinaryCreateModalState,
            VeterinaryViewModalState
        ]),
        HeaderModule,
        FooterButtonModule,
        FooterModalModule
    ],
    providers: [
        VeterinaryCreateModalService,
        VeterinaryViewModalService
    ],
    entryComponents: [
        VeterinaryCreatePage,
        VeterinaryViewPage
    ]
})
export class VeterinaryModule {
}
