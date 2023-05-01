import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/templateInterno.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterProductScreen extends StatefulWidget {
  @override
  _RegisterProductScreenState createState() => _RegisterProductScreenState();
}

class _RegisterProductScreenState extends State<RegisterProductScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Cadastro de Produto',
        colorTitle: Color.fromRGBO(162, 162, 162, 1),   
        menuLateral: true,
        menubar: true,
        builder: () {
          return DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: new Container(
              child: Stack(
                children: <Widget>[
                  new Scaffold(
                    body: Column(
                      children: <Widget>[
                        Container(
                          color: Color.fromRGBO(243, 243, 243, 1),
                          child: TabBar(
                            labelPadding: EdgeInsets.all(10),
                            indicatorColor: Color.fromRGBO(254, 193, 24, 1),
                            labelColor: Color.fromRGBO(254, 193, 24, 1),
                            unselectedLabelColor: Color.fromRGBO(169, 169, 169, 1),
                            labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            tabs: <Widget>[
                              new Tab(text: 'Dados gerais'),
                              new Tab(text: 'Dados Complementares'),
                              new Tab(text: 'Outros'),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TabBarView(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: dadosgerais(context),
                              ),
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: dadosComplementares(context)  ,
                              ),
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: outros(context)  ,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget dadosgerais(context){
    var _listTipos = ['Tipo', 'Tipo1', 'Tipo2'];
    var _listTiposEmb = ['Tipo de embalagem', 'Tipo1', 'Tipo2'];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Helpers.campoTextoInterno('Descrição completa do produto', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Código (SKU) ou referência (opcional)', Color.fromRGBO(220, 220, 220, 1), false),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Helpers.campoTextoInterno('Origem', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: dropdown('Tipo', Color.fromRGBO(220, 220, 220, 1), _listTipos),
                )
              ],
            ),
             Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('NCM', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Nomenclatura comum do Mercosul', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('GTIN/EAN', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Global Trade Item Number', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('Código CEST', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Código Especificador da Substituição Trinutária', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Preço da venda', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Unidade', Color.fromRGBO(220, 220, 220, 1), false),
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Text('')
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Dimensões e peso',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 143, 143, 1)
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Peso Liquido em Kg', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Peso Bruto em kg', Color.fromRGBO(220, 220, 220, 1), false),
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: dropdown('Tipo de embalagem', Color.fromRGBO(220, 220, 220, 1), _listTiposEmb)
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Largura', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Altura', Color.fromRGBO(220, 220, 220, 1), false),
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Comprimento', Color.fromRGBO(220, 220, 220, 1), false),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dadosComplementares(context){
    var _listCategoria = ['Categoria', 'Categoria1', 'Categoria2'];
    var _listMarca = ['Marca', 'Marca1', 'Marca2'];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              child: Text(
                'Descrição complementar',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 143, 143, 1)
                ),
              ),
            ),
            Helpers.CampoTextArea('', Color.fromRGBO(220, 220, 220, 1), 12),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 25),
              child: Text(
                'Outras fotos do produto',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 143, 143, 1)
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: DottedBorder(
              dashPattern: [6, 4],
              color: Color.fromRGBO(152, 152, 152, 1),
              borderType: BorderType.Rect,
              radius: Radius.circular(20),
              strokeWidth: 2,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 200,
                      height: 200,
                      color: Colors.white,
                      child: Wrap(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(192, 192, 192, 1), width: 5),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(
                                child: Icon(Icons.add, color: Color.fromRGBO(192, 192, 192, 1), size: 70,),
                              ),
                            )
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Adicionar foto',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(152, 152, 152, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                        ],
                      )),
                ),
              )),
                ),
                Expanded(
                  flex: 6,
                  child: Text(''),
                )
              ],
            )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DottedBorder(
              dashPattern: [6, 4],
              color: Color.fromRGBO(152, 152, 152, 1),
              borderType: BorderType.Rect,
              radius: Radius.circular(20),
              strokeWidth: 2,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 250,
                      color: Colors.white,
                      child: Wrap(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/destac.png',
                              height: 180,
                              width: 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Selecionar imagem destacada',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(152, 152, 152, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                        ],
                      )),
                ),
              )),
              SizedBox(height: 40,),
              dropdown('Categoria', Color.fromRGBO(220, 220, 220, 1), _listCategoria),
              dropdown('Marca', Color.fromRGBO(220, 220, 220, 1), _listMarca),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget outros(context){
    var _listLinhaProd = ['Linha do produto', 'Tipo1', 'Tipo2'];
    var _listSituacao = ['Situação', 'Tipo1', 'Tipo2'];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Helpers.campoTextoInterno('Fabricante ou fornecedor deste produto', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Código do produto pelo fabricante', Color.fromRGBO(220, 220, 220, 1), false),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Unidade por caixa', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Preço de custo', Color.fromRGBO(220, 220, 220, 1), false),
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: dropdown('Linha do produto', Color.fromRGBO(220, 220, 220, 1), _listLinhaProd)
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Garantia em meses ou dias', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: dropdown('Situação', Color.fromRGBO(220, 220, 220, 1), _listSituacao)
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Text('')
                )
              ],
            ),
             
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Preço da venda', Color.fromRGBO(220, 220, 220, 1), false),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Helpers.campoTextoInterno('Unidade', Color.fromRGBO(220, 220, 220, 1), false),
                     
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Text('')
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Descrição complementar',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 143, 143, 1)
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('GTIN/EAN tributável', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Utilizado apenas para Caixa, Fardo, Lote, etc..', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[                
                      Helpers.campoTextoInterno('Unidade tributária', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Campo usado em notas fiscais de exportação', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('Fator de conversão', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Campo usado em notas fiscais de exportação', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('Código de Enquadramento IPI', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Código de Enquadramento Legal IPI', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    children: <Widget>[
                      Helpers.campoTextoInterno('Valor do IPI fixo', Color.fromRGBO(220, 220, 220, 1), false),
                      Text('Somente para produtos com tributação específica', style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 12))
                    ],
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 4,
                  child: Text('')
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdown(_mylabel, _border, _list, {Color colorlabel = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: _border, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: TextStyle(
                      color: Color.fromRGBO(140, 135, 135, 1), fontSize: 17),
                  isExpanded: true,
                  icon: Icon(
                    Icons.expand_more,
                    color: Color.fromRGBO(254, 193, 24, 1),
                  ),
                  value: _mylabel,
                  onChanged: (String newValue) {
                    setState(() {
                      _mylabel = newValue;
                    });
                  },
                  items: _list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget campoEditor(){
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(220, 220, 220, 1), width: 1),
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}