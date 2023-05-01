import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../behavior_pet/behavior_pet_module.dart';

class InformationPetPage extends StatefulWidget {
  final String title;
  const InformationPetPage({Key key, this.title = "Informações do Pet"})
      : super(key: key);

  @override
  _InformationPetPageState createState() => _InformationPetPageState();
}

class _InformationPetPageState extends State<InformationPetPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
      //  home: false,
        builder: () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(''),
              ),
              Flexible(
                flex: 9,
                child: Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.topRight,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black12, blurRadius: 10.0)
                              ]),
                          child: content(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/petAvatar.png'),
                                    fit: BoxFit.cover),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(45)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(
                          context,
                          'Comportamento',
                          Colors.white,
                          Color.fromRGBO(239, 182, 0, 1),
                          BehaviorPetModule(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        button(context, 'Editar', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), '_action')
                      ],
                    ),
                  )),
            ],
          );
        });
  }

  Widget content(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 65, bottom: 10),
          child: Text(
            'Fred',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(61, 68, 69, 1),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Divider(
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Informações básicas',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(61, 68, 69, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Nome: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Fred',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Tipo: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Cachorro',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Raça: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Beagle',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Sexo: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Masculino',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Porte: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Médio',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Tipo de pelo: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Curto',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
        Divider(
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Alimentação',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(61, 68, 69, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Marca da Ração: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    ),
                    Text(
                      'Pedigree',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Vezes por dia: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Quantidade por vez: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    ),
                    Text(
                      '400g',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Observação: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    ),
                    Text(
                      'Não alimentar mais de 2x ao dia',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 153, 154, 1),
                          fontSize: 15),
                    )
                  ],
                ),
              ],
            )),
        Divider(
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Observações médicas',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(61, 68, 69, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Color.fromRGBO(186, 50, 44, 1),
                      child: SvgPicture.asset(
                        'assets/images/svg/medic.svg',
                        color: Colors.white,
                        width: 28,
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Medicar as 8h da manhã, e a segunda dose as 16:00',
                        style: TextStyle(
                            color: Color.fromRGBO(150, 153, 154, 1),
                            fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget button(context, _text, _colorText, _colorBg, _action) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 13, bottom: 13, left: 25, right: 25),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(color: _colorText, fontSize: 16),
      ),
    );
  }
}
