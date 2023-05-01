import 'package:kando/app/app_module.dart';
import 'package:kando/app/pages/pets/pets_bloc.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/pets/pets_page.dart';

class PetsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PetsBloc(
          AppModule.to.getDependency<DioRepository>(),
        )),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PetsPage();

  static Inject get to => Inject<PetsModule>.of();
}
