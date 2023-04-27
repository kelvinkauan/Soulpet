import {UserModel} from './user.model';
import {SizeModel} from './size.model';
import {BreedModel} from './breed.model';
import {TypeFurModel} from './type-fur.model';
import {RegionModel} from './region.model';
import {DistrictModel} from './district.model';

export interface ServiceModel {
    id?: number;
    user: UserModel;
    unity: number;
    service: number;
    size: SizeModel;
    breed: BreedModel;
    type_fur: TypeFurModel;
    region: RegionModel;
    districts: DistrictModel[];
    description: string;
    period: number;
    time: string;
    price: number;
    type: string;
    status: string;
    services: ServiceModel[];
}
