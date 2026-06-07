import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OptionCard extends StatelessWidget {
  final String label;
  final String description;
  final String iconName;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.label,
    this.description = '',
    required this.iconName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    const selectedColor = AppColors.primaryContainer;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isSelected
                ? selectedColor.withValues(alpha: 0.14)
                : palette.surfaceContainerLowest,
            border: Border.all(
              color: isSelected
                  ? selectedColor
                  : palette.outlineVariant.withValues(alpha: 0.72),
              width: isSelected ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? selectedColor
                      : palette.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(17),
                  border: isSelected
                      ? null
                      : Border.all(
                          color: palette.outlineVariant.withValues(alpha: 0.55),
                        ),
                ),
                child: Icon(
                  _resolveIcon(iconName),
                  color: isSelected ? Colors.white : palette.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isSelected ? selectedColor : palette.onSurface,
                      ),
                    ),
                    if (description.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: palette.secondary,
                          fontWeight: FontWeight.w600,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: isSelected ? 1 : 0,
                duration: const Duration(milliseconds: 180),
                child: const Icon(Icons.check_circle, color: selectedColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _resolveIcon(String name) {
    const map = <String, IconData>{
      'liquor': Icons.liquor,
      'local_bar': Icons.local_bar,
      'wine_bar': Icons.wine_bar,
      'sports_bar': Icons.sports_bar,
      'school': Icons.school,
      'sentiment_satisfied': Icons.sentiment_satisfied,
      'star': Icons.star,
      'verified': Icons.verified,
      'agriculture': Icons.agriculture,
      'air': Icons.air,
      'local_florist': Icons.local_florist,
      'forest': Icons.forest,
      'cake': Icons.cake,
      'local_fire_department': Icons.local_fire_department,
      'spa': Icons.spa,
      'whatshot': Icons.whatshot,
      'water_drop': Icons.water_drop,
      'eco': Icons.eco,
      'grain': Icons.grain,
      'coffee': Icons.coffee,
      'local_dining': Icons.local_dining,
      'celebration': Icons.celebration,
      'beach_access': Icons.beach_access,
      'savings': Icons.savings,
      'diamond': Icons.diamond,
      'monetization_on': Icons.monetization_on,
    };
    return map[name] ?? Icons.help_outline;
  }
}
