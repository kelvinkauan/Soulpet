import 'package:bloc_pattern/bloc_pattern.dart';

import 'shared/models/auth_model.dart';
import 'shared/repository/dio_repository.dart';
import 'shared/repository/preference.dart';

class AppBloc extends BlocBase {
  final DioRepository dio;
  final Preference pref;

  AppBloc({this.dio, this.pref});

  Future<int> checkToken() async {
    try {
      bool isLogged = await pref.isLogged;

      if (isLogged) {
        bool isToken = await dio.verifyToken();

        if (isToken) {
          AuthModel auth = await dio.refreshToken();
          await pref.setSignin(auth);
          // NOTE logado
          return 1;
        }

        // NOTE token invalido
        return -1;
      } else {
        return 0;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
