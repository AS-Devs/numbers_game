import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.muliTextTheme(),
    accentTextTheme: GoogleFonts.muliTextTheme(),
    primaryTextTheme: GoogleFonts.muliTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    canvasColor: Color(0xFFFFFFFF),
    primaryColor: Color(0xFF0029FF),
    accentColor: Color(0xFF1C1C1C),
    appBarTheme: AppBarTheme(color: Color(0xFF0029FF)));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentTextTheme: GoogleFonts.muliTextTheme(),
    primaryTextTheme: GoogleFonts.muliTextTheme(),
    textTheme: GoogleFonts.muliTextTheme()
        .copyWith(body1: TextStyle(color: Color(0xFFF5F5F5))),
    iconTheme: IconThemeData(color: Colors.grey[50]),
    scaffoldBackgroundColor: Color(0xFF09121C),
    cardColor: Color(0xFF212B36),
    canvasColor: Color(0xFF09121C),
    primaryColor: Color(0xFF02CB8F),
    accentColor: Color(0xFF02CB8F),
    appBarTheme: AppBarTheme(
      color: Color(0xFF02CB8F),
    ));

final ThemeData creamTheme = ThemeData(
    textTheme: GoogleFonts.muliTextTheme(),
    accentTextTheme: GoogleFonts.muliTextTheme(),
    primaryTextTheme: GoogleFonts.muliTextTheme(),
    indicatorColor: Color(0xFF616167),
    iconTheme: IconThemeData(
      color: Color(0xFF616167),
    ),
    scaffoldBackgroundColor: Color(0xFFDEDEDE),
    canvasColor: Color(0xFFDEDEDE),
    primaryColor: Color(0xFFf8a170),
    accentColor: Color(0xFF616167),
    appBarTheme: AppBarTheme(
      color: Color(0xFFf8a170),
    ));
