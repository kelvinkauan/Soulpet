import 'package:kando/app/pages/daycare/daycare_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/daycare/daycare_page.dart';

class DaycareModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DaycareBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DaycarePage();

  static Inject get to => Inject<DaycareModule>.of();
}
