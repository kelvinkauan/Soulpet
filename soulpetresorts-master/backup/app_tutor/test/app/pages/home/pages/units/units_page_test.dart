import 'package:app_tutor/app/pages/home/pages/units/units_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('UnitsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(UnitsPage()));
    final titleFinder = find.text('Units');
    expect(titleFinder, findsOneWidget);
  });
}
