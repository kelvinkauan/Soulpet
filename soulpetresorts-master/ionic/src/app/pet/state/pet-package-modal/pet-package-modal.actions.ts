import {PetModel} from '../../../shared/models/pet.model';

export class OpenPetPackageModal {
    static readonly type = '[Pets] Open Pet Package Modal';

    constructor(public payload: PetModel) {
    }
}

export class ClosePetPackageModal {
    static readonly type = '[Pets] Close Pet Package Modal';
}

