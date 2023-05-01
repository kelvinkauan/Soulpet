import 'package:kando/app/pages/information_consultation/information_consultation_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/information_consultation/information_consultation_page.dart';

class InformationConsultationModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InformationConsultationBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InformationConsultationPage();

  static Inject get to => Inject<InformationConsultationModule>.of();
}
