import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'services_bloc.dart';
import 'services_page.dart';

class ServicesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ServicesBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ServicesPage();

  static Inject get to => Inject<ServicesModule>.of();
}
