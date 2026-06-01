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

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.22
                  : 0.08,
            ),
            blurRadius: 18,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
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

    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
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
                      color: AppColors.primaryContainer.withValues(
                        alpha: Theme.of(context).brightness == Brightness.dark
                            ? 0.18
                            : 0.12,
                      ),
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
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
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
