import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'shower_groom_bloc.dart';
import 'shower_groom_page.dart';

class ShowerGroomModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ShowerGroomBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ShowerGroomPage();

  static Inject get to => Inject<ShowerGroomModule>.of();
}
