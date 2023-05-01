import 'package:kando/app/pages/shopping/pages/product/product_bloc.dart';
import 'package:kando/app/shared/models/product_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:kando/app/pages/shopping/pages/product/product_page.dart';

class ProductModule extends ModuleWidget {
  final ProductModel data;

  ProductModule(this.data);

  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => ProductBloc(data: data),
        ),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ProductPage();

  static Inject get to => Inject<ProductModule>.of();
}
