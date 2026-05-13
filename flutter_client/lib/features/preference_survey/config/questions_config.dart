import '../models/survey_question.dart';

/// Single source of truth for all survey questions.
///
/// Q1: experience level (single-select) — drives routing with Q2
/// Q2: liquor categories (multi-select) — drives routing with Q1
/// Q3-Q10: conditional detail questions
/// Q11: flavor keyword tags (multi-select, max 3) — always shown
/// Q12: budget tier (single-select) — always shown
final List<SurveyQuestion> kAllQuestions = [
  // ── Q1: 경험 레벨 ────────────────────────────────────────────────
  SurveyQuestion(
    id: 'q1',
    text: '본인이 어느 정도로 술을 좋아하시나요?',
    subtitle: '솔직하게 선택해 주세요. 맞춤 추천의 첫 번째 단계예요.',
    options: [
      QuestionOption(
        value: 'beginner',
        label: '입문자',
        description: '이제 막 맛있는 술을 알아가는 중이에요.',
        icon: 'school',
      ),
      QuestionOption(
        value: 'enthusiast',
        label: '애호가',
        description: '즐겨 마시는 주종이 있고, 새로운 술을 시도하는 걸 좋아해요.',
        icon: 'star',
      ),
      QuestionOption(
        value: 'expert',
        label: '전문가',
        description: '테이스팅 노트를 분석하고, 다양한 스토리를 깊게 파고들어요.',
        icon: 'verified',
      ),
    ],
  ),

  // ── Q2: 선호 카테고리 (multi-select) ─────────────────────────────
  SurveyQuestion(
    id: 'q2',
    text: '가장 끌리는 주류 카테고리를 모두 선택해 주세요.',
    subtitle: '여러 개를 선택할 수 있어요.',
    isMultiSelect: true,
    options: [
      QuestionOption(value: 'whiskey',  label: '위스키',       description: 'Single Malt, Bourbon 등', icon: 'liquor'),
      QuestionOption(value: 'wine',     label: '와인',          description: 'Red, White, Sparkling 등', icon: 'wine_bar'),
      QuestionOption(value: 'cognac',   label: '꼬냑·브랜디',   description: 'Cognac, Armagnac 등', icon: 'local_bar'),
      QuestionOption(value: 'cocktail', label: '칵테일·리큐르', description: 'Home-tending, Liqueur', icon: 'sports_bar'),
      QuestionOption(value: 'beer',     label: '맥주',          description: 'Craft Beer, Ale, Lager', icon: 'sports_bar'),
    ],
  ),

  // ── Q3: 위스키 × 입문자 ──────────────────────────────────────────
  SurveyQuestion(
    id: 'q3',
    text: '어떤 맛과 향이 나는 위스키를 마셔보고 싶으신가요?',
    subtitle: '느낌으로 골라주세요. 틀린 답은 없어요.',
    options: [
      QuestionOption(value: 'sweet_smooth',  label: '달콤하고 부드러운',   description: '바닐라나 카라멜처럼 달콤하고 목 넘김이 편한 맛', icon: 'cake'),
      QuestionOption(value: 'fruity',        label: '과일처럼 향긋한',     description: '말린 과일이나 초콜릿처럼 향이 풍부하고 진한 맛', icon: 'local_florist'),
      QuestionOption(value: 'smoky_bitter',  label: '독특하고 쌉싸름한',   description: '모닥불 연기나 소독약 같은 개성 있는 향이 나는 맛', icon: 'local_fire_department'),
      QuestionOption(value: 'light_floral',  label: '가볍고 화사한',       description: '꽃 향기나 꿀처럼 은은하고 산뜻한 맛', icon: 'spa'),
      QuestionOption(value: 'rich_intense',  label: '묵직하고 강렬한',     description: '카라멜이나 체리처럼 진득한 단맛과 타격감이 느껴지는 맛', icon: 'whatshot'),
    ],
    condition: (q1, q2) => (q2?.contains('whiskey') ?? false) && q1 == 'beginner',
  ),

  // ── Q4: 위스키 × 애호가/전문가 ───────────────────────────────────
  SurveyQuestion(
    id: 'q4',
    text: '평소 즐겨 드시거나 선호하는 위스키의 스타일은 무엇인가요?',
    subtitle: '캐스크와 대표 스타일 기준으로 선택해 주세요.',
    options: [
      QuestionOption(value: 'bourbon_cask',   label: '버번 캐릭터',        description: '아메리칸 버번 캐스크에서 오는 바닐라, 꿀, 서양배의 풍미', icon: 'liquor'),
      QuestionOption(value: 'sherry_cask',    label: '셰리 캐릭터',        description: '올로로소/PX 캐스크에서 오는 건과일, 견과류, 다크 초콜릿의 꾸덕함', icon: 'wine_bar'),
      QuestionOption(value: 'peated',         label: '피트 캐릭터',        description: '아일라(Islay) 지역 특유의 스모키, 요오드, 해조류의 짭짤함', icon: 'local_fire_department'),
      QuestionOption(value: 'floral_citrus',  label: '플로럴 & 시트러스',  description: '스페이사이드/로우랜드 특유의 화사한 꽃 향과 청사과 같은 과실 향', icon: 'local_florist'),
      QuestionOption(value: 'american',       label: '아메리칸 위스키',    description: '새 오크통의 강렬한 바닐라, 옥수수의 단맛 또는 호밀의 알싸한 스파이스 풍미', icon: 'agriculture'),
    ],
    condition: (q1, q2) => (q2?.contains('whiskey') ?? false) && (q1 == 'enthusiast' || q1 == 'expert'),
  ),

  // ── Q5: 와인 × 입문자 ────────────────────────────────────────────
  SurveyQuestion(
    id: 'q5',
    text: '와인을 드실 때, 어떤 느낌을 가장 좋아하시나요?',
    subtitle: '직관적으로 골라주세요.',
    options: [
      QuestionOption(value: 'light_sweet',    label: '가볍고 달콤한',    description: '과일 주스처럼 가볍고 단맛이 기분 좋게 나는 와인', icon: 'water_drop'),
      QuestionOption(value: 'crisp_dry',      label: '산뜻하고 깔끔한',  description: '단맛 없이 상큼해서 입맛을 돋워주는 와인', icon: 'air'),
      QuestionOption(value: 'smooth_medium',  label: '부드럽고 적당한',  description: '너무 떫지 않고 부드럽게 마시기 좋은 적당한 무게감의 와인', icon: 'sentiment_satisfied'),
      QuestionOption(value: 'bold_tannic',    label: '진하고 묵직한',    description: '입안을 꽉 채우고 약간 떫은맛이 매력적인 와인', icon: 'whatshot'),
      QuestionOption(value: 'sparkling',      label: '톡 쏘는 청량감',   description: '기분 좋은 탄산이 있어 축하하는 자리나 가볍게 마시기 좋은 스파클링 와인', icon: 'celebration'),
    ],
    condition: (q1, q2) => (q2?.contains('wine') ?? false) && q1 == 'beginner',
  ),

  // ── Q6: 와인 × 애호가/전문가 ─────────────────────────────────────
  SurveyQuestion(
    id: 'q6',
    text: '가장 선호하는 와인의 품종이나 스타일은 무엇인가요?',
    subtitle: '품종과 바디감 기준으로 선택해 주세요.',
    options: [
      QuestionOption(value: 'full_red',     label: '풀바디 레드',        description: '까베르네 소비뇽, 쉬라즈처럼 타닌이 풍부하고 골격이 탄탄한 스타일', icon: 'wine_bar'),
      QuestionOption(value: 'light_red',    label: '라이트 레드 & 로제',  description: '피노 누아처럼 섬세한 붉은 과실 향과 기분 좋은 산미가 있는 스타일', icon: 'local_florist'),
      QuestionOption(value: 'white',        label: '화이트',              description: '샤르도네의 버터 풍미나 소비뇽 블랑의 허브, 시트러스처럼 산뜻한 스타일', icon: 'water_drop'),
      QuestionOption(value: 'natural',      label: '내추럴 & 오렌지',     description: '야생 효모의 쿰쿰함이나 포도껍질과 함께 발효해 독특한 질감을 가진 스타일', icon: 'eco'),
      QuestionOption(value: 'fortified',    label: '주정강화 (포트/셰리)', description: '발효 중 브랜디를 첨가해 도수가 높고 진득한 과일이나 견과류 풍미', icon: 'liquor'),
    ],
    condition: (q1, q2) => (q2?.contains('wine') ?? false) && (q1 == 'enthusiast' || q1 == 'expert'),
  ),

  // ── Q7: 칵테일 × 입문자 ─────────────────────────────────────────
  SurveyQuestion(
    id: 'q7',
    text: '바에 가셨을 때, 주로 어떤 칵테일을 주문하시나요?',
    subtitle: '분위기와 맛 위주로 골라주세요.',
    options: [
      QuestionOption(value: 'sweet_fruit',   label: '달콤한 과일 맛',       description: '복숭아, 코코넛 등 달달하고 술맛이 거의 안 나는 칵테일', icon: 'local_florist'),
      QuestionOption(value: 'sour_fresh',    label: '상큼하고 시원한 맛',   description: '레몬이나 라임이 들어가 새콤하고 청량감 있는 칵테일', icon: 'water_drop'),
      QuestionOption(value: 'highball',      label: '깔끔한 탄산',          description: '하이볼처럼 탄산수가 들어가 시원하고 깔끔하게 마실 수 있는 칵테일', icon: 'sports_bar'),
      QuestionOption(value: 'spirit_fwd',    label: '조금 묵직한 맛',       description: '술 본연의 맛이 느껴지면서도 향긋한 칵테일', icon: 'local_bar'),
      QuestionOption(value: 'creamy',        label: '부드럽고 크리미한 맛', description: '우유, 커피, 초콜릿 등이 들어가 디저트처럼 달콤한 칵테일', icon: 'coffee'),
    ],
    condition: (q1, q2) => (q2?.contains('cocktail') ?? false) && q1 == 'beginner',
  ),

  // ── Q8: 칵테일 × 애호가 ─────────────────────────────────────────
  SurveyQuestion(
    id: 'q8',
    text: '선호하시는 칵테일의 조주 스타일이나 베이스는 무엇인가요?',
    subtitle: '베이스와 클래식 레시피 기준으로 선택해 주세요.',
    options: [
      QuestionOption(value: 'sour',       label: '새콤달콤한 사워 (Sour)',          description: '기주에 레몬즙과 시럽이 들어가 밸런스가 좋은 스타일', icon: 'water_drop'),
      QuestionOption(value: 'long_drink', label: '청량한 롱 드링크 (Long Drink)',    description: '존 콜린스나 피즈 류처럼 길게 즐기기 좋은 탄산 칵테일', icon: 'sports_bar'),
      QuestionOption(value: 'spirit_fwd', label: '묵직한 스피릿 포워드',            description: '마티니, 네그로니처럼 기주의 묵직한 맛과 허브 향이 직관적으로 섞인 스타일', icon: 'local_bar'),
      QuestionOption(value: 'liqueur',    label: '달콤한 허브 & 리큐르 베이스',     description: '아마레또, 캄파리 등 리큐르 특유의 쌉싸름하거나 달콤한 풍미', icon: 'local_florist'),
      QuestionOption(value: 'tiki',       label: '트로피컬 & 티키 (Tiki)',          description: '럼 베이스로 다양한 열대과일 주스와 향신료가 어우러져 복합적인 단맛', icon: 'beach_access'),
    ],
    condition: (q1, q2) => (q2?.contains('cocktail') ?? false) && (q1 == 'enthusiast' || q1 == 'expert'),
  ),

  // ── Q9: 맥주 × 입문자 ────────────────────────────────────────────
  SurveyQuestion(
    id: 'q9',
    text: '시원한 맥주가 당길 때, 어떤 느낌을 찾으시나요?',
    subtitle: '맛과 청량감 위주로 골라주세요.',
    options: [
      QuestionOption(value: 'light_crisp',   label: '가볍고 시원한',        description: '탄산이 강하고 목 넘김이 깔끔해서 벌컥벌컥 마시기 좋은 맥주', icon: 'water_drop'),
      QuestionOption(value: 'sweet_soft',    label: '달콤하고 부드러운',    description: '쓴맛이 적고 과일 향이나 밀밭 같은 부드러운 향이 나는 맥주', icon: 'grain'),
      QuestionOption(value: 'bitter_hoppy',  label: '쌉싸름하고 향긋한',   description: '자몽이나 귤 같은 과일 향이 나면서 끝맛이 쌉쌀한 맥주', icon: 'local_florist'),
      QuestionOption(value: 'dark_roasty',   label: '고소하고 흑빛인',      description: '커피나 다크 초콜릿처럼 진하고 구수한 맛이 나는 흑맥주', icon: 'coffee'),
      QuestionOption(value: 'sour_funky',    label: '독특하고 새콤한',      description: '과일 향이 나면서 와인처럼 산뜻하고 새콤한 맛이 나는 맥주', icon: 'eco'),
    ],
    condition: (q1, q2) => (q2?.contains('beer') ?? false) && q1 == 'beginner',
  ),

  // ── Q10: 맥주 × 애호가 ───────────────────────────────────────────
  SurveyQuestion(
    id: 'q10',
    text: '평소 즐겨 마시는 크래프트 맥주의 스타일은 무엇인가요?',
    subtitle: '대표 스타일(Style) 기준으로 선택해 주세요.',
    options: [
      QuestionOption(value: 'lager',    label: '라거 & 필스너',        description: '깔끔한 몰트의 단맛과 기분 좋은 홉의 쌉싸름함이 조화로운 스타일', icon: 'sports_bar'),
      QuestionOption(value: 'ipa',      label: '페일에일 & IPA',       description: '시트라, 모자익 등 홉에서 뿜어져 나오는 폭발적인 열대과일, 솔 향의 스타일', icon: 'local_florist'),
      QuestionOption(value: 'stout',    label: '스타우트 & 포터',      description: '로스팅한 맥아 특유의 묵직한 바디감과 진한 커피, 초콜릿 풍미의 스타일', icon: 'coffee'),
      QuestionOption(value: 'wheat',    label: '바이젠 & 화이트 에일', description: '효모가 만들어내는 바나나, 정향(클로브)의 향긋함과 부드러운 질감', icon: 'grain'),
      QuestionOption(value: 'sour_ale', label: '사워 에일 & 와일드 에일', description: '유산균이나 야생 효모로 발효해 산미가 강하고 와인처럼 복합적인 풍미', icon: 'eco'),
    ],
    condition: (q1, q2) => (q2?.contains('beer') ?? false) && (q1 == 'enthusiast' || q1 == 'expert'),
  ),

  // ── Q11: 향미 키워드 (multi-select, max 3) ───────────────────────
  SurveyQuestion(
    id: 'q11',
    text: '온더블록이 당신의 취향을 분석할 수 있도록,\n좋아하는 향과 맛의 키워드를 3가지 골라주세요.',
    subtitle: '정확히 3가지를 선택해 주세요.',
    isMultiSelect: true,
    maxSelections: 3,
    options: [
      QuestionOption(value: 'vanilla_caramel', label: '#바닐라·카라멜',    description: '달콤함', icon: 'cake'),
      QuestionOption(value: 'citrus_berry',    label: '#시트러스·베리',    description: '상큼한 과일', icon: 'water_drop'),
      QuestionOption(value: 'dried_choco',     label: '#건과일·초콜릿',    description: '꾸덕함', icon: 'local_dining'),
      QuestionOption(value: 'oak_woody',       label: '#오크·우디',        description: '나무향', icon: 'forest'),
      QuestionOption(value: 'smoky_peated',    label: '#스모키·피트',      description: '훈연향', icon: 'local_fire_department'),
      QuestionOption(value: 'almond_nutty',    label: '#아몬드·너티',      description: '고소함', icon: 'spa'),
      QuestionOption(value: 'floral',          label: '#플로럴',           description: '화사한 꽃', icon: 'local_florist'),
      QuestionOption(value: 'spicy',           label: '#스파이시',         description: '후추·시나몬', icon: 'whatshot'),
      QuestionOption(value: 'herb_mint',       label: '#허브·민트',        description: '상쾌함', icon: 'eco'),
    ],
  ),

  // ── Q12: 예산 ────────────────────────────────────────────────────
  SurveyQuestion(
    id: 'q12',
    text: '주로 생각하시는 1병당 구매 예산은 어느 정도인가요?',
    subtitle: '추천 상품의 가격 범위를 설정하는 데 사용돼요.',
    options: [
      QuestionOption(value: 'under_30k',    label: '3만원 이하',     description: '가성비 데일리', icon: 'savings'),
      QuestionOption(value: '30k_100k',     label: '3~10만원',       description: '기분 내기 좋은 날', icon: 'star'),
      QuestionOption(value: '100k_200k',    label: '10~20만원',      description: '본격적인 취향 탐구', icon: 'verified'),
      QuestionOption(value: 'over_200k',    label: '20만원 이상',    description: '프리미엄 & 수집용', icon: 'diamond'),
    ],
  ),
];

List<SurveyQuestion> getVisibleQuestions(String? q1Answer, List<String>? q2Answer) {
  return kAllQuestions.where((q) {
    if (q.condition == null) return true;
    return q.condition!(q1Answer, q2Answer);
  }).toList();
}
