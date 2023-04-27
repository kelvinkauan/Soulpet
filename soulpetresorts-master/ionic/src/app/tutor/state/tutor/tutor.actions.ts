import {UserModel} from '../../../shared/models/user.model';

export class SelectTutor {
    static readonly type = '[Tutors] Select Tutor Success';

    constructor(public payload: UserModel) {
    }
}

export class LoadTutors {
    static readonly type = '[Tutors] Load Tutors';
}

export class LoadTutorsSuccess {
    static readonly type = '[Tutors] Load Tutors Success';

    constructor(public payload: UserModel[]) {
    }
}

export class LoadTutorsFail {
    static readonly type = '[Tutors] Load Tutors Fail';

    constructor(public payload: any) {
    }
}

export class LoadNextPageTutor {
    static readonly type = '[Tutors] Load Next Page Tutor';

    constructor(public payload: { skip: number, termo?: string }) {
    }
}

export class CreateTutor {
    static readonly type = '[Tutors] Create Tutor';

    constructor(public payload: UserModel) {
    }
}

export class CreateTutorSuccess {
    static readonly type = '[Tutors] Create Tutor Success';

    constructor(public payload: UserModel) {
    }
}

export class CreateTutorFail {
    static readonly type = '[Tutors] Create Tutor Fail';

    constructor(public payload: any) {
    }
}

export class UpdateTutor {
    static readonly type = '[Tutors] Update Tutor';

    constructor(public payload: UserModel) {
    }
}

export class UpdateTutorSuccess {
    static readonly type = '[Tutors] Update Tutor Success';

    constructor(public payload: UserModel) {
    }
}

export class UpdateTutorFail {
    static readonly type = '[Tutors] Update Tutor Fail';

    constructor(public payload: any) {
    }
}

export class DeleteTutor {
    static readonly type = '[Tutors] Delete Tutor';

    constructor(public payload: UserModel) {
    }
}

export class DeleteTutorSuccess {
    static readonly type = '[Tutors] Delete Tutor Success';

    constructor(public payload: UserModel) {
    }
}

export class DeleteTutorFail {
    static readonly type = '[Tutors] Delete Tutor Fail';

    constructor(public payload: any) {
    }
}

export class UploadImageTutor {
    static readonly type = '[Tutors] Upload Image Tutor';

    constructor(public payload: FormData) {
    }
}

export class UploadImageTutorSuccess {
    static readonly type = '[Tutors] Upload Image Tutor Success';

    constructor(public payload: string) {
    }
}

export class UploadImageTutorFail {
    static readonly type = '[Tutors] Upload Image Tutor Fail';

    constructor(public payload: any) {
    }
}
