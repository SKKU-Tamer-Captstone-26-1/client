import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/survey_grpc_client.dart';
import '../models/survey_question.dart';

class SurveyState {
  final List<SurveyQuestion> _allQuestions;
  final List<SurveyQuestion> visibleQuestions;
  final int currentIndex;
  final Map<String, List<String>?> answers;
  final bool isLoading;
  final String? error;

  const SurveyState({
    List<SurveyQuestion> allQuestions = const [],
    this.visibleQuestions = const [],
    this.currentIndex = 0,
    this.answers = const {},
    this.isLoading = true,
    this.error,
  }) : _allQuestions = allQuestions;

  SurveyQuestion get currentQuestion => visibleQuestions[currentIndex];
  List<String>? get currentAnswerList => answers[currentQuestion.id];
  bool get isFirst => currentIndex == 0;
  bool get isLast => currentIndex == visibleQuestions.length - 1;
  int get totalVisible => visibleQuestions.length;
  double get progress => totalVisible == 0 ? 0 : (currentIndex + 1) / totalVisible;

  bool get isReadyToAdvance {
    final ans = currentAnswerList;
    if (ans == null || ans.isEmpty) return false;
    final q = currentQuestion;
    if (q.isMultiSelect && q.maxSelections != null) {
      return ans.length == q.maxSelections;
    }
    return true;
  }

  SurveyState copyWith({
    List<SurveyQuestion>? allQuestions,
    List<SurveyQuestion>? visibleQuestions,
    int? currentIndex,
    Map<String, List<String>?>? answers,
    bool? isLoading,
    String? error,
  }) {
    return SurveyState(
      allQuestions: allQuestions ?? _allQuestions,
      visibleQuestions: visibleQuestions ?? this.visibleQuestions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class SurveyNotifier extends StateNotifier<SurveyState> {
  final SurveyGrpcClient _client;

  SurveyNotifier(this._client) : super(const SurveyState()) {
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await _client.fetchQuestions();
      state = state.copyWith(
        allQuestions: questions,
        visibleQuestions: _filter(questions, null, null),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

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

  void reset() {
    final loaded = state._allQuestions.isNotEmpty;
    final filtered = loaded ? _filter(state._allQuestions, null, null) : const <SurveyQuestion>[];
    state = SurveyState(
      allQuestions: state._allQuestions,
      visibleQuestions: filtered,
      currentIndex: 0,
      answers: const {},
      isLoading: !loaded,
    );
  }

  void _advance() {
    if (state.isLast) return;
    final nextIndex = state.currentIndex + 1;
    if (state.currentQuestion.id == 'q2') {
      final q1 = state.answers['q1']?.first;
      final q2 = state.answers['q2'];
      final refreshed = _filter(state._allQuestions, q1, q2);
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

  static List<SurveyQuestion> _filter(
      List<SurveyQuestion> all, String? q1, List<String>? q2) {
    return all.where((q) {
      if (q.condition == null) return true;
      return q.condition!(q1, q2);
    }).toList();
  }
}

final surveyProvider =
    StateNotifierProvider<SurveyNotifier, SurveyState>((ref) {
  final client = ref.read(surveyGrpcClientProvider);
  return SurveyNotifier(client);
});
