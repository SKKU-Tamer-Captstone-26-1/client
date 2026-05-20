import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_client/core/theme/app_theme.dart';
import 'package:flutter_client/features/auth/data/auth_remote_data_source.dart';
import 'package:flutter_client/features/auth/data/grpc_gen/auth/v1/auth.pbgrpc.dart';
import 'package:flutter_client/features/auth/providers/auth_repository_provider.dart';
import 'package:flutter_client/features/chat/data/chat_push_service.dart';
import 'package:flutter_client/features/chat/data/chat_repository.dart';
import 'package:flutter_client/features/chat/data/grpc_gen/chat/v1/chat.pb.dart';
import 'package:flutter_client/features/chat/data/mock_groupchat_data.dart';
import 'package:flutter_client/features/chat/models/groupchat_models.dart';
import 'package:flutter_client/features/chat/presentation/widgets/chat_input_bar.dart';
import 'package:flutter_client/features/chat/presentation/widgets/typing_indicator.dart';
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

    expect(find.text('STEP 1 / 4'), findsOneWidget);
    expect(find.text('본인이 어느 정도로 술을 좋아하시나요?'), findsOneWidget);
    expect(find.text('솔직하게 선택해 주세요. 맞춤 추천의 첫 번째 단계예요.'), findsOneWidget);
    expect(find.text('다음'), findsOneWidget);

    await tester.tap(find.text('입문자'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    expect(find.text('STEP 2 / 4'), findsOneWidget);
    expect(find.text('가장 끌리는 주류 카테고리를 모두 선택해 주세요.'), findsOneWidget);
  });

  testWidgets('shows home screen after skipping survey', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

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
    await _pumpApp(tester);

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

    expect(find.text('3'), findsOneWidget);
    expect(find.text('7'), findsNothing);
  });

  testWidgets('navigates from home to board screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

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

  testWidgets('navigates from home to groupchat list screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Back to messages'), findsOneWidget);
    expect(find.text('Westside Bourbon Enthusiasts'), findsOneWidget);
  });

  testWidgets('navigates to collection wishlist and cart tabs', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();
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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();
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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('SKIP'));
    await tester.pumpAndSettle();

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
    expect(find.text('The Golden Old Fashioned'), findsOneWidget);
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

Future<void> _pumpApp(WidgetTester tester, {ChatPushService? chatPushService}) {
  SharedPreferences.setMockInitialValues({});
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRemoteDataSourceProvider.overrideWithValue(
          _FakeAuthRemoteDataSource(),
        ),
      ],
      child: OnTheBlockApp(
        chatRepository: _FakeChatRepository(),
        chatPushService: chatPushService ?? _FakeChatPushService(),
      ),
    ),
  );
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

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<GoogleLoginResponse> googleLogin() async {
    return GoogleLoginResponse()
      ..accessToken = 'access-token'
      ..refreshToken = 'refresh-token'
      ..isNewUser = false
      ..user = _fakeUser(surveyCompleted: false);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String token) async {
    return RefreshTokenResponse()
      ..accessToken = 'refreshed-access-token'
      ..refreshToken = 'refreshed-refresh-token'
      ..user = _fakeUser(surveyCompleted: false);
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
        surveyCompleted: false,
      );
  }

  @override
  Future<void> logout(String userId) async {}

  @override
  Future<void> dispose() async {}

  UserResponse _fakeUser({
    String nickname = 'Alex Drinkwater',
    String profileImageUrl = '',
    required bool surveyCompleted,
  }) {
    return UserResponse()
      ..userId = '11111111-1111-1111-1111-111111111111'
      ..email = 'alex.d@example.com'
      ..nickname = nickname
      ..profileImageUrl = profileImageUrl
      ..surveyCompleted = surveyCompleted
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
  Future<void> sendTextMessage({
    required String roomId,
    required String senderUserId,
    required String content,
    String authToken = '',
  }) async {}

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
  Future<void> sendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
    String authToken = '',
  }) async {}

  @override
  Future<void> sendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
    String authToken = '',
  }) async {}

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
