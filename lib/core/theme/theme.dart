import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    // TODO: change the colors to use the colorScheme
    backgroundColor: Colors.blueAccent,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  colorScheme: ColorScheme.light(
    primary: Color(0xff74b9ff),
    onPrimary: Color(0xffdfe6e9),
    primaryContainer: Color(0xff55efc4),
    secondary: Color(0xffffeaa7),
    onSecondary: Color(0xff636e72),
    secondaryContainer: Color(0xffff7675),
    tertiary: Color(0xff443dff),
    onTertiary: Colors.white,
    // tertiaryContainer: ,
    surface: Color(0xffeaeafb),
    onSurface: Color(0xff050316),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff636e72),
    titleTextStyle: TextStyle(color: Color(0xffdfe6e9), fontSize: 20),
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xff0984e3),
    onPrimary: Color(0xff636e72),
    primaryContainer: Color(0xff00b894),
    secondary: Color(0xffd63031),
    onSecondary: Color(0xffdfe6e9),
    tertiary: Color(0xff0984e3),
    onTertiary: Colors.white,
    surface: Color(0xff2d3436),
    onSurface: Colors.white,
  ),
);
