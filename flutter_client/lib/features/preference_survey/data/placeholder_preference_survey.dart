import 'package:flutter/material.dart';

import '../models/preference_survey_step.dart';

// Temporary English placeholder content translated from Preference.pdf.
// The source survey is explicitly not final; replace this list when product
// copy, schema, and recommendation contracts are confirmed.
const placeholderPreferenceSurveySteps = <PreferenceSurveyStep>[
  PreferenceSurveyStep(
    title: 'How familiar are you with premium liquor?',
    description: 'Choose the level that best matches how you explore spirits.',
    options: [
      PreferenceSurveyOption(
        label: 'Beginner',
        description: 'I am just starting to discover drinks I enjoy.',
        icon: Icons.spa_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Enthusiast',
        description: 'I have favorites and like trying something new.',
        icon: Icons.explore_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Expert',
        description: 'I enjoy tasting notes, regions, casks, and stories.',
        icon: Icons.auto_awesome_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'Which categories interest you most?',
    description: 'Select every category you would like to see more often.',
    options: [
      PreferenceSurveyOption(
        label: 'Whiskey',
        description: 'Single malt, bourbon, rye, and other whiskey styles.',
        icon: Icons.liquor_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Wine',
        description: 'Red, white, sparkling, natural, and orange wines.',
        icon: Icons.wine_bar_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Cognac & Brandy',
        description: 'Cognac, Armagnac, and other aged grape spirits.',
        icon: Icons.local_bar_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Cocktails & Liqueurs',
        description: 'Home-tending bottles, liqueurs, and cocktail bases.',
        icon: Icons.local_drink_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Beer',
        description: 'Craft beer, ale, lager, stout, and seasonal releases.',
        icon: Icons.sports_bar_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'What whiskey profile sounds most appealing?',
    description: 'Use this as a flavor shortcut, not a final whiskey rule.',
    options: [
      PreferenceSurveyOption(
        label: 'Sweet & Smooth',
        description: 'Vanilla, caramel, honey, and an easy finish.',
        icon: Icons.cookie_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Rich Fruit',
        description: 'Dried fruit, chocolate, and deeper aromatic notes.',
        icon: Icons.cake_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Smoky & Peaty',
        description: 'Campfire smoke, iodine, seaweed, and bold character.',
        icon: Icons.air_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Floral & Bright',
        description: 'Flowers, citrus, honey, and a lighter texture.',
        icon: Icons.local_florist_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Bourbon & Rye Weight',
        description: 'Corn or rye sweetness with oak and spice.',
        icon: Icons.agriculture_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'What wine mood do you usually enjoy?',
    description: 'Pick the drinking experience that feels closest.',
    options: [
      PreferenceSurveyOption(
        label: 'Light & Sweet',
        description: 'Easy fruit, gentle sweetness, and a soft feel.',
        icon: Icons.water_drop_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Fresh & Clean',
        description:
            'Crisp acidity, little sweetness, and a refreshing finish.',
        icon: Icons.bolt_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Soft & Balanced',
        description: 'Moderate body without too much bitterness or tannin.',
        icon: Icons.balance_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Deep & Full',
        description: 'Full mouthfeel, firm tannin, and a strong presence.',
        icon: Icons.dark_mode_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'Which wine style would you reach for first?',
    description: 'These are broad placeholders for later wine preferences.',
    options: [
      PreferenceSurveyOption(
        label: 'Full-Bodied Red',
        description: 'Cabernet Sauvignon, Shiraz, and structured reds.',
        icon: Icons.wine_bar_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Light Red & Rose',
        description: 'Pinot Noir, red fruit, gentle acidity, and lighter body.',
        icon: Icons.local_florist_outlined,
      ),
      PreferenceSurveyOption(
        label: 'White & Champagne',
        description: 'Chardonnay, Sauvignon Blanc, bubbles, and yeast notes.',
        icon: Icons.bubble_chart_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Natural & Orange',
        description: 'Wild yeast, skin contact, texture, and funky edges.',
        icon: Icons.eco_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Fortified Wine',
        description: 'Richer fortified styles for slow sipping.',
        icon: Icons.shield_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'What cocktail style fits your usual order?',
    description: 'This draft content may be removed or changed later.',
    options: [
      PreferenceSurveyOption(
        label: 'Sweet Fruit',
        description: 'Peach, coconut, and low spirit-forward sweetness.',
        icon: Icons.local_cafe_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Crisp Citrus',
        description: 'Lemon, lime, sour balance, and a refreshing feel.',
        icon: Icons.wb_sunny_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Sparkling & Clean',
        description: 'Highballs, soda, fizz, and a clean finish.',
        icon: Icons.bubble_chart_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Spirit-Forward',
        description: 'Martini, Negroni, and drinks where the base shines.',
        icon: Icons.local_bar_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Herbal Liqueur',
        description: 'Amaretto, Campari, bittersweet herbs, and liqueurs.',
        icon: Icons.grass_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'What beer profile do you look for?',
    description: 'Choose the beer feeling that sounds best today.',
    options: [
      PreferenceSurveyOption(
        label: 'Light & Crisp',
        description: 'High carbonation and a clean, easy finish.',
        icon: Icons.ac_unit_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Sweet & Soft',
        description: 'Low bitterness with fruit or wheat-like smoothness.',
        icon: Icons.spa_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Bitter & Aromatic',
        description: 'Citrus, grapefruit, pine, and a hoppy finish.',
        icon: Icons.park_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Dark & Toasty',
        description: 'Coffee, dark chocolate, roasted malt, and depth.',
        icon: Icons.coffee_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'Which craft beer style is closest to your taste?',
    description: 'These placeholder styles mirror the draft survey notes.',
    options: [
      PreferenceSurveyOption(
        label: 'Lager & Pilsner',
        description: 'Clean malt sweetness with gentle hop bitterness.',
        icon: Icons.sports_bar_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Pale Ale & IPA',
        description: 'Tropical fruit, citrus, pine, and hop intensity.',
        icon: Icons.forest_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Stout & Porter',
        description: 'Roasted body with coffee and chocolate flavor.',
        icon: Icons.coffee_maker_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Weizen & White Ale',
        description: 'Banana, clove, yeast aroma, and soft texture.',
        icon: Icons.grain_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'Pick the flavor keywords you like.',
    description: 'These tags are placeholders for future preference matching.',
    options: [
      PreferenceSurveyOption(
        label: 'Vanilla & Caramel',
        description: 'Sweetness, cream, and dessert-like warmth.',
        icon: Icons.icecream_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Citrus & Berry',
        description: 'Fresh fruit, brightness, and juicy acidity.',
        icon: Icons.local_florist_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Dried Fruit & Chocolate',
        description: 'Dense sweetness, cocoa, and dark fruit.',
        icon: Icons.cake_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Oak & Wood',
        description: 'Barrel spice, wood grain, and structure.',
        icon: Icons.forest_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Smoky & Peaty',
        description: 'Smoke, char, earth, and coastal intensity.',
        icon: Icons.air_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Nutty',
        description: 'Almond, roasted nuts, and savory richness.',
        icon: Icons.ramen_dining_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Floral',
        description: 'Light flowers, perfume, and delicate aromatics.',
        icon: Icons.local_florist_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Spicy',
        description: 'Pepper, cinnamon, clove, and warm spice.',
        icon: Icons.whatshot_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Herb & Mint',
        description: 'Green herbs, mint, and a refreshing finish.',
        icon: Icons.grass_outlined,
      ),
    ],
  ),
  PreferenceSurveyStep(
    title: 'What budget do you usually have in mind?',
    description: 'This only shapes the placeholder UI for now.',
    options: [
      PreferenceSurveyOption(
        label: 'Under 30,000 KRW',
        description: 'Value-friendly bottles for everyday drinking.',
        icon: Icons.savings_outlined,
      ),
      PreferenceSurveyOption(
        label: '30,000-100,000 KRW',
        description: 'A bottle for a good night or small celebration.',
        icon: Icons.payments_outlined,
      ),
      PreferenceSurveyOption(
        label: '100,000-200,000 KRW',
        description: 'A more intentional bottle for exploring taste.',
        icon: Icons.diamond_outlined,
      ),
      PreferenceSurveyOption(
        label: 'Over 200,000 KRW',
        description: 'Premium bottles, gifts, or collection candidates.',
        icon: Icons.workspace_premium_outlined,
      ),
    ],
  ),
];
