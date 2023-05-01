import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/daycare/daycare_bloc.dart';

void main() {
  DaycareBloc bloc;

  setUp(() {
    bloc = DaycareBloc();
  });

  group('DaycareBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<DaycareBloc>());
    });
  });
}
