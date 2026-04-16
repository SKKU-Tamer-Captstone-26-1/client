# Project Memory

This file is a compact handoff note for future AI/LLM coding sessions. Read this first, then read `CLAUDE.md` and `AGENTS.md` for the full project rules.

## Project

`flutter_client` is the Flutter client for **On The Block**.

The app is being built screen by screen from Stitch HTML exports in:

`/Users/jeonghun/client/stitch_export`

The Flutter client should stay thin:

- UI and interaction shell only unless the user explicitly asks otherwise.
- Use local mock data until backend/API contracts are finalized.
- Do not add backend logic.
- Do not implement final recommendation logic.
- Do not assume a finalized API schema.
- Do not redesign approved Stitch UI unless the user asks for a change.

## Working Rules

- Follow the existing feature structure under `lib/core`, `lib/features`, and `lib/shared`.
- Reuse shared widgets, theme, colors, icons, and mock data patterns.
- Keep changes scoped to the requested screen or component.
- Do not touch unrelated screens or do unrelated refactors.
- Preserve user changes in the working tree.
- Use `apply_patch` for manual file edits.
- Run formatting and validation when code changes are made:
  - `dart format .`
  - `flutter analyze`
  - `flutter test`

For docs-only changes, tests are usually not necessary.

## Current Architecture

Important directories:

- `lib/core/theme`
  - app colors, theme, and shared Material icons.
- `lib/shared/widgets`
  - shared app bar, bottom nav, network image helper, notification window.
- `lib/features/auth`
  - login screen and login widgets.
- `lib/features/preference_survey`
  - onboarding intro and 10-step placeholder survey UI.
- `lib/features/home`
  - home screen and mock home content.
- `lib/features/map`
  - Kakao Map baseline and mock place UI.
- `lib/features/board`
  - board/community screen and mock post data.
- `lib/features/chatbot`
  - reusable chatbot modal UI.

## Implemented Screens And Components

### Login

Files:

- `lib/features/auth/presentation/login_screen.dart`
- `lib/features/auth/presentation/widgets/login_brand_header.dart`
- `lib/features/auth/presentation/widgets/google_sign_in_button.dart`

Behavior:

- Light/dark theme toggle in the top-right of the login screen.
- SVG logo is used because the logo will be reused across screens.
- Light theme uses dark logo.
- Dark theme uses white logo.

Assets:

- `assets/on-the-block-dark.svg`
- `assets/on-the-block-white.svg`

### Preference Survey

Files:

- `lib/features/preference_survey/...`

Behavior:

- Flow is Login -> Survey Intro -> 10-step survey -> Home.
- Current survey text is placeholder/example content translated from `Preference.pdf`.
- Content should be easy to replace later.
- Multiple answers are allowed.
- User can select from at least 1 option up to all options.
- Next/Finish appears only after at least one option is selected.
- No backend or recommendation logic.

### Home

Files:

- `lib/features/home/presentation/home_screen.dart`
- `lib/features/home/data/mock_home_data.dart`
- `lib/features/home/models/home_models.dart`

Behavior:

- Matches `stitch_export/Home.html`.
- Uses shared top app bar and bottom navigation.
- Home logo is the project logo, displayed in rounded form.
- Uses mock/local data only.
- Chatbot modal can open from Home.

### Map

Files:

- `lib/features/map/...`

Behavior:

- Uses Kakao Map as the map engine baseline.
- Do not build a custom map engine.
- Local mock place data is the source for placeholder markers and selected place cards.
- Real place/bar/location data will come from the app backend/database later.
- No external place APIs as source of truth.
- No backend logic and no speculative API contracts.
- Chatbot button should not be shown on Map.

Important:

- `kakao_maps_flutter` is in `pubspec.yaml`.
- Kakao map initializes only when `KAKAO_MAP_API_KEY` is provided through `--dart-define`.
- Without a key, the screen shows a clear placeholder shell.
- Android build includes Kakao Maven repository.

Example run with key:

```sh
flutter run --dart-define=KAKAO_MAP_API_KEY=your_key_here
```

### Board

Files:

- `lib/features/board/presentation/board_screen.dart`
- `lib/features/board/models/board_models.dart`
- `lib/features/board/data/mock_board_data.dart`

Behavior:

- Based on corrected `stitch_export/Board.html`.
- Community board grid with category chips.
- Uses local mock post data only.
- Main `+` floating action button is reserved for writing a post.
- Chatbot uses a separate smaller button above the `+` button.
- Do not replace the post-writing `+` behavior with chatbot behavior.

### Chatbot Modal

File:

- `lib/features/chatbot/presentation/chatbot_modal.dart`

Behavior:

- Based on `stitch_export/Chat-Modal.html`.
- Static/local mock messages only.
- Used on screens except Map.
- Currently wired on Home and Board.

### Notifications

Files:

- `lib/shared/widgets/app_top_app_bar.dart`
- `lib/shared/widgets/notification_window.dart`

Behavior:

- Clicking the notification icon opens a notification window/popover.
- Uses local mock notification content only.
- No backend logic.

## Navigation State

`lib/main.dart` currently owns simple app-stage navigation.

Known flow:

- Login
- Survey intro
- Preference survey
- Home
- Map
- Board

Bottom nav items exist for:

- Home
- Map
- Board
- Chat
- Collection

Chat and Collection screens are not implemented yet. They currently should remain placeholder routing until the user asks to build them.

## Theme And Icons

Files:

- `lib/core/theme/app_colors.dart`
- `lib/core/theme/app_theme.dart`
- `lib/core/theme/app_icons.dart`

Notes:

- Use existing theme tokens and `AppPalette` extension.
- Shared Material icons live in `app_icons.dart`.
- Bottom nav names should stay aligned with `AppBottomNavItem`.
- Collection icon currently uses `Icons.inventory_2`.

## Stitch References

Use Stitch exports as visual source of truth:

- Login/onboarding references:
  - `stitch_export/Onboarding00.html`
  - `stitch_export/OnboardingPage.html`
- Home:
  - `stitch_export/Home.html`
- Board:
  - `stitch_export/Board.html`
- Chatbot:
  - `stitch_export/Chat-Modal.html`
- Chat list/room references for later:
  - `stitch_export/GroupchatList.html`
  - `stitch_export/GroupchatRoom.html`
- Wishlist/cart references for later:
  - `stitch_export/Wishlist.html`
  - `stitch_export/Cart.html`

## Current Caveats

- Most feature data is mock/local and intentionally replaceable.
- Survey content is placeholder only, not product logic.
- No final recommendation behavior exists.
- No backend/API contracts should be inferred from current mock models.
- Kakao Map is the rendering baseline, but local mock data remains the app source of truth for now.
- Widget tests may show Flutter HTTP image test warnings; they are acceptable if tests pass.

## Likely Next Screens

Potential future implementation work:

- Chat list and chat room from `GroupchatList.html` and `GroupchatRoom.html`.
- Collection/Wishlist from `Wishlist.html`.
- Cart from `Cart.html`.
- Post writing screen/modal for Board `+` button.
- Real notification data once backend contracts exist.

## Last Known Validation

Before this memory file was created, the codebase had recently passed:

- `flutter analyze`
- `flutter test`

Run validation again after any Dart or Flutter code changes.
