import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'behavior_pet_bloc.dart';
import 'behavior_pet_page.dart';

class BehaviorPetModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => BehaviorPetBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => BehaviorPetPage();

  static Inject get to => Inject<BehaviorPetModule>.of();
}
