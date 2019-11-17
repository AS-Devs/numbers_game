import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/home_page.dart';
import 'package:numbers_game/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

void main() {
  SharedPrefs.getThemeValue().then((themeInt) {
    //var themeInt = prefs.getInt("Theme") ?? 1;
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
      systemNavigationBarColor: themeProvider.getTheme.primaryColor,
    ));
  }
}

class _NumbersGameState extends State<NumbersGame> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: themeProvider.getTheme.primaryColor,
    ));
    return MaterialApp(
      title: 'Numbers Game',
      theme: themeProvider.getTheme,
      home: HomePage(),
    );
  }
}
