import 'package:kando/app/app_module.dart';
import 'package:kando/app/pages/home/home_bloc.dart';
import 'package:kando/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => HomeBloc(
            AppModule.to.getDependency<Preference>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
