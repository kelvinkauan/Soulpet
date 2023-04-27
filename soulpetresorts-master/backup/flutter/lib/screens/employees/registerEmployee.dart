import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/employees/employees.dart';
import 'package:soulpet/templateInterno.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterEmployeeScreen extends StatefulWidget {
  @override
  _RegisterEmployeeScreenState createState() => _RegisterEmployeeScreenState();
}

class _RegisterEmployeeScreenState extends State<RegisterEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Cadastro de Funcionário',
        colorTitle: Color.fromRGBO(162, 162, 162, 1),
        menuLateral: true,
        menubar: true,
        builder: () {
          return Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: conteudo(context),
                    ),
                    Flexible(
                      flex: 2,
                      child: rodape(context),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget conteudo(context) {
    var _listLojas = ['Loja', 'Loja 01', 'Loja 02'];
    var _listSetor = ['Setor', 'Banhista', 'Tosador'];
    return Row(
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Form(
              key: _formKey,
              child: Wrap(
              children: <Widget>[
                Helpers.campoTextoInterno(
                    'Nome completo', Color.fromRGBO(220, 220, 220, 1), false),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: dropdown(
                          'Loja', Color.fromRGBO(220, 220, 220, 1), _listLojas),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 5,
                      child: dropdown('Setor', Color.fromRGBO(220, 220, 220, 1),
                          _listSetor),
                    )
                  ],
                )
              ],
            ),
            )),
       SizedBox(width: 70,),
        Expanded(
          flex: 3,
          child: DottedBorder(
              dashPattern: [6, 4],
              color: Color.fromRGBO(152, 152, 152, 1),
              borderType: BorderType.Rect,
              radius: Radius.circular(20),
              strokeWidth: 2,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 250,
                      color: Colors.white,
                      child: Wrap(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/user.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Selecionar foto',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(152, 152, 152, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                        ],
                      )),
                ),
              )),
        )
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
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: button(context, 'Cadastrar', Colors.white,
                  Color.fromRGBO(145, 209, 68, 1), EmployeesScreen()),
            ),
            Expanded(
              flex: 7,
              child: Text(''),
            ),
          ],
        )
      ],
    );
  }
}
