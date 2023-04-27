import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/register/registerClient.dart';

import '../../templateInterno.dart';

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Cadastro de pacote',
        colorTitle: Color.fromRGBO(152, 152, 152, 1),
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

  Widget conteudo(context) {
    var _listQtd = [
      'Quantidade',
      '1x por semana',
      '2x por semana',
      '3x por semana',
      '4x por semana',
      '5x por semana'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Validade do pacote:',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Helpers.campoIcone('Data Inicial',
                  Color.fromRGBO(220, 220, 220, 1), Icons.calendar_today),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 4,
              child: Helpers.campoIcone('Data Final',
                  Color.fromRGBO(220, 220, 220, 1), Icons.calendar_today),
            ),
            Expanded(
              flex: 4,
              child: Text(''),
            )
          ],
        ),
        Divider(
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Quantas vezes por semana deseja vir para creche?',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: dropdown(
                  'Quantidade', Color.fromRGBO(220, 220, 220, 1), _listQtd),
            ),
            Expanded(
              flex: 4,
              child: Text(''),
            ),
            Expanded(
              flex: 4,
              child: Text(''),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Selecione os dias',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: <Widget>[
            diaSemana('DOM', false),
            diaSemana('SEG', true),
            diaSemana('TER', true),
            diaSemana('QUA', true),
            diaSemana('QUI', true),
            diaSemana('SEX', true),
            diaSemana('SÁB', false),
          ],
        ),
        Divider(
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            'Frequência do banho?',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: dropdown(
                  'Quantidade', Color.fromRGBO(220, 220, 220, 1), _listQtd),
            ),
            Expanded(
              flex: 4,
              child: Text(''),
            ),
            Expanded(
              flex: 4,
              child: Text(''),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Selecione os dias',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: <Widget>[
            diaSemana('DOM', false),
            diaSemana('SEG', true),
            diaSemana('TER', true),
            diaSemana('QUA', true),
            diaSemana('QUI', true),
            diaSemana('SEX', true),
            diaSemana('SÁB', false),
          ],
        ),
        Divider(
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Adicione o pet:',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Wrap(
          children: <Widget>[
            petcard('assets/images/petAvatar.png', 'Fred'),
            addPet()
          ],
        ),
        Divider(
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'Resumo do pacote',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          'Banho 1x por semana, creche de segunda a sexta.',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
          'Válido até 12/10/2019',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,),
        ),
            ),
            Expanded(
              flex: 8,
              child: Text(''),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Text(
          'Total:',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 25,),
        ),
        Text(
          'R\$ 240,00',
            style: TextStyle(
                color: Color.fromRGBO(141, 141, 141, 1),
                fontSize: 35,
                fontWeight: FontWeight.bold),
        ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 50,), 
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(''),
            ),
            Expanded(
              flex: 3,
              child: button(context, 'Finalizar cadastro', Colors.white, Color.fromRGBO(137, 206, 68, 1), '_action'),
            )
          ],
        )
      ],
    );
  }

  Widget dropdown(_mylabel, _border, _list, {Color colorlabel = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
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
                    size: 30,
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

  Widget diaSemana(_num, _select) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      width: 100,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _select
              ? Color.fromRGBO(127, 191, 63, 1)
              : Color.fromRGBO(232, 232, 232, 1)),
      child: Center(
        child: Text(
          _num,
          style: TextStyle(
              color: _select ? Colors.white : Color.fromRGBO(132, 132, 132, 1),
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget petcard(_img, _nome) {
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
                  fontSize: 18),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(_img), fit: BoxFit.cover),
                border: Border.all(
                    color: Color.fromRGBO(248, 196, 22, 1), width: 5),
                borderRadius: BorderRadius.circular(60)),
          ),
        ],
      ),
    );
  }

  Widget addPet() {
    return DottedBorder(
        dashPattern: [6, 4],
        color: Color.fromRGBO(152, 152, 152, 1),
        strokeWidth: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterClientScreen()));
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
                      child: Image.asset(
                        'assets/images/pet.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Adicionar pet',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(152, 152, 152, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                  ],
                )),
          ),
        ));
  }
 
  Widget button(context, _text, _colorText, _colorBg, _action) {
    return RaisedButton(
      onPressed: () {
        Navigator.push( 
            context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 15, bottom: 15),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(color: _colorText, fontSize: 25),
      ),
    );
  }
}
