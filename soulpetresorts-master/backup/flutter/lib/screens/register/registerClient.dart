import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/screens/Clients/informationClient.dart';
import 'package:soulpet/screens/register/registerPet.dart';
import 'package:soulpet/templateInterno.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterClientScreen extends StatefulWidget {
  @override
  _RegisterClientScreenState createState() => _RegisterClientScreenState();
}

class _RegisterClientScreenState extends State<RegisterClientScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
      title: 'Cadastro de cliente',
      colorTitle: Color.fromRGBO(254, 193, 24, 1),
      menuLateral: true,
      menubar: true,
      builder: (){
        return ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Wrap(
                children: <Widget>[
                  conteudo(context),
                  rodape(context)
                ],
              )
            ),
            
          ],
        );
      }
    );
  }

  Widget conteudo(context){
    var _paises = ['País', 'Brasil', 'Brasil'];
    var _estados = ['Estado', 'Acre', 'São paulo', 'Paraná'];
    var _cidades = ['Cidade', 'Cascavel', 'Toledo', 'assis Chateaubriand', 'Foz do Iguaçu'];

    return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
          'Dados do tutor',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(143, 143, 143, 1)
          ),
        ),
            )
          ],
        ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Helpers.campoTextoInterno('Nome', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 3,
                    child: Helpers.campoTextoInterno('Data de Nascimento', Color.fromRGBO(220, 220, 220, 1), false),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno('CPF', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno('RG', Color.fromRGBO(220, 220, 220, 1), false),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno('Telefone', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 5,
                    child: Helpers.campoTextoInterno('Email', Color.fromRGBO(220, 220, 220, 1), false),
                  )
                ],
              ),
              Divider(color: Color.fromRGBO(226, 226, 226, 1),),
              Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
          'Dados do endereço',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(143, 143, 143, 1)
          ),
        ),
            )
          ],
        ),
        Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Helpers.campoTextoInterno('CEP', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 6,
                    child: Helpers.campoTextoInterno('Rua', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 2,
                    child: Helpers.campoTextoInterno('Número', Color.fromRGBO(220, 220, 220, 1), false),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Helpers.campoTextoInterno('Bairro', Color.fromRGBO(220, 220, 220, 1), false),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 2,
                    child: dropdown('País', Color.fromRGBO(220, 220, 220, 1), _paises)
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 3,
                    child: dropdown('Estado', Color.fromRGBO(220, 220, 220, 1), _estados)
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 3,
                    child: dropdown('Cidade', Color.fromRGBO(220, 220, 220, 1), _cidades)
                  )
                ],
              ),
              Divider(color: Color.fromRGBO(226, 226, 226, 1),),
              Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:20, bottom: 40),
              child: Text(
          'Adicione o Pet:',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(143, 143, 143, 1)
          ),
        ),
            )
          ],
        ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: DottedBorder(
                      dashPattern: [6, 4],
                      color: Color.fromRGBO(152, 152, 152, 1),
                      strokeWidth: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => RegisterPetScreen()
                            )
                          );
                        },
                        child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        height: 160,
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
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(''),
                  ),
                ],
              )
            ],
          ),
        );
  }

  Widget dropdown(_mylabel, _border, _list, {Color colorlabel = Colors.white}){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(color: Color.fromRGBO(140, 135, 135, 1), fontSize: 17),
                isExpanded: true,
                icon: Icon(Icons.expand_more, color: Color.fromRGBO(254, 193, 24, 1),),
                value: _mylabel,
                onChanged: (String newValue){
                  setState((){
                    _mylabel = newValue;
                  });
                },
                items: _list.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )
        ),
        SizedBox(height: 20,)
      ],
    );
    }

    Widget button(context, _text, _colorText, _colorBg, _action){
    return RaisedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 20, bottom: 20),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _colorText,
          fontSize: 18
        ),
      ),
    );
  }

  Widget rodape(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Divider(color: Color.fromRGBO(226, 226, 226, 1),),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(''),
            ),
            Expanded(
              flex: 3,
              child: button(context, 'Finalizar cadastro', Colors.white, Color.fromRGBO(145, 209, 68, 1), InformationClientScreen()),
            )
          ],
        )
      ],
    );
  } 
}