import 'package:kando/app/pages/home/pages/signup/signup_bloc.dart';
import 'package:kando/app/shared/templates/template_one_widget.dart';
import 'package:kando/app/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class TermsWidget extends StatelessWidget {
  final SignupBloc bloc;

  TermsWidget(this.bloc);

  @override
  Widget build(BuildContext context) {
    return TemplateOneWidget(
      context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Termos de uso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(102, 113, 120, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(
                height: 4,
                color: Color.fromRGBO(216, 216, 216, 1),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(103, 109, 112, 1),
                  ),
                ),
              ),
              ButtonWidget(
                'ACEITO',
                onPressed: () {
                  bloc.model.object.terms = true;
                  bloc.modelIn.add(bloc.model);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
