import 'package:app_tutor/app/pages/consultations/consultations_module.dart';
import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

class TreatmentPage extends StatefulWidget {
  final String title;
  const TreatmentPage({Key key, this.title = "Tratamento"}) : super(key: key);

  @override
  _TreatmentPageState createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
     //   home: true,
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
                    // padding: EdgeInsets.all(20),
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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            'Deseja iniciar o tratamento do Fred agora?',
            textAlign: TextAlign.left,
            style:
                TextStyle(color: Color.fromRGBO(254, 193, 24, 1), fontSize: 24),
          ),
        ),
        Divider(
          color: Color.fromRGBO(216, 216, 216, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Remédio A',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(88, 88, 88, 1), fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(210, 210, 210, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Data Inicial',
                    contentPadding: const EdgeInsets.all(14.0),
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Color.fromRGBO(254, 193, 24, 1),
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  // controller: nameController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '2x ao dia',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(88, 88, 88, 1), fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(210, 210, 210, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Horário 1',
                          contentPadding: const EdgeInsets.all(14.0),
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: Color.fromRGBO(254, 193, 24, 1),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(137, 137, 137, 1),
                            //fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        // controller: nameController,
                        style: TextStyle(
                          color: Color.fromRGBO(162, 170, 171, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(210, 210, 210, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Horário 2',
                          contentPadding: const EdgeInsets.all(14.0),
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: Color.fromRGBO(254, 193, 24, 1),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(137, 137, 137, 1),
                            //fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        // controller: nameController,
                        style: TextStyle(
                          color: Color.fromRGBO(162, 170, 171, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color.fromRGBO(216, 216, 216, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Remédio B',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(88, 88, 88, 1), fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(210, 210, 210, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Data Inicial',
                    contentPadding: const EdgeInsets.all(14.0),
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Color.fromRGBO(254, 193, 24, 1),
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  // controller: nameController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '1x ao dia',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(88, 88, 88, 1), fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(210, 210, 210, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Horário 1',
                    contentPadding: const EdgeInsets.all(14.0),
                    suffixIcon: Icon(
                      Icons.access_time,
                      color: Color.fromRGBO(254, 193, 24, 1),
                    ),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  // controller: nameController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                button(context, 'Iniciar Tratamento', Colors.white,
                    Color.fromRGBO(137, 196, 85, 1), ConsultationsModule()),
                SizedBox(
                  height: 5,
                ),
                button(context, 'Cancelar', Colors.white,
                    Color.fromRGBO(235, 185, 0, 1), HomeModule())
              ],
            ),
          ),
        )
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
