import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme? dynamicScheme) {
    final colorScheme =
        dynamicScheme ??
            ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
              surface: const Color(0xFFEFF0F4),
              onSurface: const Color(0xFF1C1C1E),
              surfaceContainerHigh: const Color(0xFFFFFFFF),
            );

    return _themeFromScheme(colorScheme);
  }

  static ThemeData darkTheme(ColorScheme? dynamicScheme) {
    final colorScheme =
        dynamicScheme ??
            ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
              surface: const Color(0xFF1C1C1E),
              onSurface: const Color(0xFFF2F2F7),
              surfaceContainerHigh: const Color(0xFF23272E),
            );
    return _themeFromScheme(colorScheme);
  }

  static ThemeData _themeFromScheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
      ),
    );
  }
}