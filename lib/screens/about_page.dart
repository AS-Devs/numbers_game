import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      child: Center(
          child: Text(
        "This is about Page",
        style: TextStyle(
            fontSize: 40.0,
            color: themeProvider.getTheme.primaryColor,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}
