import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import {IonicModule} from '@ionic/angular';

import {NgxDatatableModule} from '@swimlane/ngx-datatable';

import {BrMaskerModule} from 'br-mask';

import {NgxsModule} from '@ngxs/store';

import {ProductRoutingModule} from './routers/product-routing.module';

import {ValidationMessageModule} from '../shared/components/validation-message/validation-message.module';
import {HeaderModule} from '../shared/components/header/header.module';
import {FooterButtonModule} from '../shared/components/footer-button/footer-button.module';
import {FileModule} from '../shared/components/file/file.module';

import {ProductState} from './state/product/product.state';
import {ProductModalState} from './state/product-modal/product-modal.state';
import {ProductViewModalState} from './state/product-view-modal/product-view-modal.state';
import {ImportModalState} from './state/import-modal/import-modal.state';

import {ProductModalService} from './services/product-modal.service';
import {ProductViewModalService} from './services/product-view-modal.service';
import {ImportModalService} from './services/import-modal.service';

import {ProductPage} from './containers/product/product.page';
import {ProductCreatePage} from './containers/product-create/product-create.page';
import {ProductViewPage} from './containers/product-view/product-view.page';
import {ImportNfePage} from './containers/import-nfe/import-nfe.page';
import {ProductTabsComponent} from './components/product-tabs/product-tabs.component';

@NgModule({
    declarations: [
        ProductPage,
        ProductCreatePage,
        ProductViewPage,
        ImportNfePage,
        ProductTabsComponent
    ],
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        IonicModule,
        NgxDatatableModule,
        BrMaskerModule,
        ProductRoutingModule,
        NgxsModule.forFeature([
            ProductState,
            ProductModalState,
            ProductViewModalState,
            ImportModalState
        ]),
        ValidationMessageModule,
        HeaderModule,
        FooterButtonModule,
        FileModule
    ],
    providers: [
        ProductModalService,
        ProductViewModalService,
        ImportModalService
    ],
    entryComponents: [
        ProductCreatePage,
        ProductViewPage,
        ImportNfePage
    ]
})
export class ProductModule {
}
