
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:app_tutor/app/pages/shopping/pages/product/product_page.dart';

main() {
  testWidgets('ProductPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ProductPage()));
    final titleFinder = find.text('Product');
    expect(titleFinder, findsOneWidget);
  });
}
