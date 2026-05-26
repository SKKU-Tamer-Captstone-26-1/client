import '../data/grpc_gen/survey/v1/survey.pb.dart' as pb;

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

  factory SurveyQuestion.fromProto(pb.SurveyQuestion p) {
    final isMulti = p.questionType == 'MULTI';
    final maxSel = (isMulti && p.maxSelections > 0) ? p.maxSelections : null;

    bool Function(String? q1, List<String>? q2)? cond;
    if (p.hasCondition()) {
      final q1In = List<String>.unmodifiable(p.condition.q1In);
      final q2Inc = p.condition.q2Includes;
      cond = (q1, q2) {
        final q1Ok = q1In.isEmpty || q1In.contains(q1);
        final q2Ok = q2Inc.isEmpty || (q2?.contains(q2Inc) ?? false);
        return q1Ok && q2Ok;
      };
    }

    return SurveyQuestion(
      id: p.questionKey,
      text: p.questionText,
      subtitle: _subtitles[p.questionKey] ?? '',
      options: p.options.map(QuestionOption.fromProto).toList(),
      isMultiSelect: isMulti,
      maxSelections: maxSel,
      condition: cond,
    );
  }

  static const Map<String, String> _subtitles = {
    'q1': 'Be honest — this is the first step to personalized recommendations.',
    'q2': 'You can select multiple options.',
    'q3': 'For Beginners | Whiskey — choose by feel.',
    'q4': 'For Enthusiasts/Experts | Whiskey — choose by cask and signature style.',
    'q5': 'For Beginners | Wine — choose by feel.',
    'q6': 'For Enthusiasts/Experts | Wine — choose by variety and body.',
    'q7': 'For Beginners | Cocktail — choose by taste and vibe.',
    'q8': 'For Enthusiasts/Experts | Cocktail — choose by base and classic recipe.',
    'q9': 'For Beginners | Beer — choose by taste and crispness.',
    'q10': 'For Enthusiasts/Experts | Beer — choose by signature craft style.',
    'q11': 'Select exactly 3 keywords.',
    'q12': 'Used to calibrate the price range of your recommendations.',
  };
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

  factory QuestionOption.fromProto(pb.AnswerOption p) {
    final raw = p.label;
    final sepIdx = raw.indexOf(': ');
    final label = sepIdx >= 0 ? raw.substring(0, sepIdx) : raw;
    final description = sepIdx >= 0 ? raw.substring(sepIdx + 2) : '';
    return QuestionOption(
      value: p.value,
      label: label,
      description: description,
      icon: _icons[p.value] ?? 'local_bar',
    );
  }

  static const Map<String, String> _icons = {
    // Q1
    'beginner': 'school',
    'enthusiast': 'star',
    'expert': 'verified',
    // Q2
    'whiskey': 'liquor',
    'wine': 'wine_bar',
    'cognac': 'liquor',
    'cocktail': 'local_bar',
    'beer': 'sports_bar',
    // Q3+Q4 whiskey (shared keys)
    'bourbon_character': 'liquor',
    'sherry_character': 'wine_bar',
    'peat_character': 'local_fire_department',
    'floral_citrus': 'local_florist',
    'american_whiskey': 'agriculture',
    // Q5+Q6 wine (shared keys)
    'full_red': 'wine_bar',
    'light_red_rose': 'local_florist',
    'white': 'water_drop',
    'sparkling': 'celebration',
    'fortified': 'liquor',
    // Q7+Q8 cocktail (shared keys)
    'tropical_tiki': 'beach_access',
    'tart_balanced': 'water_drop',
    'refreshing_long': 'sports_bar',
    'dessert_cream': 'coffee',
    'bold_spirit_fwd': 'local_bar',
    // Q9+Q10 beer (shared keys)
    'lager_pilsner': 'sports_bar',
    'weizen_white': 'grain',
    'pale_ale_ipa': 'local_florist',
    'stout_porter': 'coffee',
    'sour_wild': 'eco',
    // Q11 flavor keywords
    'vanilla_caramel': 'cake',
    'citrus_berry': 'water_drop',
    'dried_choco': 'local_dining',
    'oak_woody': 'forest',
    'smoky_peated': 'local_fire_department',
    'almond_nutty': 'spa',
    'floral': 'local_florist',
    'spicy': 'whatshot',
    'herb_mint': 'eco',
    // Q12 budget
    'under_30k':  'monetization_on',
    '30k_100k':   'monetization_on',
    '100k_200k':  'monetization_on',
    'over_200k':  'monetization_on',
  };
}
