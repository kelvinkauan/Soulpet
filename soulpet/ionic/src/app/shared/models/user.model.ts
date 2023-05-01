import {UnityModel} from './unity.model';
import {ServiceModel} from './service.model';
import {AddressModel} from './address.model';
import {CityModel} from './city.model';
import {ProvinceModel} from './province.model';
import {PetModel} from './pet.model';

export interface UserModel {
    id?: number;
    unity: number;
    unityFull: UnityModel;
    unityServices: ServiceModel[];
    avatar: string;
    name: string;
    date_birth: string;
    cpf: string;
    rg: string;
    document: string;
    passport: string;
    phone: string;
    cell_phone: string;
    email: string;
    phone_residential: string;
    phone_company: string;
    password: string;
    second_name: string;
    second_cpf: string;
    second_phone: string;
    units: object;
    role: string;
    status: string;
    pets: PetModel[];
    address: AddressModel;
    city: CityModel;
    province: ProvinceModel;
}
