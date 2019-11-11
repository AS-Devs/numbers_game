import 'package:flutter/material.dart';
import 'package:numbers_game/screens/home_page.dart';

void main() => runApp(NumbersGame());

class NumbersGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers Game',
      theme: _theme(),
      home: HomePage(),
    );
  }

  // todo: Will implement selectable thme & color for users later
  ThemeData _theme() {
    return ThemeData(primarySwatch: Colors.lightBlue);
  }

  // todo: Will generate routes later here
  // RouteFactory _routes() {
  // }
}
