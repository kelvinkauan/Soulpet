import 'package:app_tutor/app/pages/invoice/invoice_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/invoice/invoice_page.dart';

class InvoiceModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InvoiceBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InvoicePage();

  static Inject get to => Inject<InvoiceModule>.of();
}
