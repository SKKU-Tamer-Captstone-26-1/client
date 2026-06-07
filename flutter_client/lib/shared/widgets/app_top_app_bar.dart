import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../features/notifications/presentation/notification_screen.dart';
import '../../features/search/presentation/search_screen.dart';

class AppTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopAppBar({
    super.key,
    this.onNotificationBoardSelected,
    this.onProfileSelected,
  });

  final VoidCallback? onNotificationBoardSelected;
  final VoidCallback? onProfileSelected;

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final logoAsset = Theme.of(context).brightness == Brightness.dark
        ? 'assets/on-the-block-white.svg'
        : 'assets/on-the-block-dark.svg';

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: palette.surfaceContainerLowest,
      foregroundColor: palette.onSurface,
      toolbarHeight: 68,
      shape: Border(
        bottom: BorderSide(
          color: palette.outlineVariant.withValues(alpha: 0.72),
        ),
      ),
      titleSpacing: 16,
      title: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: palette.primaryContainer,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: SvgPicture.asset(logoAsset, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Text(
            'OnTheBlock',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: palette.onSurface,
              fontSize: 21,
              height: 1.1,
            ),
          ),
        ],
      ),
      actions: [
        _TopAppBarAction(
          tooltip: 'Search',
          icon: AppIcons.topAppBarSearch,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SearchScreen()),
            );
          },
        ),
        const SizedBox(width: 8),
        _TopAppBarAction(
          tooltip: 'Notifications',
          icon: AppIcons.topAppBarNotifications,
          badgeLabel: '4',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => NotificationScreen(
                  onBoardNotificationSelected: onNotificationBoardSelected,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: _TopAppBarAction(
            tooltip: 'Profile',
            icon: AppIcons.topAppBarProfile,
            onPressed: onProfileSelected,
          ),
        ),
      ],
    );
  }
}

class _TopAppBarAction extends StatelessWidget {
  const _TopAppBarAction({
    required this.tooltip,
    required this.icon,
    this.badgeLabel,
    this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final String? badgeLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 23),
            tooltip: tooltip,
            style: IconButton.styleFrom(
              backgroundColor: palette.surfaceContainerLow,
              foregroundColor: palette.onSurfaceVariant,
              disabledForegroundColor: palette.secondary.withValues(
                alpha: 0.42,
              ),
              side: BorderSide(
                color: palette.outlineVariant.withValues(alpha: 0.55),
              ),
              fixedSize: const Size.square(40),
              minimumSize: const Size.square(40),
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          if (badgeLabel != null)
            Positioned(
              top: -1,
              right: -2,
              child: Container(
                constraints: const BoxConstraints(minWidth: 17),
                height: 17,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: palette.surfaceContainerLowest,
                    width: 2,
                  ),
                ),
                child: Text(
                  badgeLabel!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
