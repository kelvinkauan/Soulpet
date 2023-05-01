import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

class BehaviorPetPage extends StatefulWidget {
  final String title;
  const BehaviorPetPage({Key key, this.title = "Comportamento"})
      : super(key: key);

  @override
  _BehaviorPetPageState createState() => _BehaviorPetPageState();
}

class _BehaviorPetPageState extends State<BehaviorPetPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
        //home: true,
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
              // Flexible(
              //     flex: 2,
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         crossAxisAlignment: CrossAxisAlignment.stretch,
              //         children: <Widget>[
              //           button(context, 'Comportamento', Colors.white,
              //               Color.fromRGBO(239, 182, 0, 1), BehaviorPetModule()),
              //           SizedBox(
              //             height: 15,
              //           ),
              //           button(context, 'Editar', Colors.white,
              //               Color.fromRGBO(239, 182, 0, 1), '_action')
              //         ],
              //       ),
              //     )),
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
                            'O primeiro dia 23/10/2019, interagiu com Lili e Bolota.',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          )
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                            'Participou das atividades: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                          Text(
                            'Piscina (Gostou)',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                      Text(
                            'Massagem',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          SizedBox(
                          height: 15,
                        ),

                           Text(
                            'Hidratação ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                          Text(
                            'Normal',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          SizedBox(
                          height: 15,
                        ),

                           Text(
                            'Xixi e Cocô: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                          Text(
                            'Apenas Cocô',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          SizedBox(
                          height: 15,
                        ),

                           Text(
                            'Comportamento: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          Text(
                            'Fred estava bastante brincalhão e pegou o brinquedo da bolota.',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          SizedBox(
                          height: 15,
                        ),

                           Text(
                            'Recomendação de Frequência: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                          Text(
                            'Escovar os dentes 1 vez por semana.\nMotivo: Mal hálito',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),

                          SizedBox(
                          height: 15,
                        ),

                           Text(
                            'Passou no teste: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
                          Text(
                            'Sim',
                            style: TextStyle(
                                color: Color.fromRGBO(150, 153, 154, 1),
                                fontSize: 16),
                          ),
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
