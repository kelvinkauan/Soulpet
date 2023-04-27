import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'rules_bloc.dart';
import 'rules_page.dart';

class RulesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => RulesBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => RulesPage();

  static Inject get to => Inject<RulesModule>.of();
}
