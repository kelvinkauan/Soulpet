import 'package:app_tutor/app/shared/templates/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterSuccessPage extends StatefulWidget {
  @override
  _RegisterSuccessPageState createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Template(
      header: Text(''),
      builder: () {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/svg/success.svg',
                color: Color.fromRGBO(137, 196, 85, 1),
              ),
              SizedBox(height: 30),
              Text(
                'Sucesso!',
                style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(105, 116, 123, 1),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Seu cadastro foi realizado com sucesso\npor favor verifique seu email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(105, 116, 123, 1),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'contato@seusite.com.br',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(105, 116, 123, 1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Corrigir e-mail',
                  style: TextStyle(
                      color: Color.fromRGBO(251, 164, 36, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
