import 'package:app_tutor/app/pages/home/pages/recovery_password/recovery_password_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('RecoveryPasswordPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(RecoveryPasswordPage()));
    final titleFinder = find.text('RecoveryPassword');
    expect(titleFinder, findsOneWidget);
  });
}
