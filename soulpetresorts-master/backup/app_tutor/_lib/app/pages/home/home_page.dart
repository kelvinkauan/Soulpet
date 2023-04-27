import 'package:app_tutor/app/pages/home/home_bloc.dart';
import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/templates/template_one_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/home_login_widget.dart';
import 'widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Model>(
        stream: bloc.modelOut,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          return TemplateOneWidget(
            context,
            loading: snapshot.data.loading,
            onMenu: () {
              print('LOGX ==:>> ALTERAR DEPOIS');
              bloc.signOut;
            },
            header: Column(
              children: <Widget>[
                Text(
                  'Bem Vindo!',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                (bloc.model.logged)? _user : _login ,
              ],
            ),
            builder: (context) {
              return (bloc.model.logged) ? HomeWidget() : HomeLoginWidget();
            },
          );
        });
  }

  Widget get _login => InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed('/login'),
        child: Text(
          'Faça seu login',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget get _user => Text(
        '${bloc.object.name}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );
}
