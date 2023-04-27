import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/treatment/treatment_bloc.dart';

void main() {
  TreatmentBloc bloc;

  setUp(() {
    bloc = TreatmentBloc();
  });

  group('TreatmentBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<TreatmentBloc>());
    });
  });
}
