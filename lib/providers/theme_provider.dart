import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numbers_game/models/themes.dart';
import 'package:numbers_game/utils/shared_prefs.dart';

class DynamicTheme with ChangeNotifier {
  ThemeData _theme = lightTheme;

  ThemeData get getTheme => _theme;

  DynamicTheme(this._theme);

  set setTheme(ThemeData theme) {
    _theme = theme;
    SharedPrefs.setThemeValue(theme);
    notifyListeners();
  }
}
