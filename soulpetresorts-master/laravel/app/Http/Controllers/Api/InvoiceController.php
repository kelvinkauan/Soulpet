<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Orchestra\Parser\Xml\Facade as XmlParser;

class InvoiceController extends Controller
{
    public function index()
    {
        $xml = simplexml_load_string(file_get_contents(__DIR__  . '/../../../../invoice-data.xml'));

        $data = [];
        $data['nfe'] = [
            'model' => trim($xml->NFe->infNFe->ide->mod),
            'series' => trim($xml->NFe->infNFe->ide->serie),
            'number' => trim($xml->NFe->infNFe->ide->nNF),
            'emission_date' => trim($xml->NFe->infNFe->ide->dhEmi),

            // Check // valor total de produtos e valor total N.F
            'price' =>  trim($xml->NFe->infNFe->ide->verProc),
            'access_key' => trim($xml->NFe->infNFe['Id'])
        ];

        $data['provider'] = [
            'cnpj' =>  trim($xml->NFe->infNFe->emit->CNPJ),
            'address' => trim($xml->NFe->infNFe->emit->enderEmit->xLgr) . trim($xml->NFe->infNFe->emit->enderEmit->nro),
            'district' =>  trim($xml->NFe->infNFe->emit->enderEmit->xBairro),
            'cep' => trim($xml->NFe->infNFe->emit->enderEmit->CEP),
            'municipio' => trim($xml->NFe->infNFe->emit->enderEmit->xMun),
            'uf' => trim($xml->NFe->infNFe->emit->enderEmit->UF),
            'ie' => trim($xml->NFe->infNFe->emit->IE),
            'company_name' => trim($xml->NFe->infNFe->emit->xNome), // razao social
            // @check nome Fantasia?
        ];

        $data['products'] = [];

        foreach($xml->NFe->infNFe->det as $det) {
            $data['products'][] = [
                'id' => trim($det['nItem']),
                'name' => trim($det->prod->xProd),
                'ean' => trim($det->prod->cEAN),
                'unity' => trim($det->prod->uCom),
                'unity_price' => trim($det->prod->vProd),
                'quantity' => trim($det->prod->qCom),
                'total' => number_format(trim($det->prod->vProd) * trim($det->prod->qCom), 2, ',', ''),
                'cfom' => '',
                'assoc_prod' => '', // produto associado
                'unit_comercialization' => '', // unidade comercialização
                'qt_stock' => '', // qt entrada estoque
                'price_cost' => '', // preço custo
                'profit_margin' => '', // mrg lucro
                'price_sale' => '', // preço venda
                'classification' => '', // classificacao
                'manufacturing' => '', // fabricante
                'ncm' => trim($det->prod->NCM),
                'cfop' => trim($det->prod->CFOP),
            ];
        }

        $data['payments'] = [];

        $payments = $xml->NFe->infNFe->cobr->dup;
        if(!is_array($payments)) {
            $payments = [$payments];
        }

        foreach ($payments as $dup) {
            $data['payments'][] = [
                'date' => trim($dup->dVenc),
                'doc' => trim($dup->nDup),
                'value' => trim($dup->vDup),
                'additional_info' => 'BOLETO' // default as Boleto.
            ];
        }

        // return view('invoice.index', ['data' => $data]);
        return response()->json(['data' => $data]);

    }
}
