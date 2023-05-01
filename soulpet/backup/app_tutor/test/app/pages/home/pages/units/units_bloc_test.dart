import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/home/pages/units/units_bloc.dart';
import 'package:app_tutor/app/pages/home/pages/units/units_module.dart';

void main() {
  initModule(UnitsModule());
  UnitsBloc bloc;

  setUp(() {
    bloc = UnitsModule.to.bloc<UnitsBloc>();
  });

  group('UnitsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<UnitsBloc>());
    });
  });
}
