import 'package:app_tutor/app/pages/home/pages/signup/signup_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('SignupPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SignupPage()));
    final titleFinder = find.text('Signup');
    expect(titleFinder, findsOneWidget);
  });
}
