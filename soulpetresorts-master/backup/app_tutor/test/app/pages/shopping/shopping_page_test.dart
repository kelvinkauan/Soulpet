import 'package:app_tutor/app/pages/shopping/shopping_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('ShoppingPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ShoppingPage()));
    final titleFinder = find.text('Shopping');
    expect(titleFinder, findsOneWidget);
  });
}
