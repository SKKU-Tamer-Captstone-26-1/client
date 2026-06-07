import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SurveyIntroScreen extends StatelessWidget {
  const SurveyIntroScreen({
    super.key,
    required this.onStartSurvey,
    required this.onSkip,
  });

  final VoidCallback onStartSurvey;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      body: SafeArea(
        child: Column(
          children: [
            const _IntroTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                child: Column(
                  children: [
                    _SurveyIntroVisual(palette: palette),
                    const SizedBox(height: 34),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(
                          alpha: 0.12,
                        ),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Text(
                          'TASTE PROFILE',
                          style: TextStyle(
                            color: AppColors.primaryContainer,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: Text(
                        'Take a quick survey to get better liquor recommendations.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1.18,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 370),
                      child: Text(
                        'Tell ONTHEBLOCK what you drink, how you shop, and where you want to discover bottles nearby.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: palette.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: FilledButton(
                        onPressed: onStartSurvey,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primaryContainer,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Start Survey',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: onSkip,
                      style: TextButton.styleFrom(
                        foregroundColor: palette.secondary,
                      ),
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroTopBar extends StatelessWidget {
  const _IntroTopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Text(
        'ON THE BLOCK',
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(fontSize: 20, letterSpacing: 2.4),
      ),
    );
  }
}

class _SurveyIntroVisual extends StatelessWidget {
  const _SurveyIntroVisual({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 286),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: palette.outlineVariant.withValues(alpha: 0.62),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 246,
                height: 246,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 124,
                        height: 168,
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer.withValues(
                            alpha: 0.12,
                          ),
                          borderRadius: BorderRadius.circular(42),
                          border: Border.all(
                            color: AppColors.primaryContainer.withValues(
                              alpha: 0.28,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.liquor,
                          size: 82,
                          color: AppColors.primaryContainer,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      top: 18,
                      child: _TasteSignal(label: 'Smoky', icon: Icons.whatshot),
                    ),
                    const Positioned(
                      right: 0,
                      top: 74,
                      child: _TasteSignal(
                        label: 'Local',
                        icon: Icons.location_on,
                      ),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 18,
                      child: _TasteSignal(label: 'Value', icon: Icons.savings),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TasteSignal extends StatelessWidget {
  const _TasteSignal({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.72),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: AppColors.primaryContainer),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
