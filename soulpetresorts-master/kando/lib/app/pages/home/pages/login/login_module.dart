import 'package:kando/app/app_module.dart';
import 'package:kando/app/pages/home/pages/login/login_bloc.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:kando/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/home/pages/login/login_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => LoginBloc(
            dio: AppModule.to.getDependency<DioRepository>(),
            pref: AppModule.to.getDependency<Preference>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
