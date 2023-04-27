import {UnityModel} from './unity.model';

export interface PriceVariationModel {
    id?: number;
    unity: UnityModel;
    description: string;
    start: string;
    end: string;
    value: number;
    percent: number;
    module: string;
    status: boolean;
}
