import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'products_bloc.dart';
import 'products_page.dart';

class ProductsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ProductsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ProductsPage();

  static Inject get to => Inject<ProductsModule>.of();
}
