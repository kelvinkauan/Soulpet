import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/register/registerClient.dart';
import 'package:flutter_svg/svg.dart';

import '../../templateInterno.dart';

class AccommodationScreen extends StatefulWidget {
  @override
  _AccommodationScreenState createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Hospedagem',
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
      children: <Widget>[
        Text(
          'Nosso horário de check-in e check-out é até as 13:00h(segunda a sexta), Sábado as 12:00h',
          style: TextStyle(
            color: Color.fromRGBO(141, 141, 141, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Helpers.campoTextoInterno('Check-in', Color.fromRGBO(220, 220, 220, 1), false),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Helpers.campoTextoInterno('Horário', Color.fromRGBO(220, 220, 220, 1), false),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 4,
              child: Helpers.campoTextoInterno('Check-out', Color.fromRGBO(220, 220, 220, 1), false),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Helpers.campoTextoInterno('Horário', Color.fromRGBO(220, 220, 220, 1), false),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 10),
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromRGBO(145, 209, 68, 1)
          ),
          child: Center(
            child: Text(
              '4 dias',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
            ),
            Expanded(
              flex: 8,
              child: Text(''),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Selecione o Hóspede',
            style: TextStyle(
              color: Color.fromRGBO(141, 141, 141, 1),
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Wrap(
          children: <Widget>[
            petcard('assets/images/petAvatar.png', 'Fred'),
            petcard('assets/images/petAvatar.png', 'Marlon'),
            addPet()
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Selecione o Quarto',
            style: TextStyle(
              color: Color.fromRGBO(141, 141, 141, 1),
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Wrap(children: <Widget>[
          quarto('01', Color.fromRGBO(218, 2, 2, 1)),
          quarto('02', Color.fromRGBO(145, 209, 68, 1)),
          quarto('03', Color.fromRGBO(145, 209, 68, 1)),
          quarto('04', Color.fromRGBO(145, 209, 68, 1)),
          quarto('05', Color.fromRGBO(145, 209, 68, 1)),
          quarto('06', Color.fromRGBO(145, 209, 68, 1)),
          quarto('07', Color.fromRGBO(145, 209, 68, 1)),
          quarto('08', Color.fromRGBO(218, 2, 2, 1)),
          quarto('09', Color.fromRGBO(145, 209, 68, 1)),
          quarto('10', Color.fromRGBO(145, 209, 68, 1)),
          quarto('11', Color.fromRGBO(145, 209, 68, 1)),
          quarto('12', Color.fromRGBO(145, 209, 68, 1)),
          quarto('13', Color.fromRGBO(145, 209, 68, 1)),
          quarto('14', Color.fromRGBO(218, 2, 2, 1)),
          quarto('15', Color.fromRGBO(145, 209, 68, 1)),
          quarto('16', Color.fromRGBO(145, 209, 68, 1)),
          quarto('17', Color.fromRGBO(145, 209, 68, 1)),
          quarto('18', Color.fromRGBO(145, 209, 68, 1)),
          quarto('19', Color.fromRGBO(218, 2, 2, 1)),
          quarto('20', Color.fromRGBO(145, 209, 68, 1)),
          quarto('21', Color.fromRGBO(218, 2, 2, 1)),
          quarto('22', Color.fromRGBO(145, 209, 68, 1)),
          quarto('23', Color.fromRGBO(145, 209, 68, 1)),
          quarto('24', Color.fromRGBO(145, 209, 68, 1)),
        ],),
        SizedBox(height: 40,),

          Divider(color: Color.fromRGBO(226, 226, 226, 1),),
          SizedBox(height: 25,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: button(context, '+ Adicionar Quarto', Colors.white, Color.fromRGBO(254, 193, 24, 1), '_action'),
              ),
              SizedBox(width: 20,),
              Expanded(
                flex: 2,
                child: button(context, '+ Adicionar', Colors.white, Color.fromRGBO(254, 193, 24, 1), '_action'),
              ),
              Expanded(
                flex: 2,
                child: Text(''),
              ),
              Expanded(
                flex: 3,
                child: button(context, 'Finalizar', Colors.white, Color.fromRGBO(145, 209, 68, 1), '_action'),
              )
            ],
          )
      ],
    );
  }

  Widget petcard(_img, _nome){
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 160,
      alignment: Alignment.bottomRight,
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 90,
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(254, 193, 24, 1),
            ),
            child: Text(
              _nome,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_img),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Color.fromRGBO(248, 196, 22, 1), width: 5),
            borderRadius: BorderRadius.circular(60) 
            ),
          ),
        ],
      ),
    );

  }

  Widget addPet(){
   return DottedBorder(
                      dashPattern: [6, 4],
                      color: Color.fromRGBO(152, 152, 152, 1),
                      strokeWidth: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push( 
                            context, 
                            MaterialPageRoute(
                              builder: (context) => RegisterClientScreen()
                            )
                          );
                        },
                        child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                        width: 150,
                        height: 170,
                        child: Wrap(
                          children: <Widget>[
                            Center(
                              child: Image.asset('assets/images/pet.png', height: 80, width: 80, fit: BoxFit.contain,),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                              'Adicionar pet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(152, 152, 152, 1),
                                fontWeight: FontWeight.w500
                              ),
                            ),
                              )
                            )
                          ],
                        )
                      ),
                      ),
                      )
                    );
 }

 Widget quarto(_num, _color){
   return Container(
     margin: EdgeInsets.only(right: 10, bottom: 10),
     width: 100,
     height: 75,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
       color: _color
     ),
     child: Center(
       child: Text(
         _num,
         style: TextStyle(
           color: Colors.white,
           fontSize: 25,
           fontWeight: FontWeight.w600
         ),
       ), 
     ),
   );
 }

 Widget button(context, _text, _colorText, _colorBg, _action) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 13, bottom: 13),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(color: _colorText, fontSize: 18),
      ),
    );
  }

}