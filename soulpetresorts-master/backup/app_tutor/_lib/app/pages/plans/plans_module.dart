import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'plans_bloc.dart';
import 'plans_page.dart';

class PlansModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlansBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PlansPage();

  static Inject get to => Inject<PlansModule>.of();
}
