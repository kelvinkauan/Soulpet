import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/invoice/invoice_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('InvoicePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InvoicePage(title: 'Invoice')));
    final titleFinder = find.text('Invoice');
    expect(titleFinder, findsOneWidget);
  });
}
