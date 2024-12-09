import 'package:flutter/material.dart';

const kColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6200EE), // Primary color
  onPrimary: Colors.white,
  secondary: Color(0xFF03DAC6), // Secondary color
  onSecondary: Colors.black,
  //background: Color(0xFFF1F1F1),
  //onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
  onError: Colors.white,
);

const kDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFBB86FC), // Primary color for dark mode
  onPrimary: Colors.black,
  secondary: Color(0xFF03DAC6),
  onSecondary: Colors.black,
  //background: Color(0xFF121212),
  //onBackground: Colors.white,
  surface: Color(0xFF1E1E1E),
  onSurface: Colors.white,
  error: Colors.red,
  onError: Colors.white,
);
