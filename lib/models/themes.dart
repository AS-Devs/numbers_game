import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF0029FF),
    accentColor: Color(0xFF1C1C1C),
    appBarTheme: AppBarTheme(color: Color(0xFF0029FF)));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF09121C),
    cardColor:  Color(0xFF212B36),
    canvasColor: Color(0xFF09121C),
    primaryColor: Color(0xFF02CB8F),
    accentColor: Color(0xFF02CB8F),
    appBarTheme: AppBarTheme(color: Color(0xFF02CB8F),));
