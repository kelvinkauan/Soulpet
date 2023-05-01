import 'package:kando/app/app_module.dart';
import 'package:kando/app/pages/pets/pages/register_pet/register_pet_bloc.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:kando/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/pets/pages/register_pet/register_pet_page.dart';

class RegisterPetModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => RegisterPetBloc(
            dio: AppModule.to.getDependency<DioRepository>(),
            pref: AppModule.to.getDependency<Preference>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => RegisterPetPage();

  static Inject get to => Inject<RegisterPetModule>.of();
}
