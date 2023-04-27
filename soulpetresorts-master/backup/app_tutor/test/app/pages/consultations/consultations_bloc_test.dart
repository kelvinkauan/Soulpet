import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/consultations/consultations_bloc.dart';

void main() {
  ConsultationsBloc bloc;

  setUp(() {
    bloc = ConsultationsBloc();
  });

  group('ConsultationsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ConsultationsBloc>());
    });
  });
}
