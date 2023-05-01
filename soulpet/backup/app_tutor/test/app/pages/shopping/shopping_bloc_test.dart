import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/shopping/shopping_bloc.dart';
import 'package:app_tutor/app/pages/shopping/shopping_module.dart';

void main() {
  initModule(ShoppingModule());
  ShoppingBloc bloc;

  setUp(() {
    bloc = ShoppingModule.to.bloc<ShoppingBloc>();
  });

  group('ShoppingBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ShoppingBloc>());
    });
  });
}
