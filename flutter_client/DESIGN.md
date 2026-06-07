# ONTHEBLOCK Design Language

This is the working design contract for the Flutter client. It defines a
commercial, product-specific direction for ONTHEBLOCK while keeping the app thin:
visual polish belongs in Flutter, but backend APIs, auth rules, gRPC contracts,
recommendation ranking, chat delivery, and map business logic stay unchanged.

## Product Position

ONTHEBLOCK is a premium local bottle and community app. It combines:

- alcohol recommendation
- nearby venue and store discovery
- local community posts
- group chat
- map discovery
- collection and profile
- AI sommelier explanation

The product should not feel like a generic board/chat app. The first impression
should be: local, curated, trustworthy, and useful when deciding what to drink or
where to go nearby.

## Reference Mix

- Airbnb: photo-led place cards, warm marketplace trust, rounded image surfaces,
  restrained listing metadata.
- Karrot: neighborhood trust, local metadata, simple community affordances,
  orange used as a recognizable accent rather than decoration everywhere.
- Vivino and Untappd: bottle discovery, ratings, taste signals, recommendation
  reasons, collection behavior, and lightweight review/social proof.
- Intercom and LINE: clear conversation hierarchy, distinct voices, reliable
  chat interactions, AI guidance that supports the task instead of taking over.
- Toss and Notion: Korean mobile polish, calm settings/profile surfaces,
  high-readability typography, careful empty/error states, low visual fatigue.
- Material 3 and Apple HIG: platform-quality navigation, accessible contrast,
  stable tab behavior, clear button states, and predictable input behavior.

Do not copy any reference directly. The target is an ONTHEBLOCK-specific system:
warm marketplace discovery plus sommelier-grade explanation.

## Brand Personality

- Curated: recommendations feel selected, not dumped from a service response.
- Local: place cards and posts carry neighborhood, distance, status, and social
  context.
- Trustworthy: actions are honest. Unavailable features are disabled or explain
  local status.
- Premium but approachable: rich surfaces, readable metadata, subtle borders,
  minimal noise.
- Helpful: the AI sommelier explains recommendations and context. It does not
  replace browsing, map discovery, or community.

## Visual Mood

- Warm off-white and parchment light surfaces.
- Warm charcoal dark surfaces, never cold blue-black shells.
- Photo-led cards where the content is a place, bottle, venue, or experience.
- Mostly flat surfaces with hairline borders. Use shadow only for floating
  layers such as modals, bottom bars, map overlays, and elevated hero cards.
- Orange-family accents appear at high-value moments: selected navigation,
  primary CTAs, match badges, open/local status, and save/curation affordances.
- Avoid random gradients, large blurred blobs, novelty animation, and full-screen
  orange backgrounds.

## Color System

Primary accent:

- ONTHEBLOCK Copper Orange `#E85D2A`: the brand/CTA orange used for primary
  buttons, selected bottom navigation, strongest match badges, progress, and
  brand wordmarks.
- Terracotta Orange `#C96A3A`: a quieter supporting orange used for category
  selection, carousel dots, local discovery metadata, message/status surfaces,
  and secondary selected states.
- Amber Orange `#C87934`: rating, rarity, AI/sommelier hints, and premium
  explanation/status moments.
- Cellar Rust `#8E3F2C`: saved/wishlist/collection sentiment and restrained
  cellar-like emphasis.

Light mode:

- App background: warm off-white with less yellow than parchment.
- Primary card surface: clean warm near-white.
- Secondary surface: restrained warm sand/off-white.
- Text: warm near-black.
- Muted text: warm gray/brown.
- Borders: soft warm beige.

Dark mode:

- App background: deep warm charcoal.
- Primary card surface: slightly lifted charcoal.
- Secondary surface: warm dark brown/graphite.
- Text: warm cream.
- Muted text: warm gray/cream.
- Borders: low-contrast warm brown.

Rules:

- Orange is an accent family, not a full-screen background system.
- Text on orange must be white or sufficiently high-contrast.
- Do not mix unrelated green/blue accents into core flows. Use the orange
  family by hierarchy: copper for primary actions, terracotta for selected
  metadata, amber for premium/status, rust for saved/collection moments, and
  neutral icons for secondary actions.
- Error red is reserved for destructive or failed states.

## Typography

Use Public Sans throughout the Flutter client.

Hierarchy:

- Display/app brand: 28-32, weight 900, very sparing.
- Screen title: 22-26, weight 800-900.
- Section title: 18-20, weight 800.
- Card title: 15-18, weight 800-900.
- Body: 14-16, weight 400-600, generous line height.
- Metadata: 11-13, weight 600-700, muted color.
- Badge labels: 10-12, weight 800-900.

Rules:

- Do not use negative letter spacing.
- Avoid long all-caps labels except small badges.
- Korean and English names should both fit without overflow.
- Text inside compact buttons and chips must truncate or wrap intentionally.

## Spacing Scale

Use a 4px-based scale:

- 4: tight icon/text gap.
- 8: chip gap, compact vertical rhythm.
- 12: card internal grouping.
- 16: default screen gutter and card padding.
- 20: premium card padding.
- 24: section separation.
- 32: major screen separation.
- 48: large onboarding/login separation.

Rules:

- Default mobile horizontal padding is 16.
- Dense operational screens may use 12.
- Hero surfaces can use 20-24 padding.
- Lists should have stable item heights where cards scroll horizontally.

## Radius Scale

- 8: small controls, compact tags.
- 12: image corners, input internals.
- 16: buttons, text fields, small cards.
- 20: recommendation cards and settings cards.
- 24: hero cards, large image-led cards, map overlays.
- 999: chips, badges, avatar pills, progress tracks.

Rules:

- Avoid nested cards with multiple large radii.
- Image corners should match or be slightly smaller than parent card corners.
- Bottom navigation indicators can use pill radii.

## Surface And Card Rules

- Cards are mostly flat with a soft border.
- Use shadows only for floating UI: map selected place, modal, bottom nav, hero
  emphasis.
- Image-led cards need a real visual area when content represents a place,
  venue, bottle, or experience.
- Metadata should be scannable: distance, category, status, rating, location,
  and match reasons should appear as short rows or chips.
- Repeated card lists should not shift size based on hover, selection, loading,
  or dynamic text.

## Button Styles

Primary:

- Filled orange, white text, 16px or pill radius.
- Use for one high-value action per surface.

Secondary:

- Filled neutral or outlined warm border.
- Use for browse, filter, retake, support, and staged actions.

Text:

- Use for low-emphasis navigation or "See all" style commands.

Icon buttons:

- Use familiar Material icons.
- Keep tap target near 40-44px.
- Disabled icons use muted text color and neutral background.

Rules:

- No no-op button should look fully enabled.
- If a feature is unavailable, either disable it or show a clear local snackbar.
- Destructive actions need clear copy and error/destructive color only when
  appropriate.

## Text Field Styles

- Filled warm secondary surface.
- 16px radius minimum.
- Visible border in resting state and stronger orange border on focus.
- Hint text must be readable in both themes.
- Multiline chat fields must grow predictably and keep send/attach buttons
  aligned to the bottom.
- Keyboard submit should map to the obvious action when possible.

## Chip And Badge Styles

Chips:

- Neutral filled chips for metadata.
- Orange filled chip only for selected state or primary match.
- Outlined chips for filters and staged actions.

Badges:

- Match badges: orange filled, white label.
- Status badges: neutral or orange outline depending on importance.
- Error badges: red only for failed/destructive state.

Rules:

- Keep chip labels short.
- Reason-code chips should be humanized before display.
- Avoid using raw backend enum names.

## App Bar Rules

- Top app bar is quiet and stable.
- Brand mark should be visible but not consume the screen.
- Search, notification, and profile actions use consistent 40px icon targets.
- Use a subtle bottom border. Avoid heavy elevation.
- Notification badges should be small, stable, and high-contrast.

## Bottom Navigation Rules

- Bottom nav is top-level navigation only.
- Keep all primary tabs visible and stable.
- Use icon plus one-word label.
- Selected state uses orange icon/text and a subtle orange pill background.
- Unselected state uses muted neutral color.
- Badge count should not shift layout.
- Use a floating/premium feel through subtle border and shadow, not bulk.

## Home Rules

- Home should feel like a premium recommendation/storefront surface.
- The recommendation hero is the lead surface when recommendation data exists.
- Recommendation hero content should page horizontally so the next curated pick
  is visible without making the first card dominate the whole viewport.
- If recommendation data is unavailable, show a polished status card with clear
  next state.
- Follow the hero with category filters, local establishments, outdoor/experience
  cards, and neighborhood/community proof.
- Mock content is acceptable only when it looks intentionally staged and does
  not pretend unavailable actions are complete.

## Recommendation Card Rules

Recommendation UI must show:

- primary display name
- Korean name or English secondary name when available
- category and style
- match reason/explanation
- short reason chips
- rank or match score
- quick actions such as save, dismiss, and details

Rules:

- Cards must feel curated, not like debug output.
- Show match score as a user-facing "match" value, not raw service scoring.
- Rank and reason codes should be formatted for humans.
- The top recommendation gets a richer hero treatment.
- Quick actions should record existing events only; do not change ranking logic.

## Map And Place Card Rules

- Map should feel like place discovery.
- Search and filters float over the map with legible surfaces.
- Selected place card must show image, name, rating, distance, category, open
  status, and tags.
- Floating map overlays may use stronger shadow than normal cards.
- Keep map content visible behind overlays.

## Chat And AI Sommelier Rules

- Chatbot supports explanation. It should not dominate the app.
- Distinguish user, assistant, and system messages clearly.
- Assistant responses should be compact, useful, and grounded in current app
  surfaces where possible.
- Rich in-chat cards are allowed for bottle/place explanations, but they should
  not replace Home or Map.
- Chips in assistant messages are suggestions; they should look secondary unless
  they perform a real primary action.
- Loading should show typing or compact progress, not full-screen blocking.

## Profile And Settings Rules

- Profile should feel trustworthy and practical.
- Personal information, theme, neighborhood, taste profile, help, and logout
  need clear grouping.
- Global app controls such as theme mode belong in Profile.
- Theme state must be shared with login and persist after restart.
- Avoid noisy badges or gamification that could make alcohol use feel rewarded
  in an irresponsible way.

## Empty, Loading, And Error States

Loading:

- Use compact cards or inline progress.
- Preserve layout size when possible.
- Avoid blank screens unless the whole route is genuinely blocked.

Empty:

- Explain why the surface is empty.
- Provide one clear next action when there is a real action.
- Avoid blaming backend/service internals.

Error:

- Use plain language.
- Offer retry when retry exists.
- Keep destructive/error color restrained.
- Do not expose raw exceptions unless the screen is developer-only.

## Light And Dark Mode Rules

- Both themes must be readable on major screens.
- Dark mode uses warm charcoal plus cream text, not pure black with neon orange.
- Cards need enough separation in dark mode through borders and slight surface
  changes.
- Images stay unchanged; overlays and text must maintain contrast.
- Disabled states must be visible in both modes.

## Do

- Use photos for venues, local experiences, and discovery cards.
- Use orange selectively for selected, primary, match, and status moments.
- Format recommendation reasons for humans.
- Keep actions honest and clearly disabled or explained.
- Make Home feel like the commercial storefront of the app.
- Make Map feel like local place discovery.
- Keep AI as an explanation and guidance layer.
- Prefer subtle borders, warm surfaces, and readable hierarchy.

## Do Not

- Do not copy Airbnb, Karrot, Vivino, Untappd, Intercom, LINE, Toss, or Notion
  directly.
- Do not use full-screen orange backgrounds.
- Do not add random gradients, decorative blobs, or unnecessary animation.
- Do not present unavailable features as fully working.
- Do not show raw backend enum names or debug-style scores.
- Do not change backend APIs, gRPC contracts, auth behavior, map business logic,
  or recommendation ranking for visual polish.
- Do not make alcohol consumption feel like a game loop.

## Implementation Priority

1. Theme tokens and shared components.
2. App bars, bottom navigation, buttons, inputs, chips, and badges.
3. Home recommendation hero and recommendation cards.
4. Map selected place overlays.
5. Chat and AI sommelier modal polish.
6. Profile/settings clarity and theme control.
7. Screen-specific empty/loading/error state polish.
