import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/preference_survey_step.dart';
import 'widgets/preference_option_card.dart';

class PreferenceSurveyScreen extends StatefulWidget {
  const PreferenceSurveyScreen({
    super.key,
    required this.steps,
    required this.onBackToIntro,
    required this.onSkip,
    this.onCompleted,
  });

  final List<PreferenceSurveyStep> steps;
  final VoidCallback onBackToIntro;
  final VoidCallback onSkip;
  final VoidCallback? onCompleted;

  @override
  State<PreferenceSurveyScreen> createState() => _PreferenceSurveyScreenState();
}

class _PreferenceSurveyScreenState extends State<PreferenceSurveyScreen> {
  var _currentIndex = 0;
  late final List<Set<int>> _selectedOptionIndexes;

  PreferenceSurveyStep get _currentStep => widget.steps[_currentIndex];
  bool get _isFirstStep => _currentIndex == 0;
  bool get _isLastStep => _currentIndex == widget.steps.length - 1;
  bool get _hasSelection => _selectedOptionIndexes[_currentIndex].isNotEmpty;

  @override
  void initState() {
    super.initState();
    _selectedOptionIndexes = List.generate(widget.steps.length, (_) => <int>{});
  }

  void _toggleOption(int optionIndex) {
    final selected = _selectedOptionIndexes[_currentIndex];

    setState(() {
      if (selected.contains(optionIndex)) {
        selected.remove(optionIndex);
        return;
      }

      selected.add(optionIndex);
    });
  }

  void _goBack() {
    if (_isFirstStep) {
      widget.onBackToIntro();
      return;
    }

    setState(() {
      _currentIndex -= 1;
    });
  }

  void _goNext() {
    if (_isLastStep) {
      widget.onCompleted?.call();
      return;
    }

    setState(() {
      _currentIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final progress = (_currentIndex + 1) / widget.steps.length;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            _SurveyTopBar(onBack: _goBack),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 448),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SurveyProgress(
                          currentStep: _currentIndex + 1,
                          totalSteps: widget.steps.length,
                          progress: progress,
                        ),
                        const SizedBox(height: 40),
                        _QuestionHeader(step: _currentStep),
                        const SizedBox(height: 32),
                        for (
                          var optionIndex = 0;
                          optionIndex < _currentStep.options.length;
                          optionIndex++
                        ) ...[
                          PreferenceOptionCard(
                            option: _currentStep.options[optionIndex],
                            isSelected: _selectedOptionIndexes[_currentIndex]
                                .contains(optionIndex),
                            onTap: () => _toggleOption(optionIndex),
                          ),
                          const SizedBox(height: 14),
                        ],
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _SurveyBottomBar(
              isLastStep: _isLastStep,
              canContinue: _hasSelection,
              onNext: _goNext,
              onSkip: widget.onSkip,
            ),
          ],
        ),
      ),
    );
  }
}

class _SurveyTopBar extends StatelessWidget {
  const _SurveyTopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(bottom: BorderSide(color: palette.outlineVariant)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            tooltip: 'Previous',
            icon: const Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Text(
              'Onboarding',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _SurveyProgress extends StatelessWidget {
  const _SurveyProgress({
    required this.currentStep,
    required this.totalSteps,
    required this.progress,
  });

  final int currentStep;
  final int totalSteps;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final percent = (progress * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Step $currentStep of $totalSteps'.toUpperCase(),
              style: TextStyle(
                color: palette.primaryContainer,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            Text(
              '$percent% Complete',
              style: TextStyle(
                color: palette.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: palette.surfaceContainerLow,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.primaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}

class _QuestionHeader extends StatelessWidget {
  const _QuestionHeader({required this.step});

  final PreferenceSurveyStep step;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Column(
      children: [
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          step.description,
          textAlign: TextAlign.center,
          style: TextStyle(color: palette.secondary, fontSize: 14, height: 1.4),
        ),
      ],
    );
  }
}

class _SurveyBottomBar extends StatelessWidget {
  const _SurveyBottomBar({
    required this.isLastStep,
    required this.canContinue,
    required this.onNext,
    required this.onSkip,
  });

  final bool isLastStep;
  final bool canContinue;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (canContinue)
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: onNext,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    label: Text(
                      isLastStep ? 'Finish' : 'Next',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    icon: Icon(isLastStep ? Icons.check : Icons.arrow_forward),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: palette.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: palette.outlineVariant),
                  ),
                  child: Text(
                    'Select at least one answer to continue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: palette.onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: onSkip,
                style: TextButton.styleFrom(foregroundColor: palette.secondary),
                icon: const Icon(Icons.close, size: 16),
                label: const Text(
                  'Skip for now',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
