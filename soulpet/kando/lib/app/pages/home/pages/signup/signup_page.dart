import 'package:kando/app/pages/home/pages/signup/signup_bloc.dart';
import 'package:kando/app/pages/home/pages/signup/signup_module.dart';
import 'package:kando/app/pages/home/widgets/bottom_pop_widget.dart';
import 'package:kando/app/shared/models/model.dart';
import 'package:kando/app/shared/templates/template_one_widget.dart';
import 'package:kando/app/shared/utils/color_app.dart';
import 'package:kando/app/shared/utils/form_controller.dart';
import 'package:kando/app/shared/widgets/button_widget.dart';
import 'package:kando/app/shared/widgets/helpers.dart';
import 'package:kando/app/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'pages/terms_widget.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupBloc bloc = SignupModule.to.getBloc<SignupBloc>();
  final MaskedTextController cpf$ =
      MaskedTextController(mask: '000.000.000-00');

  Size get size => MediaQuery.of(context).size;
  FormController form;

  @override
  void initState() {
    super.initState();
    form = FormController(context);
  }

  @override
  void dispose() {
    cpf$.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateOneWidget(
      context,
      keyScaffold: form.scaffoldKey,
      bottom: BottomPopWidget(
        context,
        title: 'Já possui uma conta?\nFaça o login',
      ),
      appBar: false,
      allBorderRadius: true,
      builder: (context) {
        return StreamBuilder<Model>(
            stream: bloc.modelOut,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Helpers.loadingPage(size.height);
              }

              return Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Cadastro',
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
                    Form(
                      key: form.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          InputWidget(
                            hint: 'Nome',
                            isValidate: true,
                            onSaved: (value) {
                              bloc.model.object.user.name = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          InputWidget(
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email',
                            isValidate: true,
                            onSaved: (value) {
                              bloc.model.object.user.email = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          InputWidget(
                            obscureText: true,
                            hint: 'Senha',
                            isValidate: true,
                            onSaved: (value) {
                              bloc.model.object.user.password = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          InputWidget(
                            obscureText: true,
                            hint: 'Confirmar senha',
                            onValidate: (value) {
                              if (value == null || value == '') {
                                return 'O campo é obrigatorio';
                              } else if (value.toString() ==
                                  bloc.object.user.password) {
                                return null;
                              } else {
                                return 'As senhas não coferem';
                              }
                            },
                          ),
                          InputWidget(
                            hint: 'CPF',
                            controller: cpf$,
                            keyboardType: TextInputType.number,
                            isValidate: true,
                            onSaved: (value) {
                              bloc.model.object.user.cpf = value;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          radio,
                          ButtonWidget(
                            'Login',
                            loading: bloc.model.loading,
                            onPressed: () async {
                              if (form.validate()) {
                                String value = await bloc.cadastrar();

                                Helpers.showSnackBar(
                                  scaffodKey: form.scaffoldKey,
                                  value: value,
                                  valueSuccess: '1',
                                  successText: 'Cadastrado com sucesso!',
                                  onSuccess: () {
                                      Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                                  }
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }

  Widget get radio => RadioListTile(
        value: true,
        groupValue: bloc.object.terms,
        onChanged: (val) {
          bloc.model.object.terms = val;
          bloc.modelIn.add(bloc.model);
        },
        activeColor: Color.fromRGBO(239, 182, 0, 1),
        title: Wrap(
          children: <Widget>[
            Text(
              'Li e aceitos os ',
              style: TextStyle(
                color: Color.fromRGBO(91, 98, 100, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsWidget(bloc)));
              },
              child: Text(
                'Termos de uso',
                style: TextStyle(
                  color: Color.fromRGBO(251, 164, 36, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      );
}
