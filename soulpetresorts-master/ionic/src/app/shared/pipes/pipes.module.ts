import { NgModule } from '@angular/core';

import { LeftPadPipe } from './leftpad.pipe';

@NgModule({
    declarations: [
        LeftPadPipe
    ],
    exports: [
        LeftPadPipe
    ],
    providers: [
        LeftPadPipe
    ]
})
export class PipesModule {}
