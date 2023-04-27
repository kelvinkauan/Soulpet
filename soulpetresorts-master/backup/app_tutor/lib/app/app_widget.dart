import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/pages/home/pages/login/login_module.dart';
import 'package:flutter/material.dart';

import 'pages/home/pages/units/units_module.dart';
import 'pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoulPet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.orange,
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomeModule(),
        '/login': (context) => LoginModule(),
        '/units': (context) => UnitsModule(),
      },
    );
  }
}
