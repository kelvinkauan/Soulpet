import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'payment_bloc.dart';
import 'payment_page.dart';

class PaymentModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PaymentBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PaymentPage();

  static Inject get to => Inject<PaymentModule>.of();
}
