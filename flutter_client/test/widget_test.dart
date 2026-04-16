import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_client/main.dart';

void main() {
  testWidgets('renders the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const OnTheBlockApp());

    expect(find.text('ON THE BLOCK'), findsOneWidget);
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('SAFE & SECURE'), findsOneWidget);
  });

  testWidgets('toggles between light and dark themes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const OnTheBlockApp());

    expect(find.byTooltip('Switch to dark mode'), findsOneWidget);

    await tester.tap(find.byTooltip('Switch to dark mode'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Switch to light mode'), findsOneWidget);
  });

  testWidgets('moves from login to survey intro and survey steps', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const OnTheBlockApp());

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(find.text('Start Survey'), findsOneWidget);
    expect(
      find.text('Take a quick survey to get better liquor recommendations.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Start Survey'));
    await tester.pumpAndSettle();

    expect(find.text('STEP 1 OF 10'), findsOneWidget);
    expect(
      find.text('How familiar are you with premium liquor?'),
      findsOneWidget,
    );
    expect(
      find.text('Select at least one answer to continue.'),
      findsOneWidget,
    );
    expect(find.text('Next'), findsNothing);

    await tester.tap(find.text('Beginner'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('STEP 2 OF 10'), findsOneWidget);
    expect(find.text('Which categories interest you most?'), findsOneWidget);
  });

  testWidgets('shows home screen after skipping survey', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const OnTheBlockApp());

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

    expect(find.text('OnTheBlock'), findsOneWidget);
    expect(find.text('The Golden Old Fashioned'), findsOneWidget);
    expect(find.text('Local Establishments'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.text('Outdoor Vaults'), findsOneWidget);
    expect(find.text('Neighborhood Buzz'), findsOneWidget);
  });

  testWidgets('navigates from home to map screen', (WidgetTester tester) async {
    await tester.pumpWidget(const OnTheBlockApp());

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    expect(find.text('Search nearby bars and bottle shops'), findsOneWidget);
    expect(find.text('Kakao Map baseline'), findsOneWidget);
    expect(find.text('The Oak & Barrel'), findsWidgets);
  });

  testWidgets('navigates from home to board screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const OnTheBlockApp());

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Board'));
    await tester.pumpAndSettle();

    expect(find.text('#AllPosts'), findsOneWidget);
    expect(
      find.text('Hidden Gem: Old Soul Cask Strength Batch #4'),
      findsOneWidget,
    );
    expect(
      find.text('Looking for a recommendation: Peated scotch under \$100?'),
      findsOneWidget,
    );
  });
}
