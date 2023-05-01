import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/information_consultation/information_consultation_bloc.dart';

void main() {
  InformationConsultationBloc bloc;

  setUp(() {
    bloc = InformationConsultationBloc();
  });

  group('InformationConsultationBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<InformationConsultationBloc>());
    });
  });
}
