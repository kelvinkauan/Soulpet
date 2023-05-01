import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/services_executed/services_executed_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('ServicesExecutedPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ServicesExecutedPage(title: 'ServicesExecuted')));
    final titleFinder = find.text('ServicesExecuted');
    expect(titleFinder, findsOneWidget);
  });
}
