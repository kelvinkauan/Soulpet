import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/monthly_payment/monthly_payment_bloc.dart';

void main() {
  MonthlyPaymentBloc bloc;

  setUp(() {
    bloc = MonthlyPaymentBloc();
  });

  group('MonthlyPaymentBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<MonthlyPaymentBloc>());
    });
  });
}
