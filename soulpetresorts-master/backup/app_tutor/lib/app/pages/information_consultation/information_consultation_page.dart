import 'package:app_tutor/app/pages/treatment/treatment_module.dart';
import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

class InformationConsultationPage extends StatefulWidget {
  final String title;
  const InformationConsultationPage(
      {Key key, this.title = "Consultas"})
      : super(key: key);

  @override
  _InformationConsultationPageState createState() =>
      _InformationConsultationPageState();
}

class _InformationConsultationPageState
    extends State<InformationConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
       // home: true,
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
                flex: 10,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: content(context)),
              ),
            ],
          );
        });
  }

  Widget content(context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Informações',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
                )
              ],
            ),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
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
                      color: Color.fromRGBO(150, 153, 154, 1), fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Anamnese',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            Text(
              'Texto texto consiste no histórico de todos os sintomas narrados pelo paciente sobre determinado caso clínico. Também pode ser considerada uma lembrança incompleta ou a reminiscência de uma recordação.',
              style: TextStyle(
                  height: 2,
                  color: Color.fromRGBO(150, 153, 154, 1),
                  fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Diagnóstico',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            Text(
              'Texto texto consiste no histórico de todos os sintomas narrados pelo paciente sobre determinado caso clínico. Também pode ser considerada uma lembrança incompleta ou a reminiscência de uma recordação.',
              style: TextStyle(
                  height: 2,
                  color: Color.fromRGBO(150, 153, 154, 1),
                  fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Resultado do exame',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            Text(
              'Texto texto consiste no histórico de todos os sintomas narrados pelo paciente sobre determinado caso clínico. Também pode ser considerada uma lembrança incompleta ou a reminiscência de uma recordação.',
              style: TextStyle(
                  height: 2,
                  color: Color.fromRGBO(150, 153, 154, 1),
                  fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Tratamento',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            Text(
              'Texto texto consiste no histórico de todos os sintomas narrados pelo paciente sobre determinado caso clínico. Também pode ser considerada uma lembrança incompleta ou a reminiscência de uma recordação.',
              style: TextStyle(
                  height: 2,
                  color: Color.fromRGBO(150, 153, 154, 1),
                  fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Deseja iniciar o tratamento do Fred agora?',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(254, 193, 24, 1), fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            button(context, 'Sim', Colors.white,
                Color.fromRGBO(137, 196, 85, 1), TreatmentModule()),
            SizedBox(
              height: 5,
            ),
            button(context, 'Não', Colors.white, Color.fromRGBO(235, 185, 0, 1),
                '_action')
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
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
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
