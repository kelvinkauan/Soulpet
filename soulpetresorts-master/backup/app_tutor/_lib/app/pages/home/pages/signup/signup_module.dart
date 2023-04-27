import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/pages/home/pages/signup/signup_bloc.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/home/pages/signup/signup_page.dart';

class SignupModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => SignupBloc(
            AppModule.to.getDependency<DioRepository>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SignupPage();

  static Inject get to => Inject<SignupModule>.of();
}
