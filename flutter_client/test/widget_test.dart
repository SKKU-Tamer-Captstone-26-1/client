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
}
