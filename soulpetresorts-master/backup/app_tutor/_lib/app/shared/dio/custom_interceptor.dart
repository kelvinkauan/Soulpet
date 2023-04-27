import 'package:app_tutor/app/shared/models/error_model.dart';
import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {
  //Preferences pref = AppModule.to.getDependency<Preferences>();

  @override
  Future onRequest(RequestOptions options) async {
    /*
      String token = await pref.getToken();
      if(token != null && token != '') {
        options.data['token'] = token;
      }
    */
    print('METHOD: ${options.method} => DATA: [${options.data}]');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('RESPONSE: ${response.statusCode} => ');
 
    // NOTE Verifica se deu erro
    if (response.data.containsKey('error')) {
      throw response.data;
    }

    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioErro) {
    print('ERRO: ${dioErro.response.data} ===== ');
    if (dioErro.response != null) {
      ErrorModel erro = ErrorModel.fromJson(dioErro.response.data);
      dioErro.message = erro.error;
    }

    return super.onError(dioErro);
  }
}
