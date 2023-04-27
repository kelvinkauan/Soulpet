import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_page.dart';

class RecoveryPasswordModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => RecoveryPasswordBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => RecoveryPasswordPage();

  static Inject get to => Inject<RecoveryPasswordModule>.of();
}
