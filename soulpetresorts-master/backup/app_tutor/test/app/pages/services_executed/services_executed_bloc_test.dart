import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/services_executed/services_executed_bloc.dart';

void main() {
  ServicesExecutedBloc bloc;

  setUp(() {
    bloc = ServicesExecutedBloc();
  });

  group('ServicesExecutedBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ServicesExecutedBloc>());
    });
  });
}
