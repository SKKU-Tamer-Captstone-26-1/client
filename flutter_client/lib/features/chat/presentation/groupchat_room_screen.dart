import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../data/chat_repository.dart';
import '../data/mock_groupchat_data.dart';
import '../models/groupchat_models.dart';

class GroupchatRoomScreen extends StatefulWidget {
  const GroupchatRoomScreen({
    super.key,
    required this.room,
    this.onBack,
    this.onBottomNavSelected,
    this.chatRepository,
    this.currentUserId,
  });

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;
  final ValueChanged<AppBottomNavItem>? onBottomNavSelected;
  final ChatRepository? chatRepository;
  final String? currentUserId;

  @override
  State<GroupchatRoomScreen> createState() => _GroupchatRoomScreenState();
}

class _GroupchatRoomScreenState extends State<GroupchatRoomScreen>
    with WidgetsBindingObserver {
  late List<GroupchatMessage> _messages;
  final TextEditingController _composerController = TextEditingController();
  bool _loading = false;
  StreamSubscription<GroupchatMessage>? _streamSub;
  int _latestSequenceNo = 0;

  bool get _canUseRemote {
    return widget.chatRepository != null &&
        widget.currentUserId != null &&
        widget.currentUserId!.isNotEmpty &&
        widget.room.roomId.isNotEmpty &&
        !widget.room.roomId.startsWith('mock-room-');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _messages = mockGroupchatMessages;
    _bootstrapMessages();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _streamSub?.cancel();
    _composerController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_canUseRemote) {
      return;
    }
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _streamSub?.cancel();
      _streamSub = null;
      return;
    }
    if (state == AppLifecycleState.resumed) {
      _loadMessages();
    }
  }

  Future<void> _bootstrapMessages() async {
    if (_canUseRemote) {
      _latestSequenceNo = await _readPersistedSequenceNo();
    }
    await _loadMessages();
  }

  Future<void> _loadMessages() async {
    if (!_canUseRemote) {
      return;
    }
    setState(() {
      _loading = true;
    });
    try {
      final fetched = await widget.chatRepository!.getMessages(
        roomId: widget.room.roomId,
        userId: widget.currentUserId!,
        limit: 50,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _messages = _normalizeMessages(fetched);
        final fetchedLatest = _messages.isEmpty ? 0 : _messages.last.sequenceNo;
        _latestSequenceNo = _maxSequenceNo(_latestSequenceNo, fetchedLatest);
      });
      unawaited(_persistLatestSequenceNo());
      _restartMessageStream();
    } catch (_) {
      // Keep existing messages on errors.
    } finally {
      if (_streamSub == null) {
        final currentLatest = _messages.isEmpty ? 0 : _messages.last.sequenceNo;
        _latestSequenceNo = _maxSequenceNo(_latestSequenceNo, currentLatest);
        _restartMessageStream();
      }
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  void _startMessageStream() {
    if (!_canUseRemote) {
      return;
    }
    _streamSub?.cancel();
    _streamSub = widget.chatRepository!
        .streamMessages(
          roomId: widget.room.roomId,
          userId: widget.currentUserId!,
          afterSequenceNo: _latestSequenceNo,
        )
        .listen((message) {
          if (!mounted) {
            return;
          }
          final exists = _messages.any(
            (m) =>
                m.messageId == message.messageId ||
                m.sequenceNo == message.sequenceNo,
          );
          if (exists) {
            return;
          }
          setState(() {
            _messages = _normalizeMessages([..._messages, message]);
            _latestSequenceNo = _messages.last.sequenceNo;
          });
          unawaited(_persistLatestSequenceNo());
        });
  }

  void _restartMessageStream() {
    if (!_canUseRemote) {
      return;
    }
    _startMessageStream();
  }

  Future<void> _sendMessage() async {
    final text = _composerController.text.trim();
    if (text.isEmpty) {
      return;
    }
    if (!_canUseRemote) {
      setState(() {
        _messages = [
          ..._messages,
          GroupchatMessage(
            messageId: 'local-${DateTime.now().microsecondsSinceEpoch}',
            roomId: widget.room.roomId,
            sequenceNo: _messages.length + 1,
            kind: GroupchatMessageKind.outgoing,
            text: text,
            timeLabel: _nowTimeLabel(),
            deliveryLabel: 'Sent',
          ),
        ];
      });
      _latestSequenceNo = _messages.last.sequenceNo;
      unawaited(_persistLatestSequenceNo());
      _composerController.clear();
      return;
    }

    try {
      await widget.chatRepository!.sendTextMessage(
        roomId: widget.room.roomId,
        senderUserId: widget.currentUserId!,
        content: text,
      );
      _composerController.clear();
      await _loadMessages();
    } catch (_) {
      // Keep composer text on failure so user can retry.
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      appBar: _GroupchatRoomAppBar(room: widget.room, onBack: widget.onBack),
      bottomNavigationBar: AppBottomNavBar(
        currentItem: AppBottomNavItem.chat,
        onItemSelected: widget.onBottomNavSelected,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 768),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
                    children: [
                      const _DateDivider(label: 'Today'),
                      const SizedBox(height: 20),
                      if (_loading)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: LinearProgressIndicator(minHeight: 2),
                        ),
                      _MessageList(messages: _messages),
                      const SizedBox(height: 22),
                      const _LiveDropPreview(),
                      const SizedBox(height: 22),
                      const _SuggestionChips(),
                    ],
                  ),
                ),
              ),
            ),
            _MessageComposer(
              controller: _composerController,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  String _sequenceStorageKey() {
    return 'chat.last_sequence.${widget.currentUserId}.${widget.room.roomId}';
  }

  Future<int> _readPersistedSequenceNo() async {
    final userId = widget.currentUserId;
    if (userId == null || userId.isEmpty) {
      return 0;
    }
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_sequenceStorageKey()) ?? 0;
  }

  Future<void> _persistLatestSequenceNo() async {
    final userId = widget.currentUserId;
    if (userId == null || userId.isEmpty || _latestSequenceNo <= 0) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sequenceStorageKey(), _latestSequenceNo);
  }

  int _maxSequenceNo(int a, int b) => a > b ? a : b;
}

List<GroupchatMessage> _normalizeMessages(List<GroupchatMessage> messages) {
  final cloned = [...messages];
  cloned.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
  return cloned;
}

String _nowTimeLabel() {
  final now = DateTime.now();
  final hour = now.hour.toString().padLeft(2, '0');
  final minute = now.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

class _GroupchatRoomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _GroupchatRoomAppBar({required this.room, this.onBack});

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: palette.surfaceContainerLowest,
      foregroundColor: palette.onSurface,
      shape: Border(bottom: BorderSide(color: palette.outlineVariant)),
      titleSpacing: 8,
      title: Row(
        children: [
          IconButton(
            onPressed: onBack,
            tooltip: 'Back to messages',
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryContainer,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  room.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${room.memberSummary.split('/').first} members',
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Room options',
          icon: const Icon(Icons.more_vert, color: AppColors.primaryContainer),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.surfaceContainerLowest.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: palette.secondary,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({required this.messages});

  final List<GroupchatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final message in messages) ...[
          _MessageBubble(message: message),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    return message.isOutgoing
        ? _OutgoingMessage(message: message)
        : _IncomingMessage(message: message);
  }
}

class _IncomingMessage extends StatelessWidget {
  const _IncomingMessage({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _SenderAvatar(
              avatarUrl: message.senderAvatarUrl,
              senderName: message.senderName,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.senderName ?? 'Member',
                    style: TextStyle(
                      color: palette.decorativeTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLowest,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                        bottomLeft: Radius.circular(2),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: _MessageContent(
                        message: message,
                        textColor: palette.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutgoingMessage extends StatelessWidget {
  const _OutgoingMessage({required this.message});

  final GroupchatMessage message;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _MessageContent(
                  message: message,
                  textColor: Colors.white,
                ),
              ),
            ),
            if (message.deliveryLabel != null) ...[
              const SizedBox(height: 5),
              Text(
                message.deliveryLabel!,
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MessageContent extends StatelessWidget {
  const _MessageContent({required this.message, required this.textColor});

  final GroupchatMessage message;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final shouldRenderImage =
        message.contentType == GroupchatMessageContentType.image &&
        message.imageUrl.trim().isNotEmpty;

    if (shouldRenderImage) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppNetworkImage(
              url: message.imageUrl,
              width: 220,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          if (message.text.trim().isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              message.text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ],
        ],
      );
    }

    return Text(
      message.text,
      style: TextStyle(
        color: textColor,
        fontSize: 15,
        height: 1.4,
      ),
    );
  }
}

class _SenderAvatar extends StatelessWidget {
  const _SenderAvatar({required this.avatarUrl, required this.senderName});

  final String? avatarUrl;
  final String? senderName;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final url = avatarUrl?.trim() ?? '';
    if (url.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AppNetworkImage(
          url: url,
          width: 40,
          height: 40,
        ),
      );
    }

    final fallbackChar = _avatarInitial(senderName);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        fallbackChar,
        style: TextStyle(
          color: palette.onSurfaceVariant,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

String _avatarInitial(String? senderName) {
  final normalized = (senderName ?? '').trim();
  if (normalized.isEmpty) {
    return 'M';
  }
  return normalized.substring(0, 1).toUpperCase();
}

class _LiveDropPreview extends StatelessWidget {
  const _LiveDropPreview();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 420;

        final alert = DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: palette.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  child: Stack(
                    children: [
                      _SmallAvatar(
                        url: mockGroupchatMessages[0].senderAvatarUrl!,
                      ),
                      Positioned(
                        left: 18,
                        child: _SmallAvatar(
                          url: mockGroupchatMessages[2].senderAvatarUrl!,
                        ),
                      ),
                      Positioned(
                        left: 36,
                        child: Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer.withValues(
                              alpha: 0.18,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: palette.surfaceContainerLowest,
                              width: 2,
                            ),
                          ),
                          child: const Text(
                            '+15',
                            style: TextStyle(
                              color: AppColors.primaryContainer,
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Live Drop Alert',
                  style: TextStyle(
                    color: palette.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '3 people are typing...',
                  style: TextStyle(color: palette.secondary, fontSize: 11),
                ),
              ],
            ),
          ),
        );

        final bottle = ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: SizedBox(
            height: 112,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const AppNetworkImage(
                  url:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA8wvg2QG0ORmF90nqxTX5ewLuegJ-OZnvBYDGQnTTsyrj_L51Km0r3LzRoylI8qcJ0txZVKVwOat9qbOXudFm0O4Kf0CrbxOt8DavqjMdSV-l-hj4Xw1SN9AhYOWjadYkro7C9DUsH9XeakKAmHp_4qKecBGP5cTA2vwAGY1KuAg1fcpJCut1rv5yoQaeqcGnRi7-DB74k64Vhic0gd5DTjZPifnHBoOt2arIO025Y0v3PrHFWmkuIknTGxEbPVbtGNl46aN-fMSg',
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00000000), Color(0xB3000000)],
                    ),
                  ),
                ),
                const Positioned(
                  left: 14,
                  right: 14,
                  bottom: 12,
                  child: Text(
                    'View Bottle Stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        if (compact) {
          return Column(children: [alert, const SizedBox(height: 12), bottle]);
        }

        return Row(
          children: [
            Expanded(child: alert),
            const SizedBox(width: 12),
            Expanded(child: bottle),
          ],
        );
      },
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  const _SmallAvatar({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: palette.surfaceContainerLowest, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: AppNetworkImage(url: url),
    );
  }
}

class _SuggestionChips extends StatelessWidget {
  const _SuggestionChips();

  static const _chips = ['Shared Location', 'Log Tasting', 'Send Photo'];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryContainer,
              side: BorderSide(
                color: AppColors.primaryContainer.withValues(alpha: 0.28),
              ),
              backgroundColor: palette.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
            ),
            child: Text(
              _chips[index],
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
          );
        },
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 768),
            child: Row(
              children: [
                IconButton.filledTonal(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: palette.surfaceContainerLow,
                    foregroundColor: palette.onSurfaceVariant,
                    shape: const CircleBorder(),
                  ),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: palette.outlineVariant),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextField(
                      controller: controller,
                      minLines: 1,
                      maxLines: 4,
                      style: TextStyle(
                        color: palette.onSurface,
                        fontSize: 15,
                        height: 1.3,
                      ),
                      cursorColor: AppColors.primaryContainer,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => onSend(),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                          color: palette.secondary,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: onSend,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    fixedSize: const Size(48, 48),
                  ),
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
