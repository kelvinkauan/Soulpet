import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/pets/pets_bloc.dart';

void main() {
  PetsBloc bloc;

  setUp(() {
  //  bloc = PetsBloc();
  });

  group('PetsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PetsBloc>());
    });
  });
}
