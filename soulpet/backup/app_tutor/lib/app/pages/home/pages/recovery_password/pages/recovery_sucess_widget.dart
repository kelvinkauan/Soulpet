import 'package:app_tutor/app/shared/widgets/button_outline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecoverySucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
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
            'Sucesso!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.none,
              color: Color.fromRGBO(105, 116, 123, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Uma nova senha será enviada\npara seu e-mail cadastrado.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.none,
              color: Color.fromRGBO(105, 116, 123, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30),
          ButtonOutlineWidget(
            'Voltar para o login',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, "/login", (r) => false),
          )
        ],
      ),
    );
  }
}
