import 'package:app_tutor/app/pages/monthly_payment/monthly_payment_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/monthly_payment/monthly_payment_page.dart';

class MonthlyPaymentModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MonthlyPaymentBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => MonthlyPaymentPage();

  static Inject get to => Inject<MonthlyPaymentModule>.of();
}
