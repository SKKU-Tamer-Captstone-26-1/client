import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/providers/auth_provider.dart';
import '../data/survey_grpc_client.dart';
import '../providers/survey_notifier.dart';
import '../widgets/option_card.dart';

class SurveyScreen extends ConsumerWidget {
  const SurveyScreen({super.key, this.onBack, this.onCompleted, this.onSkipAll});

  final VoidCallback? onBack;
  final VoidCallback? onCompleted;
  final VoidCallback? onSkipAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(surveyProvider);
    final notifier = ref.read(surveyProvider.notifier);

    if (state.isLoading || state.visibleQuestions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (state.error != null) {
      return Scaffold(
        body: Center(child: Text('Failed to load questions: ${state.error}')),
      );
    }

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
          TextButton(
            onPressed: onSkipAll,
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
                final slide = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ));
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
    if (auth.userId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('로그인이 필요합니다.')));
      return;
    }

    try {
      final grpcClient = ref.read(surveyGrpcClientProvider);
      final surveyId = await grpcClient.submitAnswers(
        userId: auth.userId!,
        answers: state.answers,
      );
      ref.read(authProvider.notifier).markSurveyCompleted(surveyId: surveyId);
      if (context.mounted) onCompleted?.call();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('제출 실패: $e')));
      }
    }
  }
}

class _ProgressHeader extends StatelessWidget {
  final SurveyState state;
  const _ProgressHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final total = state.totalVisible;
    final current = state.currentIndex;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Row(
        children: List.generate(total * 2 - 1, (i) {
          if (i.isOdd) {
            final isDone = (i ~/ 2) < current;
            return Expanded(
              child: Container(
                height: 2,
                color: isDone
                    ? AppColors.primaryContainer
                    : colorScheme.surfaceContainerHigh,
              ),
            );
          }
          final stepIndex = i ~/ 2;
          final isDone = stepIndex < current;
          final isCurrent = stepIndex == current;
          return _StepDot(isDone: isDone, isCurrent: isCurrent);
        }),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool isDone;
  final bool isCurrent;

  const _StepDot({required this.isDone, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActive = isDone || isCurrent;

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryContainer : Colors.transparent,
        border: Border.all(
          color: isActive ? AppColors.primaryContainer : colorScheme.outline,
          width: 1.5,
        ),
      ),
      child: Center(
        child: isDone
            ? const Icon(Icons.check, size: 12, color: Colors.white)
            : isCurrent
                ? Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )
                : null,
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
        if (q.isMultiSelect && q.maxSelections != null) ...[
          const SizedBox(height: 8),
          _SubtitleText(
            state: state,
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
  final List<String> selectedValues;

  const _SubtitleText({
    required this.state,
    required this.selectedValues,
  });

  @override
  Widget build(BuildContext context) {
    final q = state.currentQuestion;
    final text = '${selectedValues.length} / ${q.maxSelections} selected';

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

  const _BottomControls({
    required this.state,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final canAdvance = state.isReadyToAdvance;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            if (!state.isFirst) ...[
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onPrevious,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
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
                icon: Text(state.isLast ? 'Done' : 'Next'),
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
      ),
    );
  }
}
