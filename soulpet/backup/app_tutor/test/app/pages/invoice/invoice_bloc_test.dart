import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/invoice/invoice_bloc.dart';

void main() {
  InvoiceBloc bloc;

  setUp(() {
    bloc = InvoiceBloc();
  });

  group('InvoiceBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<InvoiceBloc>());
    });
  });
}
