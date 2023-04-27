import {ViaCepModel} from '../../../../models/via-cep.model';

export class GetViaCep {
  static readonly type = '[ViaCep] Get Via Cep';

  constructor(public payload: number) {
  }
}

export class GetViaCepSuccess {
  static readonly type = '[ViaCep] Get Via Cep Success';

  constructor(public payload: ViaCepModel) {
  }
}

export class GetViaCepFail {
  static readonly type = '[ViaCep] Get Via Cep Fail';

  constructor(public payload: string) {
  }
}
