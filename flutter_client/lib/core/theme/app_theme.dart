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
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: palette.primaryContainer,
          brightness: brightness,
          primary: AppColors.primaryContainer,
          surface: palette.surfaceContainerLowest,
          onSurface: palette.onSurface,
        ).copyWith(
          primary: AppColors.primaryContainer,
          onPrimary: Colors.white,
          secondary: palette.secondary,
          onSecondary: palette.surfaceContainerLowest,
          surface: palette.surfaceContainerLowest,
          onSurface: palette.onSurface,
          surfaceContainerLowest: palette.surfaceContainerLowest,
          surfaceContainerLow: palette.surfaceContainerLow,
          surfaceContainer: palette.surfaceContainerLow,
          surfaceContainerHigh: palette.surfaceContainerLow,
          outline: palette.outlineVariant,
          outlineVariant: palette.outlineVariant,
          error: AppColors.error,
        );
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Public Sans',
      brightness: brightness,
      scaffoldBackgroundColor: palette.surfaceContainerLowest,
      colorScheme: colorScheme,
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
        headlineSmall: TextStyle(
          color: palette.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          height: 1.22,
        ),
        titleLarge: TextStyle(
          color: palette.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          height: 1.25,
        ),
        titleMedium: TextStyle(
          color: palette.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.25,
        ),
        bodyLarge: TextStyle(
          color: palette.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.45,
        ),
        bodyMedium: TextStyle(
          color: palette.onSurfaceVariant,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.48,
        ),
        bodySmall: TextStyle(
          color: palette.secondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.35,
        ),
        labelLarge: TextStyle(
          color: palette.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: palette.surfaceContainerLowest,
        foregroundColor: palette.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: palette.onSurface),
        titleTextStyle: TextStyle(
          color: palette.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          height: 1.2,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: Colors.white,
          disabledBackgroundColor: palette.surfaceContainerLow,
          disabledForegroundColor: palette.secondary.withValues(alpha: 0.52),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          minimumSize: const Size(0, 44),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.onSurface,
          backgroundColor: palette.surfaceContainerLowest,
          disabledForegroundColor: palette.secondary.withValues(alpha: 0.48),
          side: BorderSide(color: palette.outlineVariant),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          minimumSize: const Size(0, 44),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryContainer,
          disabledForegroundColor: palette.secondary.withValues(alpha: 0.45),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surfaceContainerLow,
        hintStyle: TextStyle(color: palette.secondary.withValues(alpha: 0.72)),
        labelStyle: TextStyle(color: palette.secondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.primaryContainer,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: palette.outlineVariant.withValues(alpha: 0.55),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: palette.surfaceContainerLowest,
        selectedColor: AppColors.primaryContainer,
        disabledColor: palette.surfaceContainerLow,
        labelStyle: TextStyle(
          color: palette.onSurfaceVariant,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
        side: BorderSide(color: palette.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: palette.secondary,
          disabledForegroundColor: palette.secondary.withValues(alpha: 0.42),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: isDark ? 3 : 5,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? const Color(0xFF2E251F) : palette.onSurface,
        contentTextStyle: TextStyle(
          color: isDark ? palette.onSurface : palette.surfaceContainerLowest,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
