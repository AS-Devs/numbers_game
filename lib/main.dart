import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/splash_page.dart';
import 'package:numbers_game/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.getThemeValue().then((themeInt) {
    if (themeInt == ThemeType.light.index) {
      runApp(ChangeNotifierProvider<DynamicTheme>(
        builder: (_) => DynamicTheme(lightTheme),
        child: NumbersGame(),
      ));
    } else if (themeInt == ThemeType.dark.index) {
      runApp(ChangeNotifierProvider<DynamicTheme>(
        builder: (_) => DynamicTheme(darkTheme),
        child: NumbersGame(),
      ));
    } else {
      runApp(ChangeNotifierProvider<DynamicTheme>(
        builder: (_) => DynamicTheme(lightTheme),
        child: NumbersGame(),
      ));
    }
  });
}

class NumbersGame extends StatefulWidget {
  @override
  _NumbersGameState createState() => _NumbersGameState();

  static setNavBarColor(DynamicTheme themeProvider) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: themeProvider.getTheme.canvasColor,
    ));
  }
}

class _NumbersGameState extends State<NumbersGame> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: themeProvider.getTheme.canvasColor,
    ));
    return MaterialApp(
      title: 'Random Facts',
      theme: themeProvider.getTheme,
      home: Splash(),
    );
  }
}
