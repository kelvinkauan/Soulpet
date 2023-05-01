import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'details_product_bloc.dart';
import 'details_product_page.dart';

class DetailsProductModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DetailsProductBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DetailsProductPage();

  static Inject get to => Inject<DetailsProductModule>.of();
}
