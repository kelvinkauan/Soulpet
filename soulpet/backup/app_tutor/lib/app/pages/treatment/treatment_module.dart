import 'package:app_tutor/app/pages/treatment/treatment_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/treatment/treatment_page.dart';

class TreatmentModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TreatmentBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TreatmentPage();

  static Inject get to => Inject<TreatmentModule>.of();
}
