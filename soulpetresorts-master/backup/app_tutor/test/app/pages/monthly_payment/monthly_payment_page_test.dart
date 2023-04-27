import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/monthly_payment/monthly_payment_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('MonthlyPaymentPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(MonthlyPaymentPage(title: 'MonthlyPayment')));
    final titleFinder = find.text('MonthlyPayment');
    expect(titleFinder, findsOneWidget);
  });
}
