import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';

import {VeterinaryPage} from '../containers/veterinary/veterinary.page';

const routes: Routes = [
    {
        path: '',
        component: VeterinaryPage
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class VeterinaryRoutingModule {
}
