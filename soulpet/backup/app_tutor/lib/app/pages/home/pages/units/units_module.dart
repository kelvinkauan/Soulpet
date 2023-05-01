import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/pages/home/pages/units/units_bloc.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/home/pages/units/units_page.dart';

class UnitsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => UnitsBloc(
            dio: AppModule.to.getDependency<DioRepository>(),
            pref: AppModule.to.getDependency<Preference>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => UnitsPage();

  static Inject get to => Inject<UnitsModule>.of();
}
