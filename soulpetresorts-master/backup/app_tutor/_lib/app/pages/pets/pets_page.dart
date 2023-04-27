import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';

import '../information_pet/information_pet_module.dart';

class PetsPage extends StatefulWidget {
  final String title;
  const PetsPage({Key key, this.title = "Meus Pets"}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
        drawer: true,
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
                flex: 9,
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
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: <Widget>[
                      petcard('assets/images/petAvatar.png', 'Fred'),
                      petcard('assets/images/petAvatar.png', 'Lili'),
                      add(),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(context, 'Reservar', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), '_action')
                      ],
                    ),
                  )),
            ],
          );
        });
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

  Widget petcard(_img, _nomePet) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InformationPetModule()),
        );
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
                color: Color.fromRGBO(255, 189, 0, 1),
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
                      color: Color.fromRGBO(255, 189, 0, 1), width: 3),
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
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0)),
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
}
