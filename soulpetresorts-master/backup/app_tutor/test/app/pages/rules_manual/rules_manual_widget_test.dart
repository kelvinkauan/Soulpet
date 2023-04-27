import 'package:app_tutor/app/pages/rules_manual/rules_manual_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('RulesManualWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RulesManualPage()));
    final textFinder = find.text('RulesManual');
    expect(textFinder, findsOneWidget);
  });
}
