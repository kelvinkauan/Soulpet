import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/daycare/daycare_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('DaycarePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DaycarePage(title: 'Daycare')));
    final titleFinder = find.text('Daycare');
    expect(titleFinder, findsOneWidget);
  });
}
