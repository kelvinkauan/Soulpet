import 'package:app_tutor/app/pages/services_executed/services_executed_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/services_executed/services_executed_page.dart';

class ServicesExecutedModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ServicesExecutedBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ServicesExecutedPage();

  static Inject get to => Inject<ServicesExecutedModule>.of();
}
