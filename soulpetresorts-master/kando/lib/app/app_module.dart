import 'package:kando/app/app_bloc.dart';
import 'package:kando/app/shared/dio/custom_dio.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/app_widget.dart';

import 'shared/repository/preference.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc(
          dio: i.getDependency<DioRepository>(),
          pref: i.getDependency<Preference>(),
        )
        ),
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
