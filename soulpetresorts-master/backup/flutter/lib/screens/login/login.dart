import 'package:soulpet/compents/helpers.dart';
import 'package:flutter/material.dart';
import 'package:soulpet/screens/Clients/clients.dart';
import 'package:soulpet/screens/register/registerClient.dart';
import 'package:soulpet/template.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Template(
      title: 'login',
      menubar: false,
      builder: (){
        return Stack(
          children: <Widget>[
            conteudo(context)
          ],
        );
      },
    );
  }

  Widget conteudo(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(''),
        ),
        Flexible(
          flex: 6,
          child: Center(
            child: Container(
            width: 550,
            height: 580,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Wrap(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain
                          )
                        ),
                      )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                  'Acesse com sua conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(254, 193, 24, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 25
                  ),
                )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Helpers.campoText('Email', false, Color.fromRGBO(254, 193, 24, 1)),
                      Helpers.campoText('Senha', true, Color.fromRGBO(254, 193, 24, 1)),
                    ],
                  ),
                ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: button(context, 'Acessar', Colors.white, Color.fromRGBO(254, 193, 24, 1), ClientsScreen()),
                )
                  ],
                )
              ],
            ),
          ),
          )
        ),
        Flexible(
          flex: 2,
          child: Text(''),
        )
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
          fontSize: 17
        ),
      ),
    );
  }  
}