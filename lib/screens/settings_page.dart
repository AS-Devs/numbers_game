import 'package:flutter/material.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:numbers_game/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          child: Text(
            "Theme",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w400,
                color: themeProvider.getTheme.indicatorColor),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  themeProvider.setTheme = lightTheme;
                  NumbersGame.setNavBarColor(themeProvider);
                },
                color: Colors.grey[200],
                elevation: 10.0,
                child: Text(
                  "Light",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 100.0,
              child: RaisedButton(
                  onPressed: () {
                    themeProvider.setTheme = darkTheme;
                    NumbersGame.setNavBarColor(themeProvider);
                  },
                  color: Colors.black45,
                  elevation: 10.0,
                  child: Text(
                    "Dark",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ],
    ));
  }
}
