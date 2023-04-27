import 'package:app_tutor/app/pages/home/pages/login/login_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('LoginPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginPage()));
    final titleFinder = find.text('Login');
    expect(titleFinder, findsOneWidget);
  });
}
