import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/home/home_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('HomePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}
