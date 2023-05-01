import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/shared/templates/template.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  final String title;
  const RulesPage({Key key, this.title = "Rules"}) : super(key: key);

  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Template(
      builder: () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Flexible(
            //   flex: 2,
            //   child: Text(''),
            // ),
            Flexible(
              flex: 10,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 260),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                      ]),
                  child: content(context)),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                child: Text('')
              ),
            ),
          ],
        );
      },
    );
  }

  Widget content(context) {
    var _terms = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
    return Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Manual/Regras',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(102, 113, 120, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(color: Color.fromRGBO(216, 216, 216, 1),),
              Scrollbar(
                              child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: 370,
          child: ListView(
            children: <Widget>[
                Text(
                  _terms,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(103, 109, 112, 1)
                          ),
                )
            ],
          ),
        ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //           _terms,
              //           textAlign: TextAlign.justify,
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: Color.fromRGBO(103, 109, 112, 1)
              //           ),
              //         ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: button(context, 'Voltar', Colors.white, Color.fromRGBO(239, 182, 0, 1), HomeModule()),
              )
            ],
          ),
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
