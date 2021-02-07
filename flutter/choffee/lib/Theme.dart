import 'dart:ui';

import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData getTheme(Brightness brightness) =>
      brightness == Brightness.light ? lightTheme : darkTheme;

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // primarySwatch: Colors.brown,
    primaryColor: Color(0xFF755A59),
    backgroundColor: Color(0xFFE9E2E2),
    accentColor: Color(0xFF332727),

  );

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      // primarySwatch: Colors.brown,
      primaryColor: Color(0xFF332727),
      backgroundColor: Color(0xFF3C3535),
      accentColor: Color(0xFFE9E2E2));
}