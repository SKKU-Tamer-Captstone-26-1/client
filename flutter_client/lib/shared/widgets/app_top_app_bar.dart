import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../features/notifications/presentation/notification_screen.dart';
import '../../features/search/presentation/search_screen.dart';

class AppTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopAppBar({super.key, this.onNotificationBoardSelected});

  final VoidCallback? onNotificationBoardSelected;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final logoAsset = Theme.of(context).brightness == Brightness.dark
        ? 'assets/on-the-block-white.svg'
        : 'assets/on-the-block-dark.svg';

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: palette.surfaceContainerLowest,
      foregroundColor: palette.onSurface,
      shape: Border(bottom: BorderSide(color: palette.outlineVariant)),
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
              color: AppColors.primaryContainer,
              fontSize: 20,
              height: 1.1,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SearchScreen()),
            );
          },
          icon: const Icon(AppIcons.topAppBarSearch),
          tooltip: 'Search',
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => NotificationScreen(
                      onBoardNotificationSelected: onNotificationBoardSelected,
                    ),
                  ),
                );
              },
              icon: const Icon(AppIcons.topAppBarNotifications),
              tooltip: 'Notifications',
            ),
            Positioned(
              top: 10,
              right: 8,
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: palette.surfaceContainerLowest,
                    width: 2,
                  ),
                ),
                child: const Text(
                  '4',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: palette.surfaceContainerLow,
            child: Icon(
              AppIcons.topAppBarProfile,
              size: 22,
              color: palette.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
