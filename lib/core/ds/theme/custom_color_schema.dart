import 'package:flutter/material.dart';

class CustomColorSchema {
  static Brightness brightness = Brightness.light;
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF101277);
  static const Color surface = Color(0xFF394ABC);
  static const Color background = Color(0xFFEBF3FE);
  static const Color error = Color(0xFFD42222);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF101277);
  static const Color onSurface = Color(0xFF384042);
  static const Color onBackground = Color(0xFF101277);
  static const Color onError = Color(0xFF101277);
  static const Color tertiary = Color(0xFF797979);

  static ColorScheme get colorScheme => ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      tertiary: tertiary);
}
