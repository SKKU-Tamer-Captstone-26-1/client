class SurveyQuestion {
  final String id;
  final String text;
  final String subtitle;
  final List<QuestionOption> options;
  final bool isMultiSelect;
  final int? maxSelections;
  final bool Function(String? q1, List<String>? q2)? condition;

  const SurveyQuestion({
    required this.id,
    required this.text,
    required this.subtitle,
    required this.options,
    this.isMultiSelect = false,
    this.maxSelections,
    this.condition,
  });
}

class QuestionOption {
  final String value;
  final String label;
  final String description;
  final String icon;

  const QuestionOption({
    required this.value,
    required this.label,
    this.description = '',
    required this.icon,
  });
}
