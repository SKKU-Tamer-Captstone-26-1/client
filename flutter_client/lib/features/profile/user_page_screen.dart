import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../auth/models/auth_models.dart';
import '../auth/providers/auth_provider.dart';
import '../auth/providers/auth_repository_provider.dart';
import '../location/presentation/location_screen.dart';
import '../recommendation/data/recommendation_repository.dart';
import '../recommendation/models/recommendation_models.dart';

class UserPageScreen extends ConsumerWidget {
  const UserPageScreen({
    super.key,
    this.onBack,
    this.onBottomNavSelected,
    this.onRetakeSurvey,
    this.onLogout,
    this.isDarkMode = false,
    this.onThemeToggle,
    this.recommendationRepository,
    this.recommendationAuthToken = '',
    this.bottomNavBadgeCounts = const <AppBottomNavItem, int>{},
  });

  final VoidCallback? onBack;
  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final VoidCallback? onRetakeSurvey;
  final VoidCallback? onLogout;
  final bool isDarkMode;
  final VoidCallback? onThemeToggle;
  final RecommendationRepository? recommendationRepository;
  final String recommendationAuthToken;
  final Map<AppBottomNavItem, int> bottomNavBadgeCounts;

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
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AppBottomNavBar(
        onItemSelected: onBottomNavSelected,
        badgeCounts: bottomNavBadgeCounts,
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          children: [
            _ProfileSection(user: user),
            const SizedBox(height: 24),
            _StatusBentoGrid(user: user),
            const SizedBox(height: 24),
            _MySettingsSection(
              onRetakeSurvey: onRetakeSurvey,
              onLogout: onLogout,
              isDarkMode: isDarkMode,
              onThemeToggle: onThemeToggle,
              recommendationRepository: recommendationRepository,
              recommendationAuthToken: recommendationAuthToken,
              hasCompletedSurvey: user?.surveyId?.trim().isNotEmpty ?? false,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends ConsumerStatefulWidget {
  const _ProfileSection({required this.user});

  final AuthUser? user;

  @override
  ConsumerState<_ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<_ProfileSection> {
  bool _isUploading = false;

  void _showEditNicknameDialog(BuildContext context) {
    final controller = TextEditingController(text: widget.user?.nickname ?? '');
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
                          final authToken =
                              ref.read(authProvider).accessToken ?? '';
                          final updated = await ref
                              .read(authRepositoryProvider)
                              .updateProfile(authToken, newNickname, '');
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

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (picked == null) return;

    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 80,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          cropStyle: CropStyle.circle,
          toolbarTitle: 'Crop Profile Photo',
          hideBottomControls: true,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          cropStyle: CropStyle.circle,
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
        ),
      ],
    );
    if (cropped == null) return;

    setState(() => _isUploading = true);
    try {
      final authToken = ref.read(authProvider).accessToken ?? '';
      final nickname = widget.user?.nickname ?? '';
      final repo = ref.read(authRepositoryProvider);

      final (:uploadUrl, :objectUrl) = await repo.generateProfileUploadUrl(
        authToken,
      );
      final uploadRes = await http.put(
        Uri.parse(uploadUrl),
        headers: {'Content-Type': 'image/jpeg'},
        body: await File(cropped.path).readAsBytes(),
      );
      if (uploadRes.statusCode != 200) {
        throw Exception('Image upload failed (${uploadRes.statusCode})');
      }

      final updated = await repo.updateProfile(authToken, nickname, objectUrl);
      ref.read(authProvider.notifier).updateUser(updated);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to update photo: $e')));
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final nickname = widget.user?.nickname ?? 'User';
    final email = widget.user?.email ?? '';
    final profileImageUrl = widget.user?.profileImageUrl;

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
                child: GestureDetector(
                  onTap: _isUploading ? null : _pickAndUploadImage,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: _isUploading
                        ? const Padding(
                            padding: EdgeInsets.all(6),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.photo_camera,
                            size: 18,
                            color: Colors.white,
                          ),
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
                onTap: () => _showEditNicknameDialog(context),
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

class _MySettingsSection extends ConsumerWidget {
  const _MySettingsSection({
    this.onRetakeSurvey,
    this.onLogout,
    this.isDarkMode = false,
    this.onThemeToggle,
    this.recommendationRepository,
    this.recommendationAuthToken = '',
    this.hasCompletedSurvey = false,
  });

  final VoidCallback? onRetakeSurvey;
  final VoidCallback? onLogout;
  final bool isDarkMode;
  final VoidCallback? onThemeToggle;
  final RecommendationRepository? recommendationRepository;
  final String recommendationAuthToken;
  final bool hasCompletedSurvey;

  Future<void> _openLocationUpdate(BuildContext context, WidgetRef ref) async {
    if (ref.read(authProvider).userId == null) return;

    String? saved;
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (navCtx) => LocationScreen(
          onSave: (neighborhood) {
            saved = neighborhood;
            Navigator.of(navCtx).pop();
          },
          onSkip: () => Navigator.of(navCtx).pop(),
        ),
      ),
    );

    if (saved != null && context.mounted) {
      try {
        final authToken = ref.read(authProvider).accessToken ?? '';
        final updated = await ref
            .read(authRepositoryProvider)
            .updateNeighborhood(authToken, saved!);
        if (context.mounted) {
          ref.read(authProvider.notifier).updateUser(updated);
        }
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neighborhood = ref.watch(authProvider).user?.neighborhood;
    final palette = context.palette;

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
          iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.12),
          title: 'My Neighborhood',
          subtitle: neighborhood ?? 'Not set',
          actionLabel: 'Update',
          onTap: () => _openLocationUpdate(context, ref),
        ),
        const SizedBox(height: 12),
        _ThemeSettingsCard(
          isDarkMode: isDarkMode,
          onThemeToggle: onThemeToggle,
        ),
        const SizedBox(height: 12),
        _TasteProfileSettingsCard(
          repository: recommendationRepository,
          authToken: recommendationAuthToken,
          hasCompletedSurvey: hasCompletedSurvey,
          onTap: onRetakeSurvey,
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          icon: Icons.help_outline,
          iconColor: palette.secondary,
          iconBgColor: palette.surfaceContainerLow,
          title: 'Help & Support',
          trailing: Icon(Icons.chevron_right, color: palette.secondary),
          onTap: () async {
            final userEmail = ref.read(authProvider).user?.email ?? '';
            final uri = Uri(
              scheme: 'mailto',
              path: 'kimgoondo00@gmail.com',
              queryParameters: {
                'subject': '[On The Block] Help & Support',
                'body': 'Account: $userEmail\n\n',
              },
            );
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          icon: Icons.logout,
          iconColor: AppColors.primaryContainer,
          iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.14),
          title: 'Log Out',
          trailing: Icon(Icons.chevron_right, color: palette.secondary),
          onTap: onLogout,
        ),
      ],
    );
  }
}

class _ThemeSettingsCard extends StatelessWidget {
  const _ThemeSettingsCard({
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  final bool isDarkMode;
  final VoidCallback? onThemeToggle;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return _SettingsCard(
      icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
      iconColor: AppColors.primaryContainer,
      iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.12),
      title: 'Appearance',
      subtitle: isDarkMode ? 'Dark mode' : 'Light mode',
      onTap: onThemeToggle,
      trailing: Switch.adaptive(
        value: isDarkMode,
        onChanged: onThemeToggle == null ? null : (_) => onThemeToggle!(),
        activeThumbColor: AppColors.primaryContainer,
        activeTrackColor: AppColors.primaryContainer.withValues(alpha: 0.32),
        inactiveThumbColor: palette.secondary,
        inactiveTrackColor: palette.surfaceContainerLow,
      ),
    );
  }
}

class _TasteProfileSettingsCard extends StatefulWidget {
  const _TasteProfileSettingsCard({
    required this.repository,
    required this.authToken,
    required this.hasCompletedSurvey,
    this.onTap,
  });

  final RecommendationRepository? repository;
  final String authToken;
  final bool hasCompletedSurvey;
  final VoidCallback? onTap;

  @override
  State<_TasteProfileSettingsCard> createState() =>
      _TasteProfileSettingsCardState();
}

class _TasteProfileSettingsCardState extends State<_TasteProfileSettingsCard> {
  Future<RecommendationProfile>? _future;

  @override
  void initState() {
    super.initState();
    _resetFuture();
  }

  @override
  void didUpdateWidget(_TasteProfileSettingsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.repository != widget.repository ||
        oldWidget.authToken != widget.authToken ||
        oldWidget.hasCompletedSurvey != widget.hasCompletedSurvey) {
      _resetFuture();
    }
  }

  void _resetFuture() {
    final repository = widget.repository;
    final authToken = widget.authToken.trim();
    _future = repository == null || authToken.isEmpty
        ? null
        : repository.getProfileStatus(authToken: authToken);
  }

  @override
  Widget build(BuildContext context) {
    final future = _future;
    if (future == null) {
      return _card(subtitle: 'Recommendation profile unavailable');
    }

    return FutureBuilder<RecommendationProfile>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _card(subtitle: 'Checking profile status');
        }
        if (snapshot.hasError) {
          return _card(subtitle: 'Could not load profile status');
        }

        final profile = snapshot.data;
        return _card(
          subtitle: profile == null
              ? 'Profile status unavailable'
              : _profileSubtitle(
                  profile,
                  hasCompletedSurvey: widget.hasCompletedSurvey,
                ),
        );
      },
    );
  }

  Widget _card({required String subtitle}) {
    return _SettingsCard(
      icon: Icons.assignment,
      iconColor: AppColors.primaryContainer,
      iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.12),
      title: 'Taste Profile',
      subtitle: subtitle,
      actionLabel: 'Retake',
      onTap: widget.onTap,
    );
  }

  static String _profileSubtitle(
    RecommendationProfile profile, {
    required bool hasCompletedSurvey,
  }) {
    final reason = profile.staleReason.trim();
    if (reason.isNotEmpty) return reason;

    return switch (profile.status) {
      RecommendationProfileStatus.active => 'Ready for recommendations',
      RecommendationProfileStatus.missing =>
        hasCompletedSurvey
            ? 'Survey saved; recommendation profile not ready'
            : 'Complete the survey to unlock recommendations',
      RecommendationProfileStatus.pendingGeneration =>
        'Building your recommendations',
      RecommendationProfileStatus.stale => 'Refreshing your taste profile',
      RecommendationProfileStatus.failedGeneration =>
        'Profile generation failed',
      RecommendationProfileStatus.unspecified => 'Profile status unavailable',
    };
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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(18),
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
                        style: TextStyle(
                          fontSize: 13,
                          color: palette.secondary,
                        ),
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
      ),
    );
  }
}
