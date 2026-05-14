import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../auth/models/auth_models.dart';
import '../auth/providers/auth_provider.dart';
import '../auth/providers/auth_repository_provider.dart';
import 'select_neighborhood_screen.dart';

class UserPageScreen extends ConsumerWidget {
  const UserPageScreen({
    super.key,
    this.onBack,
    this.onBottomNavSelected,
    this.onRetakeSurvey,
  });

  final VoidCallback? onBack;
  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onRetakeSurvey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: palette.surfaceContainerLowest,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: Border(bottom: BorderSide(color: palette.outlineVariant)),
        leading: IconButton(
          onPressed: onBack,
          icon: Icon(Icons.arrow_back, color: palette.secondary),
        ),
        title: Text(
          'ON THE BLOCK',
          style: TextStyle(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.w900,
            fontSize: 20,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AppBottomNavBar(onItemSelected: onBottomNavSelected),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          children: [
            _ProfileSection(user: user),
            const SizedBox(height: 24),
            _StatusBentoGrid(user: user),
            const SizedBox(height: 24),
            _MySettingsSection(onRetakeSurvey: onRetakeSurvey),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends ConsumerWidget {
  const _ProfileSection({required this.user});

  final AuthUser? user;

  void _showEditNicknameDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController(text: user?.nickname ?? '');
    showDialog<void>(
      context: context,
      builder: (ctx) {
        var isSaving = false;
        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            title: const Text('Edit Nickname'),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Nickname'),
              onSubmitted: (_) {},
            ),
            actions: [
              TextButton(
                onPressed: isSaving ? null : () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: isSaving
                    ? null
                    : () async {
                        final newNickname = controller.text.trim();
                        if (newNickname.isEmpty) return;
                        setDialogState(() => isSaving = true);
                        try {
                          final auth = ref.read(authProvider);
                          final updated = await ref
                              .read(authRepositoryProvider)
                              .updateProfile(auth.userId!, newNickname, '');
                          if (ctx.mounted) {
                            Navigator.pop(ctx);
                            ref.read(authProvider.notifier).updateUser(updated);
                          }
                        } catch (_) {
                          if (ctx.mounted) {
                            setDialogState(() => isSaving = false);
                          }
                        }
                      },
                child: isSaving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final nickname = user?.nickname ?? 'User';
    final email = user?.email ?? '';
    final profileImageUrl = user?.profileImageUrl;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: palette.surfaceContainerLow,
                backgroundImage:
                    profileImageUrl != null && profileImageUrl.isNotEmpty
                    ? NetworkImage(profileImageUrl)
                    : null,
                child: profileImageUrl == null || profileImageUrl.isEmpty
                    ? Icon(Icons.person, size: 56, color: palette.secondary)
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.photo_camera,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nickname,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: palette.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _showEditNicknameDialog(context, ref),
                child: Icon(Icons.edit, size: 20, color: palette.secondary),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(email, style: TextStyle(fontSize: 14, color: palette.secondary)),
        ],
      ),
    );
  }
}

class _StatusBentoGrid extends StatelessWidget {
  const _StatusBentoGrid({required this.user});

  final AuthUser? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _AlcoholScoreCard(alcoholScore: user?.alcoholScore ?? 0),
        ),
        const SizedBox(width: 16),
        Expanded(child: _PointsCard(points: user?.points ?? 0)),
      ],
    );
  }
}

class _AlcoholScoreCard extends StatelessWidget {
  const _AlcoholScoreCard({required this.alcoholScore});

  final int alcoholScore;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final progress = (alcoholScore / 100.0).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alcohol Score',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: palette.secondary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDDB9),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Beer',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF663E00),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$alcoholScore',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: palette.onSurface,
                  height: 1,
                ),
              ),
              const SizedBox(width: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  '%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: palette.secondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: palette.surfaceContainerLow,
              color: AppColors.primaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Just getting started!',
            style: TextStyle(fontSize: 12, color: palette.secondary),
          ),
        ],
      ),
    );
  }
}

class _PointsCard extends StatelessWidget {
  const _PointsCard({required this.points});

  final int points;

  String _formatPoints(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Points',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: palette.secondary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatPoints(points),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: palette.onSurface,
                  height: 1,
                ),
              ),
              const SizedBox(width: 2),
              const Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  'P',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Earn more by leaving reviews.',
            style: TextStyle(fontSize: 12, color: palette.secondary),
          ),
        ],
      ),
    );
  }
}

class _MySettingsSection extends StatelessWidget {
  const _MySettingsSection({this.onRetakeSurvey});

  final VoidCallback? onRetakeSurvey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'My Settings',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: context.palette.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _SettingsCard(
          icon: Icons.location_on,
          iconColor: AppColors.primaryContainer,
          iconBgColor: const Color(0xFFE7EFF8),
          title: 'My Neighborhood',
          subtitle: 'Downtown, Metro Area',
          actionLabel: 'Update',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<String>(
              builder: (_) => const SelectNeighborhoodScreen(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          icon: Icons.assignment,
          iconColor: const Color(0xFF825516),
          iconBgColor: const Color(0xFFE7EFF8),
          title: 'Taste Profile',
          subtitle: 'Prefers Whiskey, Gin',
          actionLabel: 'Retake',
          onTap: onRetakeSurvey,
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          icon: Icons.help_outline,
          iconColor: const Color(0xFF5F5E5E),
          iconBgColor: const Color(0xFFE7EFF8),
          title: 'Help & Support',
          trailing: Icon(Icons.chevron_right, color: context.palette.secondary),
          onTap: () {},
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: palette.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: palette.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: TextStyle(fontSize: 13, color: palette.secondary),
                    ),
                  ],
                ],
              ),
            ),
            if (actionLabel != null)
              OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: palette.secondary,
                  side: BorderSide(color: palette.outlineVariant),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(actionLabel!),
              ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
