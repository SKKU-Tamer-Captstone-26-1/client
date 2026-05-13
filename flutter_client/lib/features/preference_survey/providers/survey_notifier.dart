import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/questions_config.dart';
import '../models/survey_question.dart';

class SurveyState {
  final List<SurveyQuestion> visibleQuestions;
  final int currentIndex;
  final Map<String, List<String>?> answers;

  const SurveyState({
    required this.visibleQuestions,
    required this.currentIndex,
    required this.answers,
  });

  SurveyQuestion get currentQuestion => visibleQuestions[currentIndex];
  List<String>? get currentAnswerList => answers[currentQuestion.id];
  bool get isFirst => currentIndex == 0;
  bool get isLast => currentIndex == visibleQuestions.length - 1;
  int get totalVisible => visibleQuestions.length;
  double get progress => totalVisible == 0 ? 0 : (currentIndex + 1) / totalVisible;

  bool get isReadyToAdvance {
    final ans = currentAnswerList;
    if (ans == null) return false;
    if (ans.isEmpty) return false;
    final q = currentQuestion;
    if (q.isMultiSelect && q.maxSelections != null) {
      return ans.length == q.maxSelections;
    }
    return true;
  }

  SurveyState copyWith({
    List<SurveyQuestion>? visibleQuestions,
    int? currentIndex,
    Map<String, List<String>?>? answers,
  }) {
    return SurveyState(
      visibleQuestions: visibleQuestions ?? this.visibleQuestions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
    );
  }
}

class SurveyNotifier extends StateNotifier<SurveyState> {
  SurveyNotifier()
      : super(SurveyState(
          visibleQuestions: getVisibleQuestions(null, null),
          currentIndex: 0,
          answers: {},
        ));

  void select(String value) {
    final updated = Map<String, List<String>?>.from(state.answers)
      ..[state.currentQuestion.id] = [value];
    state = state.copyWith(answers: updated);
  }

  void toggle(String value) {
    final q = state.currentQuestion;
    final current = List<String>.from(state.currentAnswerList ?? []);
    if (current.contains(value)) {
      current.remove(value);
    } else {
      if (q.maxSelections != null && current.length >= q.maxSelections!) return;
      current.add(value);
    }
    final updated = Map<String, List<String>?>.from(state.answers)
      ..[q.id] = current.isEmpty ? null : current;
    state = state.copyWith(answers: updated);
  }

  void skip() {
    final updated = Map<String, List<String>?>.from(state.answers)
      ..[state.currentQuestion.id] = null;
    state = state.copyWith(answers: updated);
    _advance();
  }

  void next() {
    if (!state.isReadyToAdvance) return;
    _advance();
  }

  void previous() {
    if (state.isFirst) return;
    state = state.copyWith(currentIndex: state.currentIndex - 1);
  }

  void _advance() {
    if (state.isLast) return;
    final nextIndex = state.currentIndex + 1;
    if (state.currentQuestion.id == 'q2') {
      final q1 = state.answers['q1']?.first;
      final q2 = state.answers['q2'];
      final refreshed = getVisibleQuestions(q1, q2);
      final visibleIds = refreshed.map((q) => q.id).toSet();
      final cleanedAnswers = Map<String, List<String>?>.fromEntries(
        state.answers.entries.where((e) => visibleIds.contains(e.key)),
      );
      state = state.copyWith(
        visibleQuestions: refreshed,
        currentIndex: nextIndex,
        answers: cleanedAnswers,
      );
    } else {
      state = state.copyWith(currentIndex: nextIndex);
    }
  }
}

final surveyProvider =
    StateNotifierProvider<SurveyNotifier, SurveyState>((ref) => SurveyNotifier());
