import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:soulpet/screens/Clients/informationClient.dart';
import 'package:soulpet/screens/login/login.dart';
import 'package:soulpet/screens/services/accommodation.dart';
import 'package:soulpet/screens/services/package.dart';
import 'package:soulpet/shared/repositories/custom_dio.dart';
import 'package:soulpet/shared/repositories/general_api.dart';

void main() => runApp(SoulpetApp());

class SoulpetApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: 'Soul Pet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        //Define the default brightness and colors
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange[400],

        //Define the default font family
        fontFamily: 'Helvetica Neue',

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')
        )
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        // '/': (context) => LoginScreen(),
        '/': (context) => PackageScreen(),
      },
    );

    return BlocProvider(
      child: app,
      dependencies: [
        Dependency((i) => CustomDio()),
        Dependency((i) => GeneralApi(i.get<CustomDio>().getClient())),
      ], blocs: [
        // Bloc((i) => HomeBloc(i.get<GeneralApi>())),
        
      ],
    );
  }
}

