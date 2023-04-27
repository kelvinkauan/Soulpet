import 'package:app_tutor/app/shared/dio/custom_dio.dart';
import 'package:app_tutor/app/shared/models/auth_model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';
import 'package:dio/dio.dart';

class DioRepository {
  final CustomDio _dio;

  DioRepository(this._dio);

  Future signin(UserModel user) async {
    try {
      var response = await _dio.post('/auth/login', data: user.signin);
      return AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<UserModel> signup(UserModel user) async {
    try {
      var response = await _dio.post(
        '/users',
        data: user.signup,
      );
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
