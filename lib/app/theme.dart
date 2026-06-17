import 'package:flutter/material.dart';

class NCATTheme {
  static const Color navy = Color(0xFF061A33);
  static const Color navy2 = Color(0xFF0B2748);
  static const Color panel = Color(0xFF0F2D4D);
  static const Color panel2 = Color(0xFF12385F);
  static const Color cyan = Color(0xFF4CE0FF);
  static const Color blue = Color(0xFF3578FF);
  static const Color gold = Color(0xFFFFC857);
  static const Color green = Color(0xFF2FE6A6);
  static const Color red = Color(0xFFFF6B6B);
  static const Color purple = Color(0xFFB28DFF);
  static const Color muted = Color(0xFF93A8BE);
  static const Color text = Color(0xFFEAF4FF);
  static const Color softText = Color(0xFFB9C8D8);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: navy,
      colorScheme: ColorScheme.fromSeed(
        seedColor: cyan,
        brightness: Brightness.dark,
        primary: cyan,
        secondary: gold,
        surface: panel,
        error: red,
      ),
      textTheme: base.textTheme.apply(
        fontFamily: 'Inter',
        bodyColor: text,
        displayColor: text,
      ),
      cardTheme: CardThemeData(
        color: panel.withValues(alpha: .78),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: .07),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: .12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: .12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: cyan, width: 1.4),
        ),
      ),
    );
  }
}
