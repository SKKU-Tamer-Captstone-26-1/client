import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/survey_notifier.dart';
import '../widgets/option_card.dart';

class SurveyScreen extends ConsumerWidget {
  const SurveyScreen({super.key, this.onBack, this.onCompleted});

  final VoidCallback? onBack;
  final VoidCallback? onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(surveyProvider);
    final notifier = ref.read(surveyProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: state.isFirst
              ? (onBack ?? () => Navigator.of(context).maybePop())
              : notifier.previous,
        ),
        title: const Text(
          'Onboarding',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          if (state.currentQuestion.id != 'q1' &&
              state.currentQuestion.id != 'q2')
            TextButton(
              onPressed: notifier.skip,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          _ProgressHeader(state: state),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                final slide =
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    );
                return SlideTransition(position: slide, child: child);
              },
              child: _QuestionBody(
                key: ValueKey(state.currentIndex),
                state: state,
                onSelect: notifier.select,
                onToggle: notifier.toggle,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomControls(
        state: state,
        onPrevious: notifier.previous,
        onNext: () => _handleNext(context, ref, state, notifier),
        onSkip: notifier.skip,
      ),
    );
  }

  void _handleNext(
    BuildContext context,
    WidgetRef ref,
    SurveyState state,
    SurveyNotifier notifier,
  ) {
    if (state.isLast) {
      _submitSurvey(context, ref, state);
    } else {
      notifier.next();
    }
  }

  Future<void> _submitSurvey(
    BuildContext context,
    WidgetRef ref,
    SurveyState state,
  ) async {
    final auth = ref.read(authProvider);
    final client = ref.read(surveyApiClientProvider);

    if (auth.userId == null || client == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('로그인이 필요합니다.')));
      return;
    }

    try {
      await client.submit(userId: auth.userId!, answers: state.answers);
      ref.read(authProvider.notifier).markSurveyCompleted();
      if (context.mounted) onCompleted?.call();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('제출 실패: $e')));
      }
    }
  }
}

class _ProgressHeader extends StatelessWidget {
  final SurveyState state;
  const _ProgressHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    final stepLabel = 'STEP ${state.currentIndex + 1} / ${state.totalVisible}';
    final pct = '${(state.progress * 100).round()}% Complete';

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stepLabel,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                pct,
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: state.progress,
              minHeight: 8,
              backgroundColor: Theme.of(context).colorScheme.secondaryFixed,
              valueColor: AlwaysStoppedAnimation(AppColors.primaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionBody extends StatelessWidget {
  final SurveyState state;
  final void Function(String) onSelect;
  final void Function(String) onToggle;

  const _QuestionBody({
    super.key,
    required this.state,
    required this.onSelect,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final q = state.currentQuestion;
    final selectedValues = state.currentAnswerList ?? [];

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
      children: [
        Text(
          q.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        if (q.subtitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          _SubtitleText(
            state: state,
            base: q.subtitle,
            selectedValues: selectedValues,
          ),
        ],
        const SizedBox(height: 32),
        ...q.options.map(
          (opt) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: OptionCard(
              label: opt.label,
              description: opt.description,
              iconName: opt.icon,
              isSelected: selectedValues.contains(opt.value),
              onTap: () =>
                  q.isMultiSelect ? onToggle(opt.value) : onSelect(opt.value),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubtitleText extends StatelessWidget {
  final SurveyState state;
  final String base;
  final List<String> selectedValues;

  const _SubtitleText({
    required this.state,
    required this.base,
    required this.selectedValues,
  });

  @override
  Widget build(BuildContext context) {
    final q = state.currentQuestion;
    final text = (q.isMultiSelect && q.maxSelections != null)
        ? '${selectedValues.length} / ${q.maxSelections}개 선택됨'
        : base;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _BottomControls extends StatelessWidget {
  final SurveyState state;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const _BottomControls({
    required this.state,
    required this.onPrevious,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final canAdvance = state.isReadyToAdvance;
    final isUnskippable =
        state.currentQuestion.id == 'q1' || state.currentQuestion.id == 'q2';

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!state.isFirst) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onPrevious,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('이전'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  flex: 2,
                  child: FilledButton.icon(
                    onPressed: canAdvance ? onNext : null,
                    icon: Text(state.isLast ? '완료' : '다음'),
                    label: state.isLast
                        ? const Icon(Icons.check)
                        : const Icon(Icons.arrow_forward),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: colorScheme.surfaceContainerHigh,
                      disabledForegroundColor: colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.55),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (!isUnskippable) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: onSkip,
                icon: const Icon(Icons.close, size: 16),
                label: const Text('건너뛰기'),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
