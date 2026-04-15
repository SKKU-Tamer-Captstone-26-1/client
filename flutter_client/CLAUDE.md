# CLAUDE.md

This file provides repository-level guidance for Claude when working in the `client` repository of the On the Block project.

## Repository Purpose

This repository contains the Flutter client for On the Block, a hyperlocal community platform for liquor enthusiasts.

The Flutter app is a thin client. It is responsible for:
- rendering UI
- navigation
- local UI state
- form input
- temporary local mock data
- calling backend APIs and realtime interfaces when available

The Flutter app must not become the home of backend business logic.

## Current Product Scope

At the current stage, this client includes the following major surfaces:

1. Google Login
2. Preference Survey with 10 items across 10 screens
3. Home
4. Modal chatbot entry points from Home and Board
5. Map
6. Board
7. Chat
8. Collection, including Wishlist and Cart

Do not invent additional major product surfaces unless explicitly requested.

## Current Development Stage

Shared cross-service API contracts are not finalized yet.

Until official contracts are defined:
- use local mock data
- use replaceable repository or service interfaces
- keep client-side data models minimal
- do not present assumed backend behavior as confirmed architecture

Do not hard-code speculative backend rules into the Flutter client.

## Design Source of Truth

Stitch designs and the repository design documentation are the visual source of truth.

Do not redesign approved screens without explicit instruction.

The intended visual identity is dual-mode:
- light mode should feel warm, approachable, and community-oriented
- dark mode should feel premium, focused, and suitable for liquor exploration and reviews

## Design Principles

Preserve the following design rules during implementation:

- Use Public Sans consistently for headline, body, and label text.
- Maintain rounded, friendly geometry across interactive elements.
- Prefer surface variation, subtle borders, and restrained elevation over heavy shadows.
- Use primary orange carefully in dark mode to avoid visual fatigue.
- Maintain strong contrast on dark surfaces for readability.
- Keep premium detail views structured and clean.
- Do not introduce playful or inconsistent typography.

## Client Architecture Constraints

The Flutter client must remain a thin client.

Allowed in this repository:
- UI composition
- presentation logic
- input handling
- view state
- loading, empty, and error state handling
- temporary mocks
- adapter layers for future API integration

Not allowed in this repository unless explicitly approved:
- recommendation computation
- ranking logic
- chat delivery guarantees
- cross-service business orchestration
- backend authority decisions
- hidden domain rules that belong to server-side services

## Implementation Philosophy

Prefer:
- reusable components over duplicated screen-local widgets
- shared design tokens over ad hoc styling
- minimal, scoped changes
- feature-oriented organization
- replaceable abstractions for future backend integration

Avoid:
- broad rewrites without need
- speculative backend assumptions
- one-off styling that bypasses shared tokens
- large monolithic screen files when reusable composition is possible

## Quality Rules

Before considering a task complete:
- preserve Stitch and design intent
- keep the client thin
- avoid undocumented backend assumptions
- maintain clean component boundaries
- ensure new code is readable and replaceable

When uncertain, prefer the more conservative implementation that preserves future replaceability.

## Communication Rules

Be explicit about assumptions.
Separate confirmed facts from temporary local decisions.
Do not claim backend behavior is final when it is still mocked or inferred.

For large analyses or design reasoning, prefer markdown documentation over oversized terminal output.