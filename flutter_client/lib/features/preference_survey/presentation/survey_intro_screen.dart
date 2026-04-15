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
      backgroundColor: palette.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            const _IntroTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 36, 32, 32),
                child: Column(
                  children: [
                    _SurveyIntroVisual(palette: palette),
                    const SizedBox(height: 48),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 340),
                      child: Text(
                        'Take a quick survey to get better liquor recommendations.',
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(height: 1.25),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 340),
                      child: Text(
                        'This is placeholder survey content and can be replaced later.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              color: palette.surfaceContainerLow.withValues(alpha: 0.45),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              color: palette.surfaceContainerLow,
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: palette.outlineVariant),
            ),
            child: Icon(
              Icons.liquor,
              size: 112,
              color: palette.primaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
