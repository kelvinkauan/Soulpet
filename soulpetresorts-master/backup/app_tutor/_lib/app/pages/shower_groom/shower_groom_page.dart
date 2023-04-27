import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';

class ShowerGroomPage extends StatefulWidget {
  final String title;
  const ShowerGroomPage({Key key, this.title = "Banho e Tosa"})
      : super(key: key);

  @override
  _ShowerGroomPageState createState() => _ShowerGroomPageState();
}

TextEditingController dayController = TextEditingController();

class _ShowerGroomPageState extends State<ShowerGroomPage> {
  String dropdownPeriodo = 'Selecione o Periodo';
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
     //   home: false,
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
                flex: 6,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: content(context)),
              ),
              Flexible(
                  flex: 5,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(context, 'Solicitar', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), HomeModule()),
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
        Text(
          'Selecione o Pet',
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(143, 143, 143, 1),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            petcard('assets/images/petAvatar.png', 'Fred'),
            petcard('assets/images/petAvatar.png', 'Lili'),
            add(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          children: <Widget>[
            Text(
              'Serviço para: ',
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(143, 143, 143, 1),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Fred',
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(145, 209, 68, 1),
                  fontWeight: FontWeight.w600),
            ),
          ],
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
                    color: Color.fromRGBO(210, 210, 210, 1), width: 1.0),
                borderRadius: BorderRadius.circular(8)),
            hintText: 'Selecione o Dia',
            contentPadding: const EdgeInsets.all(14.0),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: Color.fromRGBO(137, 137, 137, 1),
            ),
            hintStyle: TextStyle(
              color: Color.fromRGBO(137, 137, 137, 1),
              //fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          controller: dayController,
          style: TextStyle(
            color: Color.fromRGBO(162, 170, 171, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromRGBO(224, 226, 228, 1), width: 1.5),
              borderRadius: BorderRadius.circular(8.0)),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownPeriodo,
                icon: Icon(
                  Icons.expand_more,
                  color: Color.fromRGBO(255, 189, 0, 1),
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Color.fromRGBO(137, 137, 137, 1), fontSize: 15),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownPeriodo = newValue;
                  });
                },
                items: <String>[
                  'Selecione o Periodo',
                  'Manhã',
                  'Tarde',
                  'Noite'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget petcard(_img, _nomePet) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                // builder: (context) => InformationPetModule()
                ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.topRight,
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 60,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(199, 199, 199, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _nomePet,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_img), fit: BoxFit.cover),
                  border: Border.all(
                      color: Color.fromRGBO(199, 199, 199, 1), width: 3),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ],
        ),
      ),
    );
  }

  Widget add() {
    return DashedContainer(
      child: Container(
        height: 99,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/pet.png',
                width: 50,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Adicionar pet',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(152, 152, 152, 1),
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
      dashColor: Color.fromRGBO(152, 152, 152, 1),
      borderRadius: 20.0,
      dashedLength: 5.0,
      blankLength: 3.0,
      strokeWidth: 1.5,
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
