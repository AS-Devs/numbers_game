import 'package:flutter/material.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { none, light, dark, cream }

class SharedPrefs {
  static const theme_key = "Theme";
  static SharedPreferences prefs;

  // Get theme type from Shared Preferences
  static Future<int> getThemeValue() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }

    if (prefs.containsKey(theme_key)) {
      return prefs.getInt(theme_key);
    } else {
      return Future.value(1);
    }
  }

  // Set theme type in Shared Preferences
  static void setThemeValue(ThemeData theme) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }

    if (theme == lightTheme) {
      prefs.setInt(theme_key, ThemeType.light.index);
    } else if (theme == creamTheme) {
      prefs.setInt(theme_key, ThemeType.cream.index);
    } else if (theme == darkTheme) {
      prefs.setInt(theme_key, ThemeType.dark.index);
    }
  }
}
