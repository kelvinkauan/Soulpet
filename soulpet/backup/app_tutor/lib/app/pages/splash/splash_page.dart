import 'package:app_tutor/app/app_bloc.dart';
import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/shared/helpers/utils_helper.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AppBloc bloc = AppModule.to.getBloc<AppBloc>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    try {
      int retorno = await bloc.checkToken();
      String route;

      if (retorno == -1) {
        route = '/login';
      } else if(retorno == 1){
        route = '/units';
      } else {
        route = '/home';
      }

      Navigator.of(context).pushReplacementNamed(route);
    } catch (e) {
      UtilsHelper.showToast(scaffoldKey, text: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        color: ColorApp.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              scale: 4,
            ),
          ],
        ),
      ),
    );
  }
}
