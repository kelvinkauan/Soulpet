import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';

import {BrMaskerModule} from 'br-mask';

import {NgxsModule} from '@ngxs/store';

import {PetRoutingModule} from './routers/pet-routing.module';

import {ValidationMessageModule} from '../shared/components/validation-message/validation-message.module';
import {HeaderModule} from '../shared/components/header/header.module';
import {FooterModalModule} from '../shared/components/footer-modal/footer-modal.module';
import {HeaderModalModule} from '../shared/components/header-modal/header-modal.module';
import {FooterButtonModule} from '../shared/components/footer-button/footer-button.module';
import {CardPetModule} from '../shared/components/card-pet/card-pet.module';
import {CardButtonModule} from '../shared/components/card-button/card-button.module';
import {FileModule} from '../shared/components/file/file.module';
import {SettingModule} from '../setting/setting.module';
import {PipesModule} from '../shared/pipes/pipes.module';

import {PetState} from './state/pet/pet.state';
import {PetEvaluationState} from './state/pet-evaluation/pet-evaluation.state';
import {ModuleHotelModalState} from './state/module-hotel-modal/module-hotel-modal.state';
import {PetScheduleModalState} from './state/pet-schedule-modal/pet-schedule-modal.state';
import {PetModalState} from './state/pet-modal/pet-modal.state';
import {PetServiceModalState} from './state/pet-service-modal/pet-service-modal.state';
import {PetProfileModalState} from './state/pet-profile-modal/pet-profile-modal.state';
import {PetEvaluationModalState} from './state/pet-evaluation-modal/pet-evaluation-modal.state';
import {PetEvaluationInfoInfoModalState} from './state/pet-evaluation-info-modal/pet-evaluation-info-modal.state';
import {ServicePetSitterModalState} from './state/service-pet-sitter-modal/service-pet-sitter-modal.state';
import {PetSpaModalState} from './state/pet-spa-modal/pet-spa-modal.state';
import {PetCartModalState} from './state/pet-cart-modal/pet-cart-modal.state';
import {DaycareCreateModalState} from './state/daycare-create-modal/daycare-create-modal.state';
import {PetPackageModalState} from './state/pet-package-modal/pet-package-modal.state';

import {PetModalService} from './services/pet-modal.service';
import {PetProfileModalService} from './services/pet-profile-modal.service';
import {PetEvaluationModalService} from './services/pet-evaluation-modal.service';
import {PetEvaluationInfoModalService} from './services/pet-evaluation-info-modal.service';
import {ModuleHotelModalService} from './services/module-hotel-modal.service';
import {PetServiceModalService} from './services/pet-service-modal.service';
import {PetSitterModalService} from './services/pet-sitter-modal.service';
import {PetSpaModalService} from './services/pet-spa-modal.service';
import {PetScheduleModalService} from './services/pet-schedule-modal.service';
import {PetCartModalService} from './services/pet-cart-modal.service';
import {DaycareCreateModalService} from './services/daycare-create-modal.service';
import {PetPackageModalService} from './services/pet-package-modal.service';

import {PetPage} from './containers/pet/pet.page';
import {PetCreatePage} from './containers/pet-create/pet-create.page';
import {PetServicePage} from './containers/pet-service/pet-service.page';
import {PetProfilePage} from './containers/pet-profile/pet-profile.page';
import {PetEvaluationPage} from './containers/pet-evaluation/pet-evaluation.page';
import {PetEvaluationInfoPage} from './containers/pet-evaluation-info/pet-evaluation-info.page';
import {ModuleHotelPage} from './containers/module-hotel/module-hotel.page';
import {PetSitterPage} from './containers/pet-sitter/pet-sitter.page';
import {PetSpaPage} from './containers/pet-spa/pet-spa.page';
import {ScheduleCreatePage} from './components/schedule-create/schedule-create.page';
import {PetCartModalPage} from './components/pet-cart-modal/pet-cart-modal.page';
import {DaycareCreatePage} from './components/daycare-create/daycare-create.page';
import {TotalDaysHotelPage} from './components/total-days-hotel/total-days-hotel.page';
import {PetPackagePage} from './containers/pet-package/pet-package.page';

@NgModule({
    declarations: [
        PetPage,
        PetCreatePage,
        PetServicePage,
        PetProfilePage,
        PetEvaluationPage,
        PetEvaluationInfoPage,
        ModuleHotelPage,
        PetSitterPage,
        PetSpaPage,
        ScheduleCreatePage,
        PetCartModalPage,
        DaycareCreatePage,
        TotalDaysHotelPage,
        PetPackagePage
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        NgxDatatableModule,
        PetRoutingModule,
        BrMaskerModule,
        NgxsModule.forFeature([
            PetState,
            PetEvaluationState,
            ModuleHotelModalState,
            PetModalState,
            PetServiceModalState,
            PetProfileModalState,
            PetEvaluationModalState,
            PetEvaluationInfoInfoModalState,
            ServicePetSitterModalState,
            PetSpaModalState,
            PetScheduleModalState,
            PetCartModalState,
            DaycareCreateModalState,
            PetPackageModalState
        ]),
        ValidationMessageModule,
        HeaderModule,
        FooterButtonModule,
        HeaderModalModule,
        FooterModalModule,
        CardPetModule,
        CardButtonModule,
        FileModule,
        SettingModule,
        PipesModule
    ],
    providers: [
        PetModalService,
        PetProfileModalService,
        PetEvaluationModalService,
        PetEvaluationInfoModalService,
        ModuleHotelModalService,
        PetServiceModalService,
        PetSpaModalService,
        PetScheduleModalService,
        PetSitterModalService,
        PetCartModalService,
        DaycareCreateModalService,
        PetPackageModalService
    ],
    entryComponents: [
        PetCreatePage,
        PetServicePage,
        PetProfilePage,
        PetEvaluationPage,
        PetEvaluationInfoPage,
        ModuleHotelPage,
        PetSitterPage,
        PetSpaPage,
        ScheduleCreatePage,
        PetCartModalPage,
        DaycareCreatePage,
        PetPackagePage
    ]
})
export class PetModule {
}
