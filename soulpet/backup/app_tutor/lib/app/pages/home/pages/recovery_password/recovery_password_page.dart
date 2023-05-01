import 'package:app_tutor/app/pages/home/widgets/bottom_pop_widget.dart';
import 'package:app_tutor/app/shared/templates/template_one_widget.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:app_tutor/app/shared/widgets/button_widget.dart';
import 'package:app_tutor/app/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';

import 'pages/recovery_sucess_widget.dart';

class RecoveryPasswordPage extends StatefulWidget {
  @override
  _RecoveryPasswordPageState createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return TemplateOneWidget(
      context,
      contentHeight: (size.height * .3),
      bottom: BottomPopWidget(context),
      appBar: false,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Esqueci minha senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorApp.C667178,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Por favor, digite seu e-mail para\nrecuperar sua conta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorApp.C6A7074,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputWidget(
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Email',
                    ),
                    ButtonWidget(
                      'Recuperar',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecoverySucess(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
