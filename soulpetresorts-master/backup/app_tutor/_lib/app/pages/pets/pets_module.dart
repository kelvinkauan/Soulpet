import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/pages/pets/pets_bloc.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/pets/pets_page.dart';

class PetsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PetsBloc(
          AppModule.to.getDependency<DioRepository>(),
        ),),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PetsPage();

  static Inject get to => Inject<PetsModule>.of();
}
