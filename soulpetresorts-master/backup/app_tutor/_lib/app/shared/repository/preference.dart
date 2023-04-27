import 'dart:convert';

import 'package:app_tutor/app/shared/models/auth_model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  SharedPreferences prefs;
  static final Preference _instance = Preference.internal();
  factory Preference() => _instance;
  Preference.internal();

  Future<SharedPreferences> _getPreferences() async{
    return await SharedPreferences.getInstance();
  }

  Future<Null> setSignin(AuthModel auth) async {
    SharedPreferences prefs = await _getPreferences();
    prefs.setString('token', '${auth.accessToken}');
    prefs.setString('user', jsonEncode(auth.user.toJson));
    prefs.setBool('logged', true);
  }

  Future<bool> get isLogged async {
    SharedPreferences prefs = await _getPreferences();
    bool isLogado = prefs.getBool('logged');
    return (isLogado != null && isLogado) ? true : false;
  }

  Future<String> get getToken async {
    SharedPreferences prefs = await _getPreferences();
    return prefs.getString('token');
  }

  Future<UserModel> get getUser async{
      SharedPreferences prefs = await _getPreferences();
      return UserModel.fromString(prefs.getString('user'));
  }

  Future<bool> get clearData async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}