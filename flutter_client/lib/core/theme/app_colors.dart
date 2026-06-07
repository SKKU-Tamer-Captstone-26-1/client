import 'package:flutter/material.dart';

abstract final class AppColors {
  static const lightSurfaceContainerLow = Color(0xFFF3EFE8);
  static const lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF241A14);
  static const lightOnSurfaceVariant = Color(0xFF675E56);
  static const lightSecondary = Color(0xFF70665E);
  static const lightOutlineVariant = Color(0xFFDED3C7);
  static const lightFooterText = Color(0xFFA1978F);
  static const lightDecorativeTertiary = Color(0xFFC87934);
  static const lightTerracotta = Color(0xFFC96A3A);
  static const lightBurgundy = Color(0xFF8E3F2C);
  static const lightPremiumGold = Color(0xFFC87934);

  static const darkSurfaceContainerLow = Color(0xFF241F1B);
  static const darkSurfaceContainerLowest = Color(0xFF17120F);
  static const darkOnSurface = Color(0xFFF7EFE7);
  static const darkOnSurfaceVariant = Color(0xFFD8C9BD);
  static const darkSecondary = Color(0xFFBDB0A5);
  static const darkOutlineVariant = Color(0xFF493C34);
  static const darkFooterText = Color(0xFF95877C);
  static const darkDecorativeTertiary = Color(0xFFE4A067);
  static const darkTerracotta = Color(0xFFEFA77D);
  static const darkBurgundy = Color(0xFFE69A82);
  static const darkPremiumGold = Color(0xFFE4A067);

  static const primaryContainer = Color(0xFFE85D2A);
  static const darkPrimaryContainer = Color(0xFFF3A16F);
  static const ratingGold = Color(0xFFC87934);
  static const terracotta = Color(0xFFC96A3A);
  static const burgundy = Color(0xFF8E3F2C);
  static const premiumGold = Color(0xFFC87934);
  static const success = Color(0xFF247A45);
  static const darkSuccess = Color(0xFF75D28E);
  static const error = Color(0xFFBA1A1A);
}

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.primaryContainer,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.secondary,
    required this.outlineVariant,
    required this.footerText,
    required this.decorativeTertiary,
    required this.terracotta,
    required this.burgundy,
    required this.premiumGold,
  });

  final Color surfaceContainerLow;
  final Color surfaceContainerLowest;
  final Color primaryContainer;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color secondary;
  final Color outlineVariant;
  final Color footerText;
  final Color decorativeTertiary;
  final Color terracotta;
  final Color burgundy;
  final Color premiumGold;

  static const light = AppPalette(
    surfaceContainerLow: AppColors.lightSurfaceContainerLow,
    surfaceContainerLowest: AppColors.lightSurfaceContainerLowest,
    primaryContainer: AppColors.primaryContainer,
    onSurface: AppColors.lightOnSurface,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,
    secondary: AppColors.lightSecondary,
    outlineVariant: AppColors.lightOutlineVariant,
    footerText: AppColors.lightFooterText,
    decorativeTertiary: AppColors.lightDecorativeTertiary,
    terracotta: AppColors.lightTerracotta,
    burgundy: AppColors.lightBurgundy,
    premiumGold: AppColors.lightPremiumGold,
  );

  static const dark = AppPalette(
    surfaceContainerLow: AppColors.darkSurfaceContainerLow,
    surfaceContainerLowest: AppColors.darkSurfaceContainerLowest,
    primaryContainer: AppColors.darkPrimaryContainer,
    onSurface: AppColors.darkOnSurface,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,
    secondary: AppColors.darkSecondary,
    outlineVariant: AppColors.darkOutlineVariant,
    footerText: AppColors.darkFooterText,
    decorativeTertiary: AppColors.darkDecorativeTertiary,
    terracotta: AppColors.darkTerracotta,
    burgundy: AppColors.darkBurgundy,
    premiumGold: AppColors.darkPremiumGold,
  );

  @override
  AppPalette copyWith({
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? primaryContainer,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? secondary,
    Color? outlineVariant,
    Color? footerText,
    Color? decorativeTertiary,
    Color? terracotta,
    Color? burgundy,
    Color? premiumGold,
  }) {
    return AppPalette(
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      secondary: secondary ?? this.secondary,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      footerText: footerText ?? this.footerText,
      decorativeTertiary: decorativeTertiary ?? this.decorativeTertiary,
      terracotta: terracotta ?? this.terracotta,
      burgundy: burgundy ?? this.burgundy,
      premiumGold: premiumGold ?? this.premiumGold,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) {
      return this;
    }

    return AppPalette(
      surfaceContainerLow: Color.lerp(
        surfaceContainerLow,
        other.surfaceContainerLow,
        t,
      )!,
      surfaceContainerLowest: Color.lerp(
        surfaceContainerLowest,
        other.surfaceContainerLowest,
        t,
      )!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(
        onSurfaceVariant,
        other.onSurfaceVariant,
        t,
      )!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      footerText: Color.lerp(footerText, other.footerText, t)!,
      decorativeTertiary: Color.lerp(
        decorativeTertiary,
        other.decorativeTertiary,
        t,
      )!,
      terracotta: Color.lerp(terracotta, other.terracotta, t)!,
      burgundy: Color.lerp(burgundy, other.burgundy, t)!,
      premiumGold: Color.lerp(premiumGold, other.premiumGold, t)!,
    );
  }
}

extension AppPaletteTheme on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
}
