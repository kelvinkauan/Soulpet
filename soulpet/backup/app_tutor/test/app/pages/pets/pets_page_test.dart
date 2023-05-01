import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tutor/app/pages/pets/pets_page.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

main() {
  testWidgets('PetsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PetsPage()));
    final titleFinder = find.text('Pets');
    expect(titleFinder, findsOneWidget);
  });
}
