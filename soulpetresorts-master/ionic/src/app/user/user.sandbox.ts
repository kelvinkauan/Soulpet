import {Injectable} from '@angular/core';

import {Select, Store} from '@ngxs/store';

import {Observable} from 'rxjs';

import {UserSelectors} from './state/user/user.selectors';

import {
    SelectUser,
    LoadUsers,
    CreateUser,
    UpdateUser,
    DeleteUser,
    UploadImageUser, UpdateUserUnity
} from '../user/state/user/user.actions';
import {OpenUserModal, CloseUserModal} from '../user/state/user-modal/user-modal.actions';

import {UserModel} from '../shared/models/user.model';
import {UnityModel} from '../shared/models/unity.model';

@Injectable({
    providedIn: 'root'
})
export class UserSandbox {

    @Select(UserSelectors.entities) usersCollection$: Observable<UserModel[]>;

    @Select(UserSelectors.selected) userSelected$: Observable<UserModel>;

    @Select(UserSelectors.image) imageUser$: Observable<string>;

    @Select(UserSelectors.isLoading) isLoadingUser$: Observable<boolean>;

    @Select(UserSelectors.isLoadingImage) isLoadingImageUser$: Observable<boolean>;

    constructor(private store: Store) {
    }

    public selectUser(user: UserModel) {
        this.store.dispatch(new SelectUser(user));
    }

    public loadUsers() {
        this.store.dispatch(new LoadUsers());
    }

    public createUser(user: UserModel) {
        this.store.dispatch(new CreateUser(user));
    }

    public updateUser(user: UserModel) {
        this.store.dispatch(new UpdateUser(user));
    }

    public updateUserUnity(unity: UnityModel) {
        this.store.dispatch(new UpdateUserUnity(unity));
    }

    public deleteUser(user: UserModel) {
        this.store.dispatch(new DeleteUser(user));
    }

    public uploadImageUser(image: FormData) {
        this.store.dispatch(new UploadImageUser(image));
    }

    public openModal(editing, data?) {
        this.store.dispatch(new OpenUserModal({editing, data}));
    }

    public closeModal() {
        this.store.dispatch(new CloseUserModal());
    }

}
