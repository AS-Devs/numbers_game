import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.muliTextTheme(),
    accentTextTheme: GoogleFonts.muliTextTheme(),
    primaryTextTheme: GoogleFonts.muliTextTheme(),
    brightness: Brightness.light,
    canvasColor: Color(0xFFFFFFFF),
    primaryColor: Color(0xFF0029FF),
    accentColor: Color(0xFF1C1C1C),
    appBarTheme: AppBarTheme(color: Color(0xFF0029FF)));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentTextTheme: GoogleFonts.muliTextTheme(),
    primaryTextTheme: GoogleFonts.muliTextTheme(),
    textTheme: GoogleFonts.muliTextTheme(),
    iconTheme: IconThemeData(color: Colors.grey[50]),
    scaffoldBackgroundColor: Color(0xFF09121C),
    cardColor:  Color(0xFF212B36),
    canvasColor: Color(0xFF09121C),
    primaryColor: Color(0xFF02CB8F),
    accentColor: Color(0xFF02CB8F),
    appBarTheme: AppBarTheme(color: Color(0xFF02CB8F),));
