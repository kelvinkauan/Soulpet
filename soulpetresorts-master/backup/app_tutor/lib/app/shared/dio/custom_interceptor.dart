import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {
  Preference pref = AppModule.to.getDependency<Preference>();

  @override
  Future onRequest(RequestOptions options) async {
    
      String token = await pref.getToken;
      if(token != null && token != '') {
        options.headers['Authorization'] = 'Bearer $token'; 
      }
    print('TOKEN: $token');
    print('URL: ${options.uri} METHOD: ${options.method} => DATA: [${options.data}]');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('RESPONSE: ${response.statusCode}');
 
    // NOTE Verifica se deu erro
    if ((response.data is Map) && response.data.containsKey('erro')) {
      throw response.data['message'];
    }
    
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioErro) {
    print('ERRO: $dioErro ');
    return super.onError(dioErro);
  }
}
