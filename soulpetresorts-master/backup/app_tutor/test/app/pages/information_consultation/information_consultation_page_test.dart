import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/information_consultation/information_consultation_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('InformationConsultationPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        InformationConsultationPage(title: 'InformationConsultation')));
    final titleFinder = find.text('InformationConsultation');
    expect(titleFinder, findsOneWidget);
  });
}
