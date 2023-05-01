import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/shared/templates/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartSuccessPage extends StatefulWidget {
  @override
  _CartSuccessPageState createState() => _CartSuccessPageState();
}

class _CartSuccessPageState extends State<CartSuccessPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/svg/success.svg',
                color: Color.fromRGBO(137, 196, 85, 1),
              ),
              SizedBox(height: 30),
              Text(
                'Parabens!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(105, 116, 123, 1),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'O Pagamento deverá ser realizado\njunto a uma das unidades da\nSoulPet Resort. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(163, 163, 163, 1),
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: botaoOutline(context, 'VOLTAR', Color.fromRGBO(255, 189, 0, 1), Color.fromRGBO(255, 189, 0, 1), HomeModule()),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget botaoOutline(context, _text, _colorText, _colorBg, _action) {
    return OutlineButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _action,
          ),
        );
      },
      padding: EdgeInsets.only(top: 13, bottom: 13),
      splashColor: _colorText,
      borderSide: BorderSide(color: _colorBg),
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: _colorText,
          fontSize: 15,
        ),
      ),
    );
  }
}
