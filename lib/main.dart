import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<DynamicTheme>(
      builder: (_) => DynamicTheme(),
      child: NumbersGame(),
    ));

class NumbersGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.lightBlue,
    ));
    return MaterialApp(
      title: 'Numbers Game',
      theme: _theme(themeProvider),
      home: HomePage(),
    );
  }

  // todo: Will implement selectable thme & color for users later
  ThemeData _theme(DynamicTheme themeProvider) {
    return ThemeData(
        primarySwatch: themeProvider.primaryColor(),
        brightness:
            themeProvider.isDarkTheme() ? Brightness.dark : Brightness.light);
  }

  // todo: Will generate routes later here
  // RouteFactory _routes() {
  // }
}
