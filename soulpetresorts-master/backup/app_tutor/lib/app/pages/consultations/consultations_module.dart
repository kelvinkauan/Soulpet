import 'package:app_tutor/app/pages/consultations/consultations_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/consultations/consultations_page.dart';

class ConsultationsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ConsultationsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ConsultationsPage();

  static Inject get to => Inject<ConsultationsModule>.of();
}
