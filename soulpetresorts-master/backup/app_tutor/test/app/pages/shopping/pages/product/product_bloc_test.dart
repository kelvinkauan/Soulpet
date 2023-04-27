import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/shopping/pages/product/product_bloc.dart';
import 'package:app_tutor/app/pages/shopping/pages/product/product_module.dart';

void main() {
  initModule(ProductModule(null));
  ProductBloc bloc;

  setUp(() {
    bloc = ProductModule.to.bloc<ProductBloc>();
  });

  group('ProductBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ProductBloc>());
    });
  });
}
