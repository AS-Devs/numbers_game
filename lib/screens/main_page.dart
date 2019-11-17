import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
       child: Center(
          child: Text(
        "This is Home Page",
        style: TextStyle(
            fontSize: 40.0,
            color: themeProvider.getTheme.primaryColor,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}