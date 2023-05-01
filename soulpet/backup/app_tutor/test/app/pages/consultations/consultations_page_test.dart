import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/consultations/consultations_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('ConsultationsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ConsultationsPage(title: 'Consultations')));
    final titleFinder = find.text('Consultations');
    expect(titleFinder, findsOneWidget);
  });
}
