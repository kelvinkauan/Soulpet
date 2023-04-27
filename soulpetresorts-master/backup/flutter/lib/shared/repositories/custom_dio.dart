import 'package:dio/dio.dart';
import '../constants.dart';

class CustomDio {
  Dio dio = new Dio();

  // no construtor da classe modifico o objeto dio utilizando o intercepet
  CustomDio() {
    dio.options.baseUrl = URL_API;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      // options.headers["Authetication"] = "barea a8s9a08098ds809d0809d";
      return options; //continue
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
  }

  getClient() => dio;

}
