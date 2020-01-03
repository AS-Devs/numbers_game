import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/home_page.dart';
import 'package:numbers_game/widgets/curved_appbar.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Theme Widget Test', (WidgetTester tester) async {
    final testKey = Key('T');
    await tester.pumpWidget(ChangeNotifierProvider<DynamicTheme>(
      create: (_) => DynamicTheme(lightTheme),
      child: HomePage(key: testKey),
    ));

    final finder = find.byType(CurvedAppBar);

    expect(finder, findsNothing);
  });
}
