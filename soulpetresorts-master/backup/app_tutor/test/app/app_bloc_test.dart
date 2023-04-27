import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/app_bloc.dart';

void main() {
  AppBloc bloc;

  group('AppBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AppBloc>());
    });
  });
}
