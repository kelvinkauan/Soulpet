import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'resort_bloc.dart';
import 'resort_page.dart';

class ResortModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ResortBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ResortPage();

  static Inject get to => Inject<ResortModule>.of();
}
