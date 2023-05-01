import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/clients/informationPet.dart';
import 'package:soulpet/screens/employees/registerEmployee.dart';
import 'package:soulpet/templateInterno.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Olá Fred, o que vai querer hoje?',
        colorTitle: Color.fromRGBO(254, 193, 24, 1),
        menuLateral: true,
        menubar: true,
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Wrap(
                    children: <Widget>[
                      conteudo(context), 
                      // rodape(context)
                    ],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color.fromRGBO(248, 196, 22, 1), width: 5),
                      image: DecorationImage(
                          image: AssetImage('assets/images/petAvatar.png'),
                          fit: BoxFit.contain)),
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 8,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Fred',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromRGBO(254, 193, 24, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InformationPetScreen()));
                        },
                        child: Text(
                          'Ver perfil',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(172, 172, 172, 1),
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Serviços',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(162, 162, 162, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: <Widget>[
            buttonContainer(context, 'Banho', 'modalBanho'),
            buttonContainer(context, 'Tosa', '_action'),
            buttonContainer(context, 'Hospedagem ', '_action'),
            buttonContainer(context, 'Pacotes', '_action'),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            buttonContainer(context, 'Resort', '_action'),
            buttonContainer(context, 'Creche', '_action'),
            buttonContainer(context, 'Pet Sitter ', '_action'),
            buttonContainer(context, 'Spa', '_action'),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Text(
            'Produtos',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(162, 162, 162, 1),
                fontWeight: FontWeight.bold),
          ),
              ),
              Expanded(
                flex: 4,
                child: Helpers.campoTextoPesquisa('Digite o nome do produto', Color.fromRGBO(254, 193, 24, 1)),
              )
            ],
          )
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              color: Color.fromRGBO(254, 193, 24, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black12,
                    offset: new Offset(0.50, 0.50),
                    blurRadius: 10.0)
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Foto', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 4,
                  child: Text('Nome', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 3,
                  child: Text('Valor', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Opções', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                )
              ],
            )
          ),Container(
            width: MediaQuery.of(context).size.width,
            height: 650,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black12,
                    offset: new Offset(0.50, 0.50),
                    blurRadius: 10.0)
              ],
            ),
            child: ListView(
              children: <Widget>[
                linhaProduto('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', 'Cinta', '34,90', '10'),
                linhaProduto('assets/images/guia.png', 'Guia Retrátil até 15 kg - Azul', 'Cinta', '29,90', '8'),
                linhaProduto('assets/images/guia2.png', 'Guia Retrátil até 15 kg - Vermelho', 'Cinta', '29,90', '16'),
                linhaProduto('assets/images/guia3.png', 'Guia e Peitoral barcelona - Azul', 'Cinta', '78,90', '4'),
                linhaProduto('assets/images/petisco.png', 'Pestisco Nestlé Purina Dog Chow Carinhos Mix de Frutas para Cães', 'Cinta', '5,94', '22'),
                linhaProduto('assets/images/bifinho.png', 'Bifinho Kelco Keldog Criasdores carne e Cereais Raças Pequenas', 'Cinta', '17,90', '18'),
              ],
            )
          ),
      ],
    );
  }

  Widget linhaProduto(_foto, _nome, _categoria, _valor, _estoque){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(_foto, fit: BoxFit.contain, width: 50, height: 50,)
                ),
                Expanded(
                  flex: 5,
                  child: Text(_nome, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('R\$ ' + _valor, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Color.fromRGBO(254, 193, 24, 1),),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Color.fromRGBO(145, 209, 68, 1),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterEmployeeScreen()));
                        },
                      )
                    ],
                  ),
                  )
                )
              ],
            ),
        ),
            Divider(color: Color.fromRGBO(239, 239, 239, 1),)
      ],
    );
  }
  
  Widget buttonContainer(context, _text, _action) {
    return GestureDetector(
      onTap: (){ 
        modalBanho(context);
      },
      child: Container(
      width: 200,
      margin: EdgeInsets.only(right: 50),
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Color.fromRGBO(254, 193, 24, 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Text(
        _text,
        style: TextStyle(
          color: Colors.white, 
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),
      ),
      )
    ),
    );
  }

  void modalBanho(context){
    var alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 400,
        width: 500,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: Text(
                    'Agendar Banho do Fred',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22, color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.w600),
                  ),
                )),
            Divider(color: Color.fromRGBO(194, 194, 194, 1)),
            Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Helpers.campoIcone('Data', Color.fromRGBO(220, 220, 220, 1), Icons.calendar_today),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 5,
                          child: Helpers.campoIcone('Horário', Color.fromRGBO(220, 220, 220, 1), Icons.access_alarms),
                        )
                      ],
                    ),
                    Helpers.campoIcone('Responsável', Color.fromRGBO(220, 220, 220, 1), Icons.expand_more),
                  ],
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(''),
            ),
            Divider(color: Color.fromRGBO(194, 194, 194, 1)),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Color.fromRGBO(194, 194, 194, 1)))),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color.fromRGBO(212, 49, 49, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: new FlatButton(
                          onPressed: () {
                            //alertSuccess(context);
                          },
                          child: Text(
                            'Agendar',
                            style: TextStyle(
                                color: Color.fromRGBO(70, 187, 66, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );


    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void modalTosa(context){
    var alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 400,
        width: 500,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: Text(
                    'Agendar Tosa do Fred',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22, color: Color.fromRGBO(24, 24, 24, 1), fontWeight: FontWeight.w600),
                  ),
                )),
            Divider(color: Color.fromRGBO(194, 194, 194, 1)),
            Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Helpers.campoIcone('Data', Color.fromRGBO(220, 220, 220, 1), Icons.calendar_today),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 5,
                          child: Helpers.campoIcone('Horário', Color.fromRGBO(220, 220, 220, 1), Icons.access_alarms),
                        )
                      ],
                    ),
                    Helpers.campoIcone('Responsável', Color.fromRGBO(220, 220, 220, 1), Icons.expand_more),
                  ],
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(''),
            ),
            Divider(color: Color.fromRGBO(194, 194, 194, 1)),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Color.fromRGBO(194, 194, 194, 1)))),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color.fromRGBO(212, 49, 49, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: new FlatButton(
                          onPressed: () {
                            //alertSuccess(context);
                          },
                          child: Text(
                            'Agendar',
                            style: TextStyle(
                                color: Color.fromRGBO(70, 187, 66, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );


    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
} 