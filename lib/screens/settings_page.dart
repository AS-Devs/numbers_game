import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:numbers_game/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 300.0,
            width: 180.0,
            decoration: BoxDecoration(
                color: themeProvider.getTheme.canvasColor,
                border: Border.all(color: themeProvider.getTheme.primaryColor, width: 5),
                borderRadius: BorderRadius.circular(25.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 500),
                  child: Text("Theme"),
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.getTheme.indicatorColor),
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 90.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: themeProvider.getTheme.accentColor,
                        borderRadius: BorderRadius.circular(15.0))),
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 40.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15.0))),
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 60.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: themeProvider.getTheme.primaryColor,
                        borderRadius: BorderRadius.circular(15.0)))
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              shape: CircleBorder(),
              child: RaisedButton(
                onPressed: () {
                  themeProvider.setTheme = lightTheme;
                  NumbersGame.setNavBarColor(themeProvider);
                },
                color: Colors.grey[300],
                elevation: 10.0,
                child: Text(
                  "Light",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              shape: CircleBorder(),
              child: RaisedButton(
                  onPressed: () {
                    themeProvider.setTheme = darkTheme;
                    NumbersGame.setNavBarColor(themeProvider);
                  },
                  color: Colors.black38,
                  elevation: 10.0,
                  child: Text(
                    "Dark",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              shape: CircleBorder(),
              child: RaisedButton(
                  onPressed: () {
                    themeProvider.setTheme = creamTheme;
                    NumbersGame.setNavBarColor(themeProvider);
                  },
                  color: Color(0xFFf8a170),
                  elevation: 10.0,
                  child: Text(
                    "Cream",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ],
    ));
  }
}
