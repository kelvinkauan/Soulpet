import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/treatment/treatment_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('TreatmentPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(TreatmentPage(title: 'Treatment')));
    final titleFinder = find.text('Treatment');
    expect(titleFinder, findsOneWidget);
  });
}
