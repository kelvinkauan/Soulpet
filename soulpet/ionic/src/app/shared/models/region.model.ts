import {UnityModel} from './unity.model';
import {DistrictModel} from './district.model';

export interface RegionModel {
    id?: number;
    unity: UnityModel;
    districts: DistrictModel[];
    description: string;
    status: string;
}
