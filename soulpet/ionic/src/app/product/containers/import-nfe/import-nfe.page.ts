import {Component, OnInit} from '@angular/core';

@Component({
    selector: 'app-import-nfe',
    templateUrl: './import-nfe.page.html',
    styleUrls: ['./import-nfe.page.scss'],
})
export class ImportNfePage implements OnInit {
    public rows: any[];
    public rowsFornecedor: any[];
    public products: any[];
    constructor() {
    }

    ngOnInit() {
        setTimeout(() => {
            this.rows = [
                {
                    modelo: '5',
                    serie: '1',
                    numero: '15668',
                    emissao: '18/12/2019 - 11:58:15',
                    totalProdutos: '3.535,94',
                    totalNfe: '3.535,94',
                    chave: '4119120652r7id88723987208987489377798',
                },
            ];
            this.rowsFornecedor = [
                {
                    cnpj: '08.652.77770001-53',
                    endereco: 'RUA WALTER PEREIRA, 186',
                    razaoSocial: 'TOTAL VET COM IMP E EXP DE PROD VET LTD',
                    bairro: 'Parque Industrial CA',
                    nomeFantasia: 'TOTAL VET COM IMP E EXP DE PR',
                    cep: '86072-420',
                    municipio: 'Londrina',
                    ie: '9039600436',
                    uf: 'PR'
                },
            ];
            this.products = [
                    {
                        nr: '1',
                        produto: '3300-0014 - PREMIER FOR RC MEDIAS AO 20KG',
                        ean: '7897348200833',
                        cod: '200472',
                        unid: 'UN',
                        vlUnit: '193,40',
                        qtde: '3,000',
                        total: '550,20',
                        produtoAssoc: 'PREMIER FOR RC MEDIAS AO 20KG',
                        qtEntr: '2',
                        preçoCusto: '172,39',
                        lucro: '29,35',
                        precoVenda: '222,99',
                        ncm: '23099010',
                        cfop: '5405',
                    },
                    {
                        nr: '2',
                        produto: '3300-0014 - PREMIER FOR RC MEDIAS AO 20KG',
                        ean: '7897348200833',
                        cod: '200472',
                        unid: 'UN',
                        vlUnit: '193,40',
                        qtde: '3,000',
                        total: '550,20',
                        produtoAssoc: 'PREMIER FOR RC MEDIAS AO 20KG',
                        qtEntr: '2',
                        preçoCusto: '172,39',
                        lucro: '29,35',
                        precoVenda: '222,99',
                        ncm: '23099010',
                        cfop: '5405',
                    },
            ];
        }, 500);
    }
}
