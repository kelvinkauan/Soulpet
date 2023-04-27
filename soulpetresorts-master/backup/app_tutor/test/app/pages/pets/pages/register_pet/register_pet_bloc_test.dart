import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/pets/pages/register_pet/register_pet_bloc.dart';
import 'package:app_tutor/app/pages/pets/pages/register_pet/register_pet_module.dart';

void main() {
  initModule(RegisterPetModule());
  RegisterPetBloc bloc;

  setUp(() {
    bloc = RegisterPetModule.to.bloc<RegisterPetBloc>();
  });

  group('RegisterPetBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<RegisterPetBloc>());
    });
  });
}
