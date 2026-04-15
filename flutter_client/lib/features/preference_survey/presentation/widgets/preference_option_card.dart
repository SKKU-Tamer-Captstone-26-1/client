import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/preference_survey_step.dart';

class PreferenceOptionCard extends StatelessWidget {
  const PreferenceOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final PreferenceSurveyOption option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final borderColor = isSelected
        ? AppColors.primaryContainer
        : palette.outlineVariant;
    final iconBackground = isSelected
        ? AppColors.primaryContainer.withValues(alpha: 0.18)
        : palette.surfaceContainerLow;
    final cardBackground = isSelected
        ? AppColors.primaryContainer.withValues(alpha: 0.08)
        : palette.surfaceContainerLowest;

    return Material(
      color: cardBackground,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  option.icon,
                  color: isSelected
                      ? AppColors.primaryContainer
                      : palette.secondary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.label,
                      style: TextStyle(
                        color: palette.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      option.description,
                      style: TextStyle(
                        color: palette.onSurfaceVariant,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 160),
                opacity: isSelected ? 1 : 0,
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
