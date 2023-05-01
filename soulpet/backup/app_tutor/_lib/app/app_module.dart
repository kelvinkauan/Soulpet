import 'package:app_tutor/app/app_widget.dart';
import 'package:app_tutor/app/shared/dio/custom_dio.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'shared/repository/preference.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
      //  Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => DioRepository(CustomDio())),
        Dependency((i) => Preference()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
