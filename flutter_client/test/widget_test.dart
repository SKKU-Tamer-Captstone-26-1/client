import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_client/core/theme/app_theme.dart';
import 'package:flutter_client/features/auth/data/auth_remote_data_source.dart';
import 'package:flutter_client/features/auth/data/grpc_gen/auth/v1/auth.pbgrpc.dart';
import 'package:flutter_client/features/auth/providers/auth_repository_provider.dart';
import 'package:flutter_client/features/board/data/board_repository.dart';
import 'package:flutter_client/features/board/data/grpc_gen/board/v1/board.pb.dart'
    show BoardType;
import 'package:flutter_client/features/board/data/mock_board_data.dart';
import 'package:flutter_client/features/board/models/board_models.dart';
import 'package:flutter_client/features/board/providers/board_repository_provider.dart';
import 'package:flutter_client/features/chat/data/chat_push_service.dart';
import 'package:flutter_client/features/chat/data/chat_repository.dart';
import 'package:flutter_client/features/chat/data/grpc_gen/chat/v1/chat.pb.dart';
import 'package:flutter_client/features/chat/data/mock_groupchat_data.dart';
import 'package:flutter_client/features/chat/models/groupchat_models.dart';
import 'package:flutter_client/features/chat/presentation/widgets/chat_input_bar.dart';
import 'package:flutter_client/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter_client/features/preference_survey/data/survey_grpc_client.dart';
import 'package:flutter_client/features/preference_survey/data/survey_grpc_endpoint.dart';
import 'package:flutter_client/features/preference_survey/models/survey_question.dart';
import 'package:flutter_client/features/recommendation/data/recommendation_repository.dart';
import 'package:flutter_client/features/recommendation/models/recommendation_models.dart';
import 'package:flutter_client/main.dart';

void main() {
  testWidgets('renders the login screen', (WidgetTester tester) async {
    await _pumpApp(tester);

    expect(find.text('ON THE BLOCK'), findsOneWidget);
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('SAFE & SECURE'), findsOneWidget);
  });

  testWidgets('toggles between light and dark themes', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    expect(find.byTooltip('Switch to dark mode'), findsOneWidget);

    await tester.tap(find.byTooltip('Switch to dark mode'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Switch to light mode'), findsOneWidget);
  });

  testWidgets('restores persisted dark theme', (WidgetTester tester) async {
    await _pumpApp(
      tester,
      initialPreferences: const {'on_the_block.theme_mode': 'dark'},
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('Switch to light mode'), findsOneWidget);
  });

  testWidgets('moves from login to survey intro and survey steps', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(find.text('Start Survey'), findsOneWidget);
    expect(
      find.text('Take a quick survey to get better liquor recommendations.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Start Survey'));
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
    expect(find.text('본인이 어느 정도로 술을 좋아하시나요?'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.text('입문자'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Previous'), findsOneWidget);
    expect(find.text('가장 끌리는 주류 카테고리를 모두 선택해 주세요.'), findsOneWidget);
  });

  testWidgets('shows home screen after skipping survey', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    expect(find.text('OnTheBlock'), findsOneWidget);
    expect(
      find.text('Personalized picks start with your survey'),
      findsOneWidget,
    );
    expect(find.text('Local Establishments'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.text('Outdoor Vaults'), findsOneWidget);
    expect(find.text('Neighborhood Buzz'), findsOneWidget);
  });

  testWidgets('shows personalized beverage recommendations on home', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository();

    await _pumpApp(tester, recommendationRepository: repository);

    await _signInAndSkipOnboarding(tester);
    await tester.pump();

    expect(find.text('TOP MATCH'), findsOneWidget);
    expect(find.text('Recommended for you'), findsOneWidget);
    expect(find.text('예시 버번'), findsWidgets);
    expect(find.text('Example Bourbon'), findsWidgets);
    expect(find.text('Matches your vanilla/caramel preference.'), findsWidgets);
    expect(find.textContaining('%'), findsNothing);
    expect(repository.profileStatusCalls, 1);
    expect(repository.beverageRecommendationCalls, 1);
    expect(repository.lastAuthToken, 'access-token');
    expect(repository.lastCategory, '');
    expect(repository.lastLimit, 10);
    expect(repository.lastBudgetMode, RecommendationBudgetMode.soft);
    expect(
      repository.events.single.eventType,
      RecommendationEventKind.impression,
    );
    expect(
      repository.events.single.metadata.keys,
      unorderedEquals([
        'client_platform',
        'app_version',
        'surface',
        'session_id_hash',
        'list_position',
        'visible_ms',
        'source',
      ]),
    );
    expect(
      repository.events.single.metadata['surface'],
      'home_recommendations',
    );
    expect(
      repository.events.single.metadata['source'],
      'recommendation_service',
    );
    expect(
      repository.events.single.idempotencyKey,
      contains(':rec-result-1:impression'),
    );
  });

  testWidgets('renders long recommendation metadata without card overflow', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository(
      recommendations: const [
        BeverageRecommendation(
          rank: 1,
          resultId: 'rec-result-laphroaig',
          beverageId: 'bev-laphroaig',
          nameKo: '라프로익 10년',
          nameEn: 'Laphroaig 10 Year Old',
          category: 'whiskey',
          score: 0.91,
          reasonCodes: [
            'CATEGORY_MATCH',
            'SMOKY_PEATED_MATCH',
            'BEGINNER_FRIENDLY',
          ],
          explanation:
              '라프로익 10년 is recommended because your taste profile leans smoky and peated.',
          style: 'single malt scotch whisky',
        ),
        BeverageRecommendation(
          rank: 2,
          resultId: 'rec-result-jameson',
          beverageId: 'bev-jameson',
          nameKo: '제임슨 아이리시 위스키',
          nameEn: 'Jameson Irish Whiskey',
          category: 'whiskey',
          score: 0.86,
          reasonCodes: ['BEGINNER_FRIENDLY', 'CATEGORY_MATCH', 'SMOOTH_FINISH'],
          explanation:
              'Jameson Irish Whiskey is recommended because it is smooth and approachable.',
          style: 'irish whiskey',
        ),
      ],
    );

    await _pumpApp(tester, recommendationRepository: repository);
    await _signInAndSkipOnboarding(tester);
    await tester.pump();

    expect(find.text('라프로익 10년'), findsWidgets);
    expect(find.text('Laphroaig 10 Year Old'), findsOneWidget);
    expect(find.text('single malt scotch whisky'), findsOneWidget);
    expect(find.text('Category Match'), findsWidgets);
    expect(find.textContaining('recommended because'), findsWidgets);
  });

  testWidgets('records recommendation save and dismiss events from cards', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository();

    await _pumpApp(tester, recommendationRepository: repository);
    await _signInAndSkipOnboarding(tester);
    await tester.pump();

    await tester.tap(find.byTooltip('Save recommendation').first);
    await tester.pump();
    await tester.tap(find.byTooltip('Dismiss recommendation').first);
    await tester.pump();

    expect(
      repository.events.map((event) => event.eventType),
      containsAllInOrder([
        RecommendationEventKind.impression,
        RecommendationEventKind.save,
        RecommendationEventKind.dismiss,
      ]),
    );
  });

  testWidgets('records recommendation click events from cards', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository();

    await _pumpApp(tester, recommendationRepository: repository);
    await _signInAndSkipOnboarding(tester);
    await tester.pump();

    await tester.tap(find.text('예시 버번').last);
    await tester.pump();

    expect(
      repository.events.map((event) => event.eventType),
      containsAllInOrder([
        RecommendationEventKind.impression,
        RecommendationEventKind.click,
      ]),
    );
    expect(
      repository.events.last.idempotencyKey,
      contains(':rec-result-1:click'),
    );
  });

  testWidgets('shows saved-survey missing profile without requesting beverages', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository(
      profileStatus: RecommendationProfileStatus.missing,
    );

    await _pumpApp(tester, recommendationRepository: repository);
    await _signInAndSkipOnboarding(tester);

    expect(find.text('Recommendation profile not ready'), findsOneWidget);
    expect(
      find.text(
        'Your survey is saved, but the recommendation profile has not been generated yet.',
      ),
      findsOneWidget,
    );
    expect(repository.profileStatusCalls, 1);
    expect(repository.beverageRecommendationCalls, 0);
  });

  testWidgets(
    'shows pending recommendation profile without requesting beverages',
    (WidgetTester tester) async {
      final repository = _FakeRecommendationRepository(
        profileStatus: RecommendationProfileStatus.pendingGeneration,
      );

      await _pumpApp(tester, recommendationRepository: repository);
      await _signInAndSkipOnboarding(tester);

      expect(find.text('Building your picks'), findsOneWidget);
      expect(
        find.text('Your recommendations are being prepared.'),
        findsOneWidget,
      );
      expect(repository.profileStatusCalls, 1);
      expect(repository.beverageRecommendationCalls, 0);
    },
  );

  testWidgets(
    'shows failed recommendation profile without requesting beverages',
    (WidgetTester tester) async {
      final repository = _FakeRecommendationRepository(
        profileStatus: RecommendationProfileStatus.failedGeneration,
      );

      await _pumpApp(tester, recommendationRepository: repository);
      await _signInAndSkipOnboarding(tester);

      expect(find.text('Profile refresh failed'), findsOneWidget);
      expect(
        find.text('Your recommendation profile could not be generated.'),
        findsOneWidget,
      );
      expect(repository.profileStatusCalls, 1);
      expect(repository.beverageRecommendationCalls, 0);
    },
  );

  testWidgets('shows empty recommendations state for active empty profile', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRecommendationRepository(
      recommendations: const <BeverageRecommendation>[],
    );

    await _pumpApp(tester, recommendationRepository: repository);
    await _signInAndSkipOnboarding(tester);

    expect(find.text('No recommendations yet'), findsOneWidget);
    expect(
      find.text('Your profile is ready, but there are no bottles to show.'),
      findsOneWidget,
    );
    expect(repository.profileStatusCalls, 1);
    expect(repository.beverageRecommendationCalls, 1);
  });

  testWidgets('shows taste profile status on profile screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(
      tester,
      recommendationRepository: _FakeRecommendationRepository(),
    );

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pumpAndSettle();

    expect(find.text('Taste Profile'), findsOneWidget);
    expect(find.text('Ready for recommendations'), findsOneWidget);
    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Light mode'), findsOneWidget);

    await tester.ensureVisible(find.text('Appearance'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();

    expect(find.text('Dark mode'), findsOneWidget);
  });

  testWidgets(
    'shows saved-survey profile generation status on profile screen',
    (WidgetTester tester) async {
      await _pumpApp(
        tester,
        recommendationRepository: _FakeRecommendationRepository(
          profileStatus: RecommendationProfileStatus.missing,
        ),
      );

      await _signInAndSkipOnboarding(tester);

      await tester.tap(find.byIcon(Icons.account_circle));
      await tester.pumpAndSettle();

      expect(find.text('Taste Profile'), findsOneWidget);
      expect(
        find.text('Survey saved; recommendation profile not ready'),
        findsOneWidget,
      );
    },
  );

  testWidgets('navigates from home to map screen', (WidgetTester tester) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    expect(find.text('Search nearby bars and bottle shops'), findsOneWidget);
    expect(find.text('Kakao Map baseline'), findsOneWidget);
    expect(find.text('The Oak & Barrel'), findsWidgets);
    expect(find.byIcon(Icons.chat), findsNothing);
  });

  testWidgets('shows chat bottom nav unread count bubble', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    expect(find.text('3'), findsOneWidget);
    expect(find.text('7'), findsNothing);
  });

  testWidgets('navigates from home to board screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

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

  testWidgets('navigates from home to groupchat list screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle();

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Nearby Board'), findsOneWidget);
    expect(find.text('View Board'), findsOneWidget);
    expect(find.text('3 Unread'), findsOneWidget);
    expect(find.text('Westside Bourbon Enthusiasts'), findsOneWidget);
    expect(find.text('Downtown Whiskey Circle'), findsOneWidget);
    expect(find.byTooltip('New Chat'), findsOneWidget);

    await tester.tap(find.text('View Board'));
    await tester.pumpAndSettle();

    expect(find.text('#AllPosts'), findsOneWidget);
  });

  testWidgets('creates general chat from chat list', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('New Chat'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Staging General Chat');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Back to messages'), findsOneWidget);
    expect(find.text('Staging General Chat'), findsOneWidget);
  });

  testWidgets('opens groupchat room as full screen detail', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Westside Bourbon Enthusiasts'));
    await tester.pumpAndSettle();
    await tester.pump();

    expect(find.byTooltip('Back to messages'), findsOneWidget);
    expect(find.text('18 members'), findsOneWidget);
    expect(
      find.text('Found that limited batch at the corner shop!'),
      findsOneWidget,
    );
    expect(find.text('Type a message...'), findsOneWidget);
    expect(find.text('Chat'), findsNothing);

    await tester.tap(find.byTooltip('Back to messages'));
    await tester.pumpAndSettle();

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('1 Unread'), findsOneWidget);
  });

  testWidgets('opens chat room from chat push after survey gate', (
    WidgetTester tester,
  ) async {
    await _pumpApp(
      tester,
      chatPushService: _FakeChatPushService(
        openedMessageOnStart: const ChatPushMessage(roomId: 'mock-room-1'),
      ),
    );

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(find.text('Start Survey'), findsOneWidget);
    expect(find.text('Westside Bourbon Enthusiasts'), findsNothing);

    await _skipSurveyAndLocation(tester);

    expect(find.byTooltip('Back to messages'), findsOneWidget);
    expect(find.text('Westside Bourbon Enthusiasts'), findsOneWidget);
  });

  testWidgets('navigates to collection wishlist and cart tabs', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.text('Collection'));
    await tester.pumpAndSettle();

    expect(find.text('Wishlist'), findsWidgets);
    expect(find.text('Rare Barrel Reserve Bourbon'), findsOneWidget);
    expect(
      find.text('Saved bottles and local picks for later.'),
      findsOneWidget,
    );
    expect(find.text('Low stock'), findsNothing);
    expect(find.text('Saved'), findsNothing);
    expect(find.text('Recommendation options'), findsNothing);

    await tester.tap(
      find.byKey(const ValueKey('toggle-Rare Barrel Reserve Bourbon')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Recommendation options'), findsOneWidget);
    expect(find.text('The Oak Barrel Spirits'), findsWidgets);
    expect(find.text('0.8 mi from you'), findsOneWidget);
    expect(find.text('\$78.00'), findsWidgets);
    expect(find.text('Westside Bottle Room'), findsOneWidget);
    expect(find.text('1.4 mi from you'), findsOneWidget);
    expect(find.text('\$74.50'), findsOneWidget);
    expect(find.text('Downtown Reserve Market'), findsOneWidget);
    expect(find.text('2.1 mi from you'), findsOneWidget);
    expect(find.text('\$81.25'), findsOneWidget);

    await tester.tap(
      find.byKey(const ValueKey('toggle-Rare Barrel Reserve Bourbon')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Recommendation options'), findsNothing);

    await tester.tap(find.text('Cart'));
    await tester.pumpAndSettle();

    expect(find.text('Small Batch Oak Bourbon'), findsOneWidget);
    expect(find.text('The Oak Barrel Spirits'), findsOneWidget);
    expect(find.text('Proceed to Checkout'), findsOneWidget);
  });

  testWidgets('opens chatbot modal from home but not map', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.byIcon(Icons.chat));
    await tester.pumpAndSettle();

    expect(find.text('Chat with Neighborhood Guide'), findsOneWidget);
    expect(
      find.textContaining('Looking for a specific bottle'),
      findsOneWidget,
    );
    expect(find.text('Type your message...'), findsOneWidget);

    await tester.tap(find.byTooltip('Close'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    expect(find.text('Chat with Neighborhood Guide'), findsNothing);
    expect(find.byIcon(Icons.chat), findsNothing);
  });

  testWidgets('board keeps plus for writing and has separate chatbot button', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);
    await tester.tap(find.text('Board'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Write post'), findsOneWidget);
    expect(find.byTooltip('Chat with Neighborhood Guide'), findsOneWidget);
    expect(find.byTooltip('Open board chat'), findsWidgets);

    await tester.tap(find.byTooltip('Chat with Neighborhood Guide'));
    await tester.pumpAndSettle();

    expect(find.text('Chat with Neighborhood Guide'), findsOneWidget);
  });

  testWidgets('opens board-linked chat from board post', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);
    await tester.tap(find.text('Board'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Open board chat').first);
    await tester.pumpAndSettle();

    expect(find.byTooltip('Back to messages'), findsOneWidget);
    expect(
      find.text('Hidden Gem: Old Soul Cask Strength Batch #4'),
      findsOneWidget,
    );
  });

  testWidgets('opens notification screen and navigates to board target', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Recent activity'), findsOneWidget);
    expect(find.text('New post in your board'), findsOneWidget);
    expect(find.text('Rare bourbon drop nearby'), findsOneWidget);
    expect(find.text('New reply on your board post'), findsOneWidget);

    await tester.tap(find.text('New post in your board'));
    await tester.pumpAndSettle();

    expect(find.text('#AllPosts'), findsOneWidget);
    expect(
      find.text('Hidden Gem: Old Soul Cask Strength Batch #4'),
      findsOneWidget,
    );

    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    expect(find.text('Search nearby bars and bottle shops'), findsOneWidget);
  });

  testWidgets('opens search as a full screen from top app bar', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await _signInAndSkipOnboarding(tester);

    await tester.tap(find.byTooltip('Search'));
    await tester.pumpAndSettle();

    expect(find.text('Search bottles, stores, boards'), findsOneWidget);
    expect(find.text('Suggested searches'), findsOneWidget);
    expect(find.text('Bourbon near me'), findsOneWidget);
    expect(find.text('Quick results'), findsOneWidget);
    expect(find.text('The Oak & Barrel'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Search bottles, stores, boards'), findsNothing);
    expect(
      find.text('Personalized picks start with your survey'),
      findsOneWidget,
    );
  });

  testWidgets('typing indicator hides without typing users', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_typingIndicatorApp(const <String?>[]));

    expect(find.textContaining('typing'), findsNothing);
  });

  testWidgets('typing indicator shows one and multiple user labels', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_typingIndicatorApp(const <String?>['Alex']));
    expect(find.text('Alex is typing...'), findsOneWidget);

    await tester.pumpWidget(_typingIndicatorApp(const <String?>[null]));
    expect(find.text('Someone is typing...'), findsOneWidget);

    await tester.pumpWidget(
      _typingIndicatorApp(const <String?>['Alex', 'Sam', 'Taylor']),
    );
    expect(find.text('3 people are typing...'), findsOneWidget);
  });

  testWidgets('chat input bar disables blank sends and clears after send', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    var sentCount = 0;

    await tester.pumpWidget(
      _chatInputBarApp(
        controller: controller,
        onSend: () async {
          sentCount++;
          controller.clear();
        },
      ),
    );

    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.send))
          .onPressed,
      isNull,
    );

    await tester.enterText(find.byType(TextField), '   ');
    await tester.pump();

    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.send))
          .onPressed,
      isNull,
    );

    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pump();

    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.send))
          .onPressed,
      isNotNull,
    );

    await tester.tap(find.byTooltip('Send message'));
    await tester.pumpAndSettle();

    expect(sentCount, 1);
    expect(controller.text, isEmpty);
    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.send))
          .onPressed,
      isNull,
    );
  });
}

Widget _typingIndicatorApp(List<String?> typingNicknames) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: TypingIndicator(typingNicknames: typingNicknames)),
  );
}

Widget _chatInputBarApp({
  required TextEditingController controller,
  required Future<void> Function() onSend,
}) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(
      body: Column(
        children: [
          const Spacer(),
          ChatInputBar(
            controller: controller,
            onSend: onSend,
            onPickAttachment: () {},
          ),
        ],
      ),
    ),
  );
}

Future<void> _signInAndSkipOnboarding(WidgetTester tester) async {
  await tester.tap(find.text('Continue with Google'));
  await tester.pumpAndSettle();
  await _skipSurveyAndLocation(tester);
}

Future<void> _skipSurveyAndLocation(WidgetTester tester) async {
  await tester.tap(find.text('SKIP'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Skip'));
  await tester.pumpAndSettle();
}

Future<void> _pumpApp(
  WidgetTester tester, {
  ChatPushService? chatPushService,
  RecommendationRepository? recommendationRepository,
  Map<String, Object> initialPreferences = const {},
}) {
  SharedPreferences.setMockInitialValues(initialPreferences);
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRemoteDataSourceProvider.overrideWithValue(
          _FakeAuthRemoteDataSource(),
        ),
        surveyGrpcClientProvider.overrideWithValue(_FakeSurveyGrpcClient()),
        boardRepositoryProvider.overrideWithValue(_FakeBoardRepository()),
      ],
      child: OnTheBlockApp(
        chatRepository: _FakeChatRepository(),
        chatPushService: chatPushService ?? _FakeChatPushService(),
        recommendationRepository: recommendationRepository,
        enableDefaultRecommendationRepository: false,
      ),
    ),
  );
}

class _FakeRecommendationRepository implements RecommendationRepository {
  _FakeRecommendationRepository({
    this.profileStatus = RecommendationProfileStatus.active,
    List<BeverageRecommendation> recommendations = const [
      BeverageRecommendation(
        rank: 1,
        resultId: 'rec-result-1',
        beverageId: 'bev-1',
        nameKo: '예시 버번',
        nameEn: 'Example Bourbon',
        category: 'whiskey',
        score: 0.91,
        reasonCodes: ['MATCHES_VANILLA_CARAMEL'],
        explanation: 'Matches your vanilla/caramel preference.',
        style: 'bourbon',
      ),
    ],
  }) : recommendations = List<BeverageRecommendation>.unmodifiable(
         recommendations,
       );

  final RecommendationProfileStatus profileStatus;
  final List<BeverageRecommendation> recommendations;
  final List<_RecordedRecommendationEvent> events =
      <_RecordedRecommendationEvent>[];
  int profileStatusCalls = 0;
  int beverageRecommendationCalls = 0;
  String lastAuthToken = '';
  String lastCategory = '';
  int lastLimit = 0;
  RecommendationBudgetMode? lastBudgetMode;

  @override
  Future<RecommendationProfile> getProfileStatus({
    required String authToken,
  }) async {
    profileStatusCalls += 1;
    lastAuthToken = authToken;
    return RecommendationProfile(
      status: profileStatus,
      profileRevision: 1,
      surveyResponseId: 'survey-1',
    );
  }

  @override
  Future<BeverageRecommendationPage> getBeverageRecommendations({
    required String authToken,
    String category = '',
    int limit = 10,
    RecommendationBudgetMode budgetMode = RecommendationBudgetMode.soft,
  }) async {
    beverageRecommendationCalls += 1;
    lastAuthToken = authToken;
    lastCategory = category;
    lastLimit = limit;
    lastBudgetMode = budgetMode;
    return BeverageRecommendationPage(
      requestId: 'rec-req-1',
      profileStatus: RecommendationProfileStatus.active,
      profileRevision: 1,
      recommendations: recommendations,
    );
  }

  @override
  Future<void> recordEvent({
    required String authToken,
    required String requestId,
    required String resultId,
    required RecommendationEventKind eventType,
    required String idempotencyKey,
    Map<String, Object> metadata = const <String, Object>{},
  }) async {
    events.add(
      _RecordedRecommendationEvent(
        authToken: authToken,
        requestId: requestId,
        resultId: resultId,
        eventType: eventType,
        idempotencyKey: idempotencyKey,
        metadata: Map<String, Object>.unmodifiable(metadata),
      ),
    );
  }

  @override
  Future<void> dispose() async {}
}

class _RecordedRecommendationEvent {
  const _RecordedRecommendationEvent({
    required this.authToken,
    required this.requestId,
    required this.resultId,
    required this.eventType,
    required this.idempotencyKey,
    required this.metadata,
  });

  final String authToken;
  final String requestId;
  final String resultId;
  final RecommendationEventKind eventType;
  final String idempotencyKey;
  final Map<String, Object> metadata;
}

class _FakeChatPushService implements ChatPushService {
  const _FakeChatPushService({this.openedMessageOnStart});

  final ChatPushMessage? openedMessageOnStart;

  @override
  Future<void> start({
    required String authToken,
    required ChatRepository chatRepository,
    required Future<void> Function(ChatPushMessage message)
    onForegroundChatMessage,
    required Future<void> Function(ChatPushMessage message) onOpenedChatMessage,
  }) async {
    final openedMessage = openedMessageOnStart;
    if (openedMessage != null) {
      await onOpenedChatMessage(openedMessage);
    }
  }

  @override
  Future<void> unregister({
    required String authToken,
    required ChatRepository chatRepository,
  }) async {}

  @override
  Future<void> dispose() async {}
}

class _FakeSurveyGrpcClient extends SurveyGrpcClient {
  _FakeSurveyGrpcClient()
    : super(
        const SurveyGrpcEndpoint(host: 'localhost', port: 0, useTls: false),
      );

  @override
  Future<List<SurveyQuestion>> fetchQuestions() async {
    return const [
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
            description: '새로운 술을 시도하는 걸 좋아해요.',
            icon: 'star',
          ),
        ],
      ),
      SurveyQuestion(
        id: 'q2',
        text: '가장 끌리는 주류 카테고리를 모두 선택해 주세요.',
        subtitle: '여러 개를 선택할 수 있어요.',
        isMultiSelect: true,
        options: [
          QuestionOption(
            value: 'whiskey',
            label: '위스키',
            description: 'Single Malt, Bourbon 등',
            icon: 'liquor',
          ),
          QuestionOption(
            value: 'wine',
            label: '와인',
            description: 'Red, White, Sparkling 등',
            icon: 'wine_bar',
          ),
        ],
      ),
      SurveyQuestion(
        id: 'q11',
        text: '좋아하는 향과 맛의 키워드를 3가지 골라주세요.',
        subtitle: '정확히 3가지를 선택해 주세요.',
        isMultiSelect: true,
        maxSelections: 3,
        options: [
          QuestionOption(
            value: 'vanilla_caramel',
            label: '#바닐라·카라멜',
            description: '달콤함',
            icon: 'cake',
          ),
          QuestionOption(
            value: 'citrus_berry',
            label: '#시트러스·베리',
            description: '상큼한 과일',
            icon: 'water_drop',
          ),
          QuestionOption(
            value: 'oak_woody',
            label: '#오크·우디',
            description: '나무향',
            icon: 'forest',
          ),
        ],
      ),
      SurveyQuestion(
        id: 'q12',
        text: '주로 생각하시는 1병당 구매 예산은 어느 정도인가요?',
        subtitle: '추천 상품의 가격 범위를 설정하는 데 사용돼요.',
        options: [
          QuestionOption(
            value: 'under_30k',
            label: '3만원 이하',
            description: '가성비 데일리',
            icon: 'savings',
          ),
        ],
      ),
    ];
  }
}

class _FakeBoardRepository implements BoardRepository {
  @override
  Future<List<BoardPost>> listPosts({
    String authToken = '',
    BoardType boardType = BoardType.BOARD_TYPE_UNSPECIFIED,
    String query = '',
    int page = 1,
    int pageSize = 20,
  }) async {
    return mockBoardPosts;
  }

  @override
  Future<BoardPost> getPost({
    required String postId,
    String authToken = '',
  }) async {
    return mockBoardPosts.firstWhere((post) => post.boardId == postId);
  }

  @override
  Future<BoardPost> createPost({
    required String authToken,
    required BoardType boardType,
    required String title,
    required String content,
    List<String> imageUrls = const [],
  }) async {
    return mockBoardPosts.first;
  }

  @override
  Future<void> deletePost({
    required String authToken,
    required String postId,
  }) async {}

  @override
  Future<({bool liked, int likeCount})> likePost({
    required String authToken,
    required String postId,
  }) async {
    final post = await getPost(postId: postId);
    return (liked: true, likeCount: post.favoriteCount + 1);
  }

  @override
  Future<List<BoardComment>> listComments({
    required String postId,
    String authToken = '',
    int page = 1,
    int pageSize = 50,
  }) async {
    return const <BoardComment>[];
  }

  @override
  Future<BoardComment> createComment({
    required String authToken,
    required String postId,
    required String content,
    String parentCommentId = '',
  }) async {
    return _fakeComment(postId: postId, content: content);
  }

  @override
  Future<({bool liked, int likeCount})> likeComment({
    required String authToken,
    required String commentId,
  }) async {
    return (liked: true, likeCount: 1);
  }

  @override
  Future<void> dispose() async {}

  BoardComment _fakeComment({
    String commentId = 'comment-1',
    String postId = 'mock-1',
    required String content,
  }) {
    return BoardComment(
      commentId: commentId,
      postId: postId,
      parentCommentId: '',
      authorId: 'user-1',
      authorNickname: 'WhiskyWizard',
      authorProfileImageUrl: '',
      content: content,
      likeCount: 0,
      isLiked: false,
      isDeleted: false,
      timeAgo: 'just now',
      replies: const <BoardComment>[],
    );
  }
}

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<GoogleLoginResponse> googleLogin() async {
    return GoogleLoginResponse()
      ..accessToken = 'access-token'
      ..refreshToken = 'refresh-token'
      ..isNewUser = false
      ..user = _fakeUser(onboardingCompleted: false);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String token) async {
    return RefreshTokenResponse()
      ..accessToken = 'refreshed-access-token'
      ..refreshToken = 'refreshed-refresh-token'
      ..user = _fakeUser(onboardingCompleted: false);
  }

  @override
  Future<UpdateProfileResponse> updateProfile(
    String userId,
    String nickname,
    String profileImageUrl,
  ) async {
    return UpdateProfileResponse()
      ..user = _fakeUser(
        nickname: nickname,
        profileImageUrl: profileImageUrl,
        onboardingCompleted: false,
      );
  }

  @override
  Future<GenerateProfileUploadUrlResponse> generateProfileUploadUrl(
    String userId,
  ) async {
    return GenerateProfileUploadUrlResponse()
      ..uploadUrl = 'https://example.com/upload'
      ..objectUrl = 'https://example.com/profile.png';
  }

  @override
  Future<UpdateNeighborhoodResponse> updateNeighborhood(
    String userId,
    String neighborhood,
  ) async {
    return UpdateNeighborhoodResponse()
      ..user = _fakeUser(
        neighborhood: neighborhood,
        onboardingCompleted: false,
      );
  }

  @override
  Future<CompleteOnboardingResponse> completeOnboarding(String userId) async {
    return CompleteOnboardingResponse()
      ..user = _fakeUser(onboardingCompleted: true);
  }

  @override
  Future<GetUserResponse> getUser(String userId) async {
    return GetUserResponse()
      ..userId = userId
      ..nickname = 'Alex Drinkwater'
      ..profileImageUrl = ''
      ..alcoholScore = 5;
  }

  @override
  Future<void> logout(String userId) async {}

  @override
  Future<void> dispose() async {}

  UserResponse _fakeUser({
    String nickname = 'Alex Drinkwater',
    String profileImageUrl = '',
    String neighborhood = '',
    required bool onboardingCompleted,
  }) {
    return UserResponse()
      ..userId = '11111111-1111-1111-1111-111111111111'
      ..email = 'alex.d@example.com'
      ..nickname = nickname
      ..profileImageUrl = profileImageUrl
      ..neighborhood = neighborhood
      ..surveyId = 'survey-1'
      ..onboardingCompleted = onboardingCompleted
      ..alcoholScore = 5
      ..points = 1250;
  }
}

class _FakeChatRepository implements ChatRepository {
  final Set<String> _readRoomIds = <String>{};
  int _createdRoomCount = 0;

  @override
  Future<GroupchatRoomSummary> createRoom({
    required String creatorUserId,
    required String title,
    String authToken = '',
  }) async {
    _createdRoomCount += 1;
    return GroupchatRoomSummary(
      roomId: 'created-room-$_createdRoomCount',
      title: title,
      memberSummary: '1 member',
      location: 'General',
      lastMessage: 'No messages yet',
      timeLabel: '',
      tags: const <String>['General'],
      avatarUrls: const <String>[],
    );
  }

  @override
  Future<GroupchatRoomSummary> getOrCreateBoardChatRoom({
    required String boardId,
    String? title,
    String? boardOwnerUserId,
    required String authToken,
  }) async {
    return GroupchatRoomSummary(
      roomId: 'board-room-$boardId',
      title: title ?? 'Board Chat',
      memberSummary: 'Board room',
      location: 'Board',
      lastMessage: 'No messages yet',
      timeLabel: '',
      tags: const <String>['Board'],
      avatarUrls: const <String>[],
    );
  }

  @override
  Future<void> joinRoom({
    required String roomId,
    required String userId,
  }) async {}

  @override
  Future<GroupchatMessage> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
    String authToken = '',
  }) async {
    return GroupchatMessage(
      messageId: 'sent-text',
      roomId: roomId,
      sequenceNo: 4,
      kind: GroupchatMessageKind.outgoing,
      text: content,
      timeLabel: 'Now',
    );
  }

  @override
  Future<AttachmentUploadTarget> createAttachmentUploadURL({
    required String userId,
    required String roomId,
    required String fileName,
    required String contentType,
    String authToken = '',
  }) async {
    return const AttachmentUploadTarget(
      objectName: 'test-object',
      uploadUrl: 'https://example.com/upload',
      fileUrl: 'https://example.com/file',
    );
  }

  @override
  Future<void> uploadToSignedUrl({
    required String uploadUrl,
    required String contentType,
    required List<int> bytes,
  }) async {}

  @override
  Future<GroupchatMessage> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
    String authToken = '',
  }) async {
    return GroupchatMessage(
      messageId: 'sent-image',
      roomId: roomId,
      sequenceNo: 4,
      kind: GroupchatMessageKind.outgoing,
      text: '[Image]',
      timeLabel: 'Now',
      contentType: GroupchatMessageContentType.image,
      imageUrl: imageUrl,
    );
  }

  @override
  Future<GroupchatMessage> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
    String authToken = '',
  }) async {
    return GroupchatMessage(
      messageId: 'sent-file',
      roomId: roomId,
      sequenceNo: 4,
      kind: GroupchatMessageKind.outgoing,
      text: '[File] $fileName',
      timeLabel: 'Now',
      contentType: GroupchatMessageContentType.file,
      fileUrl: fileUrl,
      fileName: fileName,
      fileContentType: contentType,
    );
  }

  @override
  Future<void> deleteMessage({
    required String roomId,
    required String messageId,
    required String ownerUserId,
  }) async {}

  @override
  Future<void> deactivateRoom({
    required String roomId,
    required String ownerUserId,
  }) async {}

  @override
  Future<ChatRoomPage> listMyRooms({
    required String userId,
    String authToken = '',
    int pageSize = 20,
    String pageToken = '',
  }) async {
    return ChatRoomPage(
      rooms: [
        for (final room in mockGroupchatRooms)
          _readRoomIds.contains(room.roomId)
              ? room.copyWith(unreadCount: 0)
              : room,
      ],
      nextPageToken: '',
    );
  }

  @override
  Future<List<GroupchatMessage>> getMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int beforeSequenceNo = 0,
    int limit = 20,
  }) async {
    return mockGroupchatMessages;
  }

  @override
  Future<void> markAsRead({
    required String roomId,
    required String userId,
    required int lastReadSequenceNo,
  }) async {}

  @override
  Future<void> markChatRoomRead({
    required String roomId,
    required String authToken,
  }) async {
    _readRoomIds.add(roomId);
  }

  @override
  Future<void> registerDeviceToken({
    required String deviceId,
    required String token,
    required DevicePlatform platform,
    required String authToken,
  }) async {}

  @override
  Future<void> unregisterDeviceToken({
    required String deviceId,
    required String authToken,
  }) async {}

  @override
  Stream<GroupchatMessage> streamMessages({
    required String roomId,
    required String userId,
    String authToken = '',
    int afterSequenceNo = 0,
  }) {
    return const Stream<GroupchatMessage>.empty();
  }

  @override
  Future<void> dispose() async {}
}
