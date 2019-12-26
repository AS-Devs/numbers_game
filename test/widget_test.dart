import 'package:flutter_test/flutter_test.dart';
import 'package:numbers_game/screens/settings_page.dart';

void main() {
  testWidgets('HomeWidget Test', (WidgetTester tester) async {
    await tester.pumpWidget(SettingsPage());

    expect(find.text('Theme'), findsOneWidget);
  });
}
