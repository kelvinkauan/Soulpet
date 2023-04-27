import 'package:kando/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';

import 'custom_interceptor.dart';

class CustomDio extends Dio {

  CustomDio() {
    options.baseUrl = BASE_URL;
    interceptors.add(CustomInterceptor());
  }

}