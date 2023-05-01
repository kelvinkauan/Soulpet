import 'package:app_tutor/app/pages/pets/pages/register_pet/register_pet_page.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('RegisterPetPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(RegisterPetPage()));
    final titleFinder = find.text('RegisterPet');
    expect(titleFinder, findsOneWidget);
  });
}
