import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/register/registerClient.dart';
import 'package:soulpet/templateInterno.dart';

class RegisterPetScreen extends StatefulWidget {
  @override
  _RegisterPetScreenState createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Cadastrar Pet',
        colorTitle: Color.fromRGBO(254, 193, 24, 1),
        menuLateral: true,
        menubar: true,
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    children: <Widget>[conteudo(context), rodape(context)],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context) {
    var _tipos = ['Tipo', 'Cachorro', 'Gato'];
    var _racas = ['Raça', 'Lhasa Apso', 'Pitbul', 'Dog alemão'];
    var _sexo = ['Sexo', 'Macho', 'Femêa'];
    var _porte = ['Porte', 'Pequeno', 'Médio', 'Grande'];
    var _tipoPelo = [
      'Tipo de Pelo',
      'Pelos longos',
      'Pelos curtos',
      'Pelo duplo'
    ];
    var _marcaRacao = ['Marca da Ração', 'Pedigree', 'Golden', 'Premier'];
    return Wrap(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Color.fromRGBO(248, 196, 22, 1), width: 5),
              image: DecorationImage(
                  image: AssetImage('assets/images/petAvatar.png'),
                  fit: BoxFit.contain)),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Informações básicas',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(143, 143, 143, 1)),
              ),
            )
          ],
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno(
                        'Nome', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 5,
                      child: dropdown(
                          'Tipo', Color.fromRGBO(220, 220, 220, 1), _tipos)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: dropdown(
                          'Raça', Color.fromRGBO(220, 220, 220, 1), _racas)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 5,
                      child: dropdown(
                          'Sexo', Color.fromRGBO(220, 220, 220, 1), _sexo)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: dropdown(
                          'Porte', Color.fromRGBO(220, 220, 220, 1), _porte)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 5,
                      child: dropdown('Tipo de Pelo',
                          Color.fromRGBO(220, 220, 220, 1), _tipoPelo)),
                ],
              ),
              Divider(
                color: Color.fromRGBO(226, 226, 226, 1),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Alimentação',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(143, 143, 143, 1)),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: dropdown('Marca da Ração',
                          Color.fromRGBO(220, 220, 220, 1), _marcaRacao)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno(
                        'Quantidade de vezes por dia',
                        Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno(
                        'Quantia por vez', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno(
                        'Observação', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/medicalObs.png'),
                                fit: BoxFit.contain)),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 9,
                    child: Helpers.campoTextoInterno(
                        'Observação médica', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dropdown(_mylabel, _border, _list, {Color colorlabel = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
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

  Widget button(context, _text, _colorText, _colorBg, _action) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 20, bottom: 20),
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

  Widget rodape(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Divider(
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(''),
            ),
            Expanded(
              flex: 3,
              child: button(context, 'Cadastrar Pet', Colors.white,
                  Color.fromRGBO(254, 193, 24, 1), RegisterClientScreen()),
            )
          ],
        )
      ],
    );
  }
}
