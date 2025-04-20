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
    backgroundColor: Color(0xff0600c2),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.white60,
    primaryContainer: Color(0xff0600c2),
    secondary: Colors.white,
    onSecondary: Colors.black,
    tertiary: Color(0xff0600c2),
    onTertiary: Colors.white,
    surface: Color(0xff020024),
    onSurface: Colors.white,
  ),
);
