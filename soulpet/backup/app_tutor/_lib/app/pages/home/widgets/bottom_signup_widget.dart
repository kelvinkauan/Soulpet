import 'package:app_tutor/app/pages/home/pages/signup/signup_module.dart';
import 'package:app_tutor/app/shared/widgets/button_outline_widget.dart';
import 'package:flutter/material.dart';

class BottomSignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Não possui uma conta?\nCadastre-se abaixo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(119, 134, 158, 1),
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonOutlineWidget(
            'Cadastrar-se',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignupModule(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
