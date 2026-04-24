# AGENTS.md

This file defines repository-specific working instructions for coding agents operating in the `client` repository.

## Purpose

The goal of this repository is to implement the Flutter client from Stitch designs and project design documentation, while keeping the client thin, modular, and ready for future backend integration.

This file is execution-oriented.
For higher-level reasoning and repository philosophy, follow `CLAUDE.md`.

## Working Model

This repository is currently in a UI-first, contract-later stage.

That means:
- shared cross-service API contracts are not finalized
- mock-driven development is allowed and expected
- local interfaces should remain replaceable
- backend behavior must not be invented as if it were already confirmed

## Visual Source of Truth

Treat the following as the visual source of truth:
- Stitch designs
- project `Design.md`

Do not redesign approved screens.
Do not introduce new visual systems that conflict with these sources.

## Current App Scope

Implement only the currently defined client surfaces unless explicitly instructed otherwise:

- Google Login
- 10-screen preference survey
- Home
- modal chatbot from Home and Board
- Map
- Board
- Chat
- Collection with Wishlist and Cart

## Client Responsibilities

The Flutter client may handle:
- screen rendering
- navigation
- user input
- local presentation state
- local UI feedback
- temporary mock data
- API adapter and repository interfaces
- realtime event display when integrated later

The Flutter client must not own:
- recommendation logic
- ranking decisions
- business-critical validation
- server authority rules
- chat consistency guarantees
- hidden cross-service orchestration

## Recommended Project Shape

Prefer a feature-oriented structure.

Recommended direction:

- `lib/core/`
  - theme
  - constants
  - utilities
  - shared foundations

- `lib/features/`
  - auth
  - preference_survey
  - home
  - chatbot
  - map
  - board
  - chat
  - collection

- `lib/shared/`
  - reusable widgets
  - shared presentation components

Do not mix unrelated feature logic into a generic dumping ground.

## Design System Implementation Rules

Build shared design primitives before pushing too much screen-specific styling.

Agents should prioritize:
- centralized color tokens
- typography tokens
- radius and spacing tokens
- reusable buttons
- reusable cards
- reusable chips
- reusable inputs
- reusable modal and bottom-sheet patterns

Preserve the following design behavior:
- Public Sans throughout the app
- rounded and pill-shaped interactive geometry
- subtle borders and restrained elevation
- careful use of primary orange in dark mode
- strong readability on dark surfaces

Do not use sharp corners for interactive elements.
Do not rely on heavy shadows.
Do not create visually inconsistent screen-local components when a shared component is more appropriate.

## Theme Rules

This app is not simply light mode plus dark mode.

The modes have distinct product intent:
- light mode supports community warmth and approachability
- dark mode supports premium liquor browsing and focused reading

Agents must preserve that distinction during implementation.

## Mock and Integration Rules

Since official APIs are not finalized yet:

- create local mock models only when needed
- keep models minimal and easy to replace
- prefer repository or service interfaces over direct hard-coded screen data
- avoid spreading mock logic across multiple unrelated layers
- clearly separate temporary mock implementations from future integration points

Do not fabricate final API shapes unless the repository explicitly defines them.

## Chat and Chatbot Separation

Treat chat and chatbot as separate features.

- `chat` is user-to-user communication
- `chatbot` is a modal assistant interaction surface

Do not merge them into one feature only because both involve message-like UI.

## Chat Feature Rules

Apply the following stable rules for chat work:

- Keep chat structure split into:
  - `presentation/` for widgets and screen state
  - `models/` for UI-facing chat models
  - `data/` for repositories, gRPC remote data sources, and generated stubs
- Do not import generated proto classes directly into chat presentation widgets.
- Keep mapper/adapters between proto DTOs and UI models in the data layer.

### Proto and Stub Usage

- Shared proto source for chat is `on-the-block-infra/proto/chat/v1/chat.proto`.
- Generated Dart stubs under `lib/features/chat/data/grpc_gen/` are build artifacts.
- Never hand-edit generated files; regenerate them when proto updates.

### gRPC Integration Constraints

- Keep endpoint config environment-driven (host/port/tls), not screen-specific.
- Keep remote data source and repository interfaces replaceable for mock/real switching.
- Do not duplicate backend validation in client logic.

### Rendering and Stream Behavior

- Render message lists from server order/cursors; do not fabricate ordering guarantees client-side.
- For deleted messages, always render placeholder behavior and do not expose original deleted payload fields.
- Treat stream disconnects and status errors as server-driven state changes; reflect them in UI without re-implementing membership rules.

### Backend-Owned Membership Rules

- Rejoin/removal/deactivation/owner moderation behavior is backend authority.
- Client must not locally override server outcomes for LEFT/REMOVED/inactive room cases.

## External Package Policy

External UI packages may be used only when they accelerate implementation without taking ownership of core product architecture.

For chat UI packages:
- they may be evaluated as accelerators for baseline chat presentation
- they must not define the domain model of the app
- they must not dictate app-wide interaction patterns outside their bounded use case

Keep adapters around external packages when reasonable so they remain replaceable.

## Change Policy

Prefer small, scoped, understandable changes.

Do:
- implement one feature area at a time
- preserve replaceability
- favor composition over duplication
- keep styling aligned with shared tokens

Do not:
- rewrite large parts of the app without cause
- mix backend assumptions into presentation code
- add unrelated refactors while implementing a feature
- create oversized screen files when smaller widgets are more maintainable

## Completion Criteria

A change is complete only when it satisfies all of the following:

- it aligns with Stitch and `Design.md`
- it keeps Flutter as a thin client
- it avoids unconfirmed backend assumptions
- it uses reusable structure where appropriate
- it leaves a clear path for future backend integration

## Default Behavior When Information Is Missing

When required information is missing:
- do not invent hidden business rules
- choose the most conservative UI-only implementation
- use mock data and replaceable interfaces
- document assumptions clearly in code comments or markdown when needed

The default priority is:
1. preserve visual truth
2. preserve thin-client architecture
3. preserve future replaceability
4. avoid speculative backend coupling
