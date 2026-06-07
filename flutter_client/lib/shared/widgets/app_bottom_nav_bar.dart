import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    this.currentItem = AppBottomNavItem.home,
    this.onItemSelected,
    this.badgeCounts = const <AppBottomNavItem, int>{},
  });

  final AppBottomNavItem currentItem;
  final ValueChanged<AppBottomNavItem>? onItemSelected;
  final Map<AppBottomNavItem, int> badgeCounts;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest.withValues(
              alpha: isDark ? 0.96 : 0.98,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: palette.outlineVariant.withValues(alpha: isDark ? 0.7 : 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final item in AppBottomNavItem.values)
                  _BottomNavButton(
                    item: item,
                    isSelected: item == currentItem,
                    badgeCount: badgeCounts[item] ?? 0,
                    onPressed: () => onItemSelected?.call(item),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.item,
    required this.isSelected,
    required this.badgeCount,
    required this.onPressed,
  });

  final AppBottomNavItem item;
  final bool isSelected;
  final int badgeCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final color = isSelected ? AppColors.primaryContainer : palette.secondary;
    final selectedFill = AppColors.primaryContainer.withValues(
      alpha: Theme.of(context).brightness == Brightness.dark ? 0.2 : 0.12,
    );

    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              height: 30,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    width: isSelected ? 42 : 0,
                    height: 28,
                    decoration: BoxDecoration(
                      color: selectedFill,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  Icon(item.icon, color: color, size: 24),
                  if (badgeCount > 0)
                    Positioned(
                      top: -3,
                      right: -2,
                      child: _BottomNavBadge(count: badgeCount),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              item.label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBadge extends StatelessWidget {
  const _BottomNavBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final label = count > 99 ? '99+' : '$count';

    return Container(
      constraints: const BoxConstraints(minWidth: 17),
      height: 17,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: palette.surfaceContainerLowest, width: 2),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );
  }
}
