import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

import {AuthSandbox} from '../../auth.sandbox';

@Component({
    selector: 'app-auth',
    templateUrl: './login.page.html',
    styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

    public form: FormGroup;

    get email() {
        return this.form.get('email');
    }

    get password() {
        return this.form.get('password');
    }

    constructor(private formBuild: FormBuilder,
                private authSandbox: AuthSandbox) {
    }

    ngOnInit() {
        this.form = this.formBuild.group({
            email: [null, [Validators.required, Validators.email]],
            password: [null, [Validators.required]]
        });
    }

    onSubmit() {
        this.authSandbox.signin(this.form.value);
    }

}
