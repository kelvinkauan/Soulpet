import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';

import {DailyPage} from '../containers/daily/daily.page';

const routes: Routes = [
    {
        path: '',
        component: DailyPage
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class DaycareRoutingModule {
}
