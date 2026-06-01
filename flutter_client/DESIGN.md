# On The Block Design Direction

This file is the working design reference for the Flutter client. It adapts the
existing Stitch direction instead of replacing it.

## Product Feel

On The Block should feel like a premium neighborhood alcohol community: local,
warm, useful, and trustworthy. The UI should help users browse bottles, nearby
shops, board posts, chat rooms, and recommendations without feeling like a demo
screen.

## Selected References

- Airbnb: use as the primary reference for warm local browsing, rounded
  photo-led cards, readable listing metadata, and approachable marketplace
  behavior. Do not copy Airbnb colors or layout exactly.
- Notion: use for warm neutral surfaces, quiet borders, readable hierarchy, and
  low visual fatigue. On The Block should stay warmer and more visual than
  Notion.
- Intercom: use for chat and chatbot patterns: distinct voices, message-sized
  chunks, generous thread spacing, and clear guardrails for automated guidance.
- Linear: use only as a secondary reference for spacing discipline, precision,
  and restrained states. Avoid making the app feel like an engineering tool.

## Color

- Keep On The Block orange as the brand accent.
- Use orange for selected states, key CTAs, active badges, and important local
  status signals.
- Do not use orange for every icon or every label. Let neutral text and warm
  surfaces carry most of the interface.
- Light mode should use warm off-white and parchment-like surfaces, not cold
  blue-gray shells.
- Dark mode should feel premium and focused, with warm charcoal surfaces and
  readable cream text.

## Typography

- Continue using Public Sans.
- Use high weights sparingly: page titles, card titles, and important numeric
  values.
- Body and metadata text should be readable at small sizes with enough line
  height.
- Avoid negative letter spacing. Tight spacing makes the app feel less polished
  on mobile.

## Components

- Cards: rounded, soft, bordered, and mostly flat. Use shadow only for floating
  layers such as map overlays, bottom bars, and modals.
- Buttons: pill or 16px rounded shapes, clear disabled states, and no no-op
  actions.
- Chips and badges: pill shapes with restrained color. Prefer tinted neutral
  chips unless the state is selected or critical.
- Text fields: filled warm surfaces, visible focus border, readable hint text in
  both themes.
- App bars: quiet surface, consistent height, subtle border, and restrained
  action icons.
- Bottom navigation: stable dimensions, clear selected state, small badge
  counts, and no layout shift.

## Screen Guidance

- Home: photo-led cards and recommendation cards should feel local and curated,
  not like placeholder lists.
- Map: overlays should be legible over map content and use shadow only where it
  improves separation.
- Board: cards should read as community posts, with clear author, location,
  activity, and chat affordances.
- Chat and chatbot: preserve transcript order, keep voices visually distinct,
  and do not present unavailable actions as working controls.
- Profile: settings should be trustworthy and practical; global app controls
  such as theme mode belong here.

## Current Boundaries

- Keep the Flutter app thin.
- Do not add backend logic, auth rules, payment, comments, or recommendation
  computation as part of visual polish.
- Unimplemented actions should either be disabled or show clear local feedback.
- Public mock UI is acceptable, but it must not look broken.

## Sources Used For Inspiration

- https://github.com/VoltAgent/awesome-design-md
- https://getdesign.md/airbnb/design-md
- https://getdesign.md/notion/design-md
- https://getdesign.md/intercom/design-md
- https://getdesign.md/linear.app/design-md
