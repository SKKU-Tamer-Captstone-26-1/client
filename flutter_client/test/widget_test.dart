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
}
