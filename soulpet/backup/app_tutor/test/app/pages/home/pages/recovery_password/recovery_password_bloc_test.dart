import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_bloc.dart';
import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_module.dart';

void main() {
  initModule(RecoveryPasswordModule());
  RecoveryPasswordBloc bloc;

  setUp(() {
    bloc = RecoveryPasswordModule.to.bloc<RecoveryPasswordBloc>();
  });

  group('RecoveryPasswordBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<RecoveryPasswordBloc>());
    });
  });
}
