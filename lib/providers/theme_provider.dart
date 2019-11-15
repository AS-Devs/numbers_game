import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class DynamicTheme with ChangeNotifier {
  static const dark_mode_key = "isDarkMode";
  static const primary_color_key = "primaryColor";

  //SharedPreferences prefs;
  bool _isDarkTheme = false;
  Color _primaryColor = Colors.lightBlue;

  isDarkTheme() => this._isDarkTheme;

  primaryColor() => this._primaryColor;

  void changeTheme(isDarkMode) {
    this._isDarkTheme = isDarkMode;
    notifyListeners();
  }

  void changePrimaryColor(primaryColor) {
    _primaryColor = primaryColor;
    notifyListeners();
  }

  // Shared Preference Actions
  // _setDarkThemeValue(isDarkMode) async {
  //   if (prefs == null) {
  //     prefs = await SharedPreferences.getInstance();
  //   }
  //   prefs.setBool(dark_mode_key, isDarkMode);
  // }

  // Future<bool> _getDarkThemeValue() async {
  //   if (prefs == null) {
  //     prefs = await SharedPreferences.getInstance();
  //   }
  //   if (prefs.containsKey(dark_mode_key)) {
  //     return prefs.getBool(dark_mode_key);
  //   } else {
  //     _setDarkThemeValue(false);
  //     return false;
  //   }
  // }
}
