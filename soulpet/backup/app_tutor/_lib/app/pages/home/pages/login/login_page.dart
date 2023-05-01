import 'package:app_tutor/app/pages/home/pages/login/login_bloc.dart';
import 'package:app_tutor/app/pages/home/pages/login/login_module.dart';
import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_module.dart';
import 'package:app_tutor/app/pages/home/widgets/bottom_signup_widget.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/templates/template_one_widget.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:app_tutor/app/shared/utils/form_controller.dart';
import 'package:app_tutor/app/shared/widgets/button_widget.dart';
import 'package:app_tutor/app/shared/widgets/helpers.dart';
import 'package:app_tutor/app/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc bloc = LoginModule.to.getBloc<LoginBloc>();
  final GlobalKey<ScaffoldState> keyScaffold = GlobalKey<ScaffoldState>();
  Size get size => MediaQuery.of(context).size;

  FormController form;

  @override
  void initState() {
    super.initState();
    form = FormController(context);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateOneWidget(
      context,
      keyScaffold: keyScaffold,
      bottom: BottomSignupWidget(),
      appBar: false,
      allBorderRadius: true,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Bem Vindo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorApp.C667178,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Insira abaixo seus dados de login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorApp.C6A7074,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              StreamBuilder<Model>(
                  stream: bloc.modelOut,
                  builder: (context, snapshot) {
                    return Form(
                      key: form.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          InputWidget(
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email',
                            isValidate: true,
                            onSaved: (value) {
                              bloc.model.object.email = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          InputWidget(
                            obscureText: true,
                            isValidate: true,
                            hint: 'Senha',
                            onSaved: (value) {
                              bloc.model.object.password = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          ButtonWidget(
                            'Login',
                            loading: bloc.model.loading,
                            onPressed: () async {
                              if (form.validate()) {
                                String value = await bloc.signin;
                                Helpers.showSnackBar(
                                  scaffodKey: keyScaffold,
                                  value: value,
                                  valueSuccess: '1',
                                  onSuccess: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      '/home',
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 20),
              _buttonRecorevyPassword,
            ],
          ),
        );
      },
    );
  }

  Widget get _buttonRecorevyPassword => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecoveryPasswordModule(),
          ),
        ),
        child: Text(
          'Esqueceu a senha?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorApp.C667178,
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
