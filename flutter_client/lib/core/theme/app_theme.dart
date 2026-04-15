import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return _buildTheme(brightness: Brightness.light, palette: AppPalette.light);
  }

  static ThemeData get dark {
    return _buildTheme(brightness: Brightness.dark, palette: AppPalette.dark);
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppPalette palette,
  }) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Public Sans',
      brightness: brightness,
      scaffoldBackgroundColor: palette.surfaceContainerLowest,
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.primaryContainer,
        brightness: brightness,
        primary: palette.primaryContainer,
        surface: palette.surfaceContainerLowest,
        onSurface: palette.onSurface,
      ),
      extensions: const <ThemeExtension<dynamic>>[AppPalette.light],
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>[palette],
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: palette.primaryContainer,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
        headlineMedium: TextStyle(
          color: palette.onSurface,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        bodyMedium: TextStyle(
          color: palette.onSurfaceVariant,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          color: palette.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }
}
