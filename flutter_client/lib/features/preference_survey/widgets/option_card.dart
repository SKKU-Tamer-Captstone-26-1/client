import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.05)
              : colorScheme.surface,
          border: Border.all(
            color: isSelected ? colorScheme.primaryContainer : colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? colorScheme.primaryContainer.withValues(alpha: 0.2)
                    : colorScheme.surfaceContainerHigh,
              ),
              child: Icon(
                _resolveIcon(iconName),
                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
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
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: Icon(Icons.check_circle, color: colorScheme.primaryContainer),
            ),
          ],
        ),
      ),
    );
  }

  IconData _resolveIcon(String name) {
    const map = <String, IconData>{
      'liquor':                Icons.liquor,
      'local_bar':             Icons.local_bar,
      'wine_bar':              Icons.wine_bar,
      'sports_bar':            Icons.sports_bar,
      'school':                Icons.school,
      'sentiment_satisfied':   Icons.sentiment_satisfied,
      'star':                  Icons.star,
      'verified':              Icons.verified,
      'agriculture':           Icons.agriculture,
      'air':                   Icons.air,
      'local_florist':         Icons.local_florist,
      'forest':                Icons.forest,
      'cake':                  Icons.cake,
      'local_fire_department': Icons.local_fire_department,
      'spa':                   Icons.spa,
      'whatshot':              Icons.whatshot,
      'water_drop':            Icons.water_drop,
      'eco':                   Icons.eco,
      'grain':                 Icons.grain,
      'coffee':                Icons.coffee,
      'local_dining':          Icons.local_dining,
      'celebration':           Icons.celebration,
      'beach_access':          Icons.beach_access,
      'savings':               Icons.savings,
      'diamond':               Icons.diamond,
    };
    return map[name] ?? Icons.help_outline;
  }
}
