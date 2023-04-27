import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'information_pet_bloc.dart';
import 'information_pet_page.dart';

class InformationPetModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InformationPetBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InformationPetPage();

  static Inject get to => Inject<InformationPetModule>.of();
}
