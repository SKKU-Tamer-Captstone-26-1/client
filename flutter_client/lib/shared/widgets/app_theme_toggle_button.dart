import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppThemeToggleButton extends StatelessWidget {
  const AppThemeToggleButton({
    super.key,
    required this.isDarkMode,
    required this.onPressed,
  });

  final bool isDarkMode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return IconButton(
      onPressed: onPressed,
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
      style: IconButton.styleFrom(
        backgroundColor: palette.surfaceContainerLowest,
        foregroundColor: palette.onSurface,
        side: BorderSide(color: palette.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        fixedSize: const Size.square(44),
      ),
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
