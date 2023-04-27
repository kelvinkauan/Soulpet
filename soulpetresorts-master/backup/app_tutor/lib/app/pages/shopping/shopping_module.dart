import 'package:app_tutor/app/pages/shopping/shopping_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:app_tutor/app/pages/shopping/shopping_page.dart';

class ShoppingModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ShoppingBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ShoppingPage();

  static Inject get to => Inject<ShoppingModule>.of();
}
