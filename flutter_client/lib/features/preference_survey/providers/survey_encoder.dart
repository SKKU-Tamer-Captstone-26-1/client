/// Encodes survey answers into a comma-separated string of 12 integers.
///
/// Single-select (Q1, Q3-Q10, Q12): 1-indexed option position; 0 = skipped/not shown.
/// Multi-select bitmask (Q2, Q11): sum of powers-of-two per option; 0 = none selected.
String encodeSurveyAnswers(Map<String, List<String>?> answers) {
  return [
    _single(answers['q1'], _kQ1),
    _bitmask(answers['q2'], _kQ2),
    _single(answers['q3'], _kQ3),
    _single(answers['q4'], _kQ4),
    _single(answers['q5'], _kQ5),
    _single(answers['q6'], _kQ6),
    _single(answers['q7'], _kQ7),
    _single(answers['q8'], _kQ8),
    _single(answers['q9'], _kQ9),
    _single(answers['q10'], _kQ10),
    _bitmask(answers['q11'], _kQ11),
    _single(answers['q12'], _kQ12),
  ].join(',');
}

int _single(List<String>? answer, List<String> order) {
  if (answer == null || answer.isEmpty) return 0;
  final idx = order.indexOf(answer.first);
  return idx == -1 ? 0 : idx + 1;
}

int _bitmask(List<String>? answer, List<String> order) {
  if (answer == null || answer.isEmpty) return 0;
  var bits = 0;
  for (final value in answer) {
    final idx = order.indexOf(value);
    if (idx != -1) bits |= (1 << idx);
  }
  return bits;
}

const _kQ1  = ['beginner', 'enthusiast', 'expert'];
const _kQ2  = ['whiskey', 'wine', 'cognac', 'cocktail', 'beer'];
const _kQ3  = ['sweet_smooth', 'fruity', 'smoky_bitter', 'light_floral', 'rich_intense'];
const _kQ4  = ['bourbon_cask', 'sherry_cask', 'peated', 'floral_citrus', 'american'];
const _kQ5  = ['light_sweet', 'crisp_dry', 'smooth_medium', 'bold_tannic', 'sparkling'];
const _kQ6  = ['full_red', 'light_red', 'white', 'natural', 'fortified'];
const _kQ7  = ['sweet_fruit', 'sour_fresh', 'highball', 'spirit_fwd', 'creamy'];
const _kQ8  = ['sour', 'long_drink', 'spirit_fwd', 'liqueur', 'tiki'];
const _kQ9  = ['light_crisp', 'sweet_soft', 'bitter_hoppy', 'dark_roasty', 'sour_funky'];
const _kQ10 = ['lager', 'ipa', 'stout', 'wheat', 'sour_ale'];
const _kQ11 = [
  'vanilla_caramel', 'citrus_berry', 'dried_choco', 'oak_woody',
  'smoky_peated', 'almond_nutty', 'floral', 'spicy', 'herb_mint',
];
const _kQ12 = ['under_30k', '30k_100k', '100k_200k', 'over_200k'];
