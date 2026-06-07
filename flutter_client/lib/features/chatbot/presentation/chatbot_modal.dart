import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../data/chatbot_repository.dart';
import '../domain/chatbot_use_cases.dart';
import '../models/chatbot_models.dart';

Future<void> showChatbotModal(
  BuildContext context, {
  ChatbotRepository? repository,
  String authToken = '',
  ChatbotScreenContext screenContext = ChatbotScreenContext.home,
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close chatbot',
    barrierColor: Colors.black.withValues(alpha: 0.42),
    transitionDuration: const Duration(milliseconds: 180),
    pageBuilder: (context, animation, secondaryAnimation) {
      return _ChatbotDialog(
        repository: repository ?? const UnavailableChatbotRepository(),
        authToken: authToken,
        screenContext: screenContext,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.96, end: 1).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _ChatbotDialog extends StatefulWidget {
  const _ChatbotDialog({
    required this.repository,
    required this.authToken,
    required this.screenContext,
  });

  final ChatbotRepository repository;
  final String authToken;
  final ChatbotScreenContext screenContext;

  @override
  State<_ChatbotDialog> createState() => _ChatbotDialogState();
}

class _ChatbotDialogState extends State<_ChatbotDialog> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<_ChatMessage> _messages = <_ChatMessage>[];
  final Map<String, String> _feedbackKeys = <String, String>{};
  final Map<String, ChatbotFeedbackType> _feedbackSubmitted =
      <String, ChatbotFeedbackType>{};

  late final SendChatbotMessageUseCase _sendMessageUseCase;
  late final GetChatbotConversationUseCase _getConversationUseCase;
  late final RecordChatbotFeedbackUseCase _recordFeedbackUseCase;
  late final String _sessionIdHash;

  String _conversationId = '';
  String _lastUserMessage = '';
  String? _errorMessage;
  bool _isSending = false;
  bool _isReloading = false;

  @override
  void initState() {
    super.initState();
    _sendMessageUseCase = SendChatbotMessageUseCase(widget.repository);
    _getConversationUseCase = GetChatbotConversationUseCase(widget.repository);
    _recordFeedbackUseCase = RecordChatbotFeedbackUseCase(widget.repository);
    _sessionIdHash = DateTime.now().microsecondsSinceEpoch.toRadixString(16);
    _messages.add(
      const _ChatMessage(
        role: ChatbotMessageRole.assistant,
        text: '취향, 가격대, 근처 매장 기준으로 추천을 도와드릴게요. 궁금한 걸 한국어로 물어보세요.',
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage({String? retryText}) async {
    final text = (retryText ?? _controller.text).trim();
    if (text.isEmpty || _isSending) {
      return;
    }
    if (widget.authToken.trim().isEmpty) {
      setState(() {
        _errorMessage = '로그인 정보가 없어 챗봇을 호출할 수 없습니다.';
      });
      return;
    }

    _controller.clear();
    setState(() {
      _lastUserMessage = text;
      _isSending = true;
      _errorMessage = null;
      if (retryText == null) {
        _messages.add(_ChatMessage(role: ChatbotMessageRole.user, text: text));
      }
    });
    _scrollToBottomSoon();

    try {
      final answer = await _sendMessageUseCase(
        ChatbotSendRequest(
          authToken: widget.authToken,
          clientMessageId: _newClientMessageId(),
          conversationId: _conversationId,
          message: text,
          screenContext: widget.screenContext,
          beverageLimit: 3,
          venueLimit: 3,
          clientContext: <String, Object>{
            'client_platform': 'flutter',
            'surface': _surfaceName,
          },
        ),
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _conversationId = answer.conversationId;
        _messages.add(
          _ChatMessage(
            role: ChatbotMessageRole.assistant,
            text: _answerText(answer),
            messageId: answer.messageId,
            cards: answer.cards,
            status: answer.status,
            refused: answer.refused,
            profileStatus: answer.profileStatus,
            missingFacts: answer.missingFacts,
            followUpQuestions: answer.followUpQuestions,
          ),
        );
        _isSending = false;
      });
      _scrollToBottomSoon();
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isSending = false;
        _errorMessage = error is ChatbotRepositoryUnavailableException
            ? '챗봇 엔드포인트가 아직 설정되지 않았습니다.'
            : '챗봇 서버에 연결하지 못했습니다.';
      });
      _scrollToBottomSoon();
    }
  }

  Future<void> _reloadConversation() async {
    final conversationId = _conversationId.trim();
    if (conversationId.isEmpty || _isReloading) {
      return;
    }
    setState(() {
      _isReloading = true;
      _errorMessage = null;
    });
    try {
      final page = await _getConversationUseCase(
        authToken: widget.authToken,
        conversationId: conversationId,
        pageSize: 20,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _conversationId = page.conversationId;
        _messages
          ..clear()
          ..addAll(page.messages.map(_messageFromConversation));
        if (_messages.isEmpty) {
          _messages.add(
            const _ChatMessage(
              role: ChatbotMessageRole.assistant,
              text: '이 대화에는 아직 표시할 메시지가 없습니다.',
            ),
          );
        }
        _isReloading = false;
      });
      _scrollToBottomSoon();
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isReloading = false;
        _errorMessage = '대화를 다시 불러오지 못했습니다.';
      });
    }
  }

  _ChatMessage _messageFromConversation(ChatbotConversationMessage message) {
    return _ChatMessage(
      role: message.role,
      text: message.content,
      messageId: message.messageId,
      cards: message.cards,
    );
  }

  Future<void> _recordFeedback(
    _ChatMessage message,
    ChatbotFeedbackType eventType,
  ) async {
    final messageId = message.messageId.trim();
    if (messageId.isEmpty) {
      return;
    }
    if (eventType == ChatbotFeedbackType.copy) {
      await Clipboard.setData(ClipboardData(text: message.text));
    }

    final idempotencyKey = _feedbackKey(messageId, eventType);
    setState(() {
      _feedbackSubmitted[messageId] = eventType;
    });

    try {
      await _recordFeedbackUseCase(
        authToken: widget.authToken,
        conversationId: _conversationId,
        messageId: messageId,
        eventType: eventType,
        idempotencyKey: idempotencyKey,
        metadata: <String, Object>{
          'client_platform': 'flutter',
          'surface': 'chatbot_modal',
          'screen_context': _surfaceName,
          'session_id_hash': _sessionIdHash,
          'source': 'chatbot_v1',
        },
      );
    } catch (_) {
      if (!mounted || eventType != ChatbotFeedbackType.report) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('신고를 보내지 못했습니다. 다시 시도해 주세요.')),
      );
    }
  }

  String _feedbackKey(String messageId, ChatbotFeedbackType eventType) {
    final key = '$messageId:${eventType.name}';
    return _feedbackKeys.putIfAbsent(
      key,
      () => '$_sessionIdHash:$messageId:${eventType.name}',
    );
  }

  String _newClientMessageId() {
    return 'flutter:$_sessionIdHash:${DateTime.now().microsecondsSinceEpoch}';
  }

  String get _surfaceName {
    return switch (widget.screenContext) {
      ChatbotScreenContext.home => 'home',
      ChatbotScreenContext.board => 'board',
      ChatbotScreenContext.map => 'map',
      ChatbotScreenContext.chat => 'chat',
    };
  }

  String _answerText(ChatbotAnswer answer) {
    final text = answer.answer.trim();
    if (text.isNotEmpty) {
      return text;
    }
    if (answer.refused || answer.status == ChatbotResponseStatus.refused) {
      final reason = answer.refusalReason.trim();
      return reason.isEmpty ? '이 요청에는 답변할 수 없습니다.' : reason;
    }
    if (answer.status == ChatbotResponseStatus.insufficientData ||
        answer.profileStatus == ChatbotProfileStatus.missing ||
        answer.profileStatus == ChatbotProfileStatus.pendingGeneration) {
      return '추천 프로필이 아직 준비되지 않았습니다. 설문 저장 또는 프로필 생성을 확인해 주세요.';
    }
    return '답변을 받았지만 표시할 문장이 비어 있습니다.';
  }

  void _scrollToBottomSoon() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 88),
        child: Center(
          child: Material(
            color: palette.surfaceContainerLowest,
            elevation: 24,
            shadowColor: Colors.black.withValues(alpha: 0.28),
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 448, maxHeight: 640),
              child: Column(
                children: [
                  _ChatbotHeader(
                    isReloading: _isReloading,
                    canReload: _conversationId.trim().isNotEmpty,
                    onReload: _reloadConversation,
                  ),
                  Expanded(
                    child: _ChatHistory(
                      messages: _messages,
                      isSending: _isSending,
                      errorMessage: _errorMessage,
                      lastUserMessage: _lastUserMessage,
                      feedbackSubmitted: _feedbackSubmitted,
                      onRetry: () => _sendMessage(retryText: _lastUserMessage),
                      onFeedback: _recordFeedback,
                      scrollController: _scrollController,
                    ),
                  ),
                  _ChatInput(
                    controller: _controller,
                    isSending: _isSending,
                    onSend: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatbotHeader extends StatelessWidget {
  const _ChatbotHeader({
    required this.isReloading,
    required this.canReload,
    required this.onReload,
  });

  final bool isReloading;
  final bool canReload;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(bottom: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.smart_toy, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ON THE BLOCK 챗봇',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '추천 결과 기반 답변',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: canReload && !isReloading ? onReload : null,
              tooltip: 'Reload conversation',
              icon: isReloading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(Icons.refresh, color: palette.secondary),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Close',
              icon: Icon(Icons.close, color: palette.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatHistory extends StatelessWidget {
  const _ChatHistory({
    required this.messages,
    required this.isSending,
    required this.errorMessage,
    required this.lastUserMessage,
    required this.feedbackSubmitted,
    required this.onRetry,
    required this.onFeedback,
    required this.scrollController,
  });

  final List<_ChatMessage> messages;
  final bool isSending;
  final String? errorMessage;
  final String lastUserMessage;
  final Map<String, ChatbotFeedbackType> feedbackSubmitted;
  final VoidCallback onRetry;
  final Future<void> Function(_ChatMessage, ChatbotFeedbackType) onFeedback;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return ColoredBox(
      color: palette.surfaceContainerLow.withValues(alpha: 0.35),
      child: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemCount:
            messages.length +
            (isSending ? 1 : 0) +
            (errorMessage != null ? 1 : 0),
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index < messages.length) {
            final message = messages[index];
            return message.role == ChatbotMessageRole.user
                ? _UserMessage(message: message)
                : _AssistantMessage(
                    message: message,
                    submittedFeedback: feedbackSubmitted[message.messageId],
                    onFeedback: onFeedback,
                  );
          }
          final loadingIndex = messages.length;
          if (isSending && index == loadingIndex) {
            return const _LoadingMessage();
          }
          return _ErrorMessage(
            text: errorMessage!,
            canRetry: lastUserMessage.trim().isNotEmpty,
            onRetry: onRetry,
          );
        },
      ),
    );
  }
}

class _AssistantMessage extends StatelessWidget {
  const _AssistantMessage({
    required this.message,
    required this.submittedFeedback,
    required this.onFeedback,
  });

  final _ChatMessage message;
  final ChatbotFeedbackType? submittedFeedback;
  final Future<void> Function(_ChatMessage, ChatbotFeedbackType) onFeedback;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: palette.surfaceContainerLow,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.liquor, size: 18, color: palette.secondary),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.surfaceContainerLowest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
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
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.refused ||
                      message.status == ChatbotResponseStatus.refused)
                    const _StateLabel(text: '요청 거절')
                  else if (message.status ==
                          ChatbotResponseStatus.insufficientData ||
                      message.profileStatus == ChatbotProfileStatus.missing ||
                      message.profileStatus ==
                          ChatbotProfileStatus.pendingGeneration)
                    const _StateLabel(text: '프로필 준비 필요'),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: palette.onSurfaceVariant,
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                  if (message.missingFacts.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _InfoList(title: '부족한 정보', items: message.missingFacts),
                  ],
                  if (message.followUpQuestions.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _InfoList(
                      title: '이어질 질문',
                      items: message.followUpQuestions,
                    ),
                  ],
                  if (message.cards.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _ChatbotCardList(cards: message.cards),
                  ],
                  if (message.messageId.trim().isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _FeedbackRow(
                      submittedFeedback: submittedFeedback,
                      onFeedback: (event) => onFeedback(message, event),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _UserMessage extends StatelessWidget {
  const _UserMessage({required this.message});

  final _ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingMessage extends StatelessWidget {
  const _LoadingMessage();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 42),
        DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
                Text(
                  '답변을 준비하고 있어요',
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({
    required this.text,
    required this.canRetry,
    required this.onRetry,
  });

  final String text;
  final bool canRetry;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4EE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFCCB6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.error_outline, color: Color(0xFFC2410C), size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF7C2D12),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                ),
              ),
            ),
            if (canRetry)
              TextButton(
                onPressed: onRetry,
                style: TextButton.styleFrom(
                  foregroundColor: palette.onSurface,
                  minimumSize: const Size(48, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                child: const Text('재시도'),
              ),
          ],
        ),
      ),
    );
  }
}

class _ChatbotCardList extends StatelessWidget {
  const _ChatbotCardList({required this.cards});

  final List<ChatbotCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < cards.length; index++) ...[
          if (index > 0) const SizedBox(height: 10),
          _ChatbotCardTile(card: cards[index]),
        ],
      ],
    );
  }
}

class _ChatbotCardTile extends StatelessWidget {
  const _ChatbotCardTile({required this.card});

  final ChatbotCardModel card;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final title = _title;
    final subtitle = _subtitle;
    final reason = _reason;
    final chips = _chips;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: palette.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _CardKindPill(kind: card.kind, rank: _rank),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.onSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      height: 1.18,
                    ),
                  ),
                ),
              ],
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: palette.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1.32,
                ),
              ),
            ],
            if (reason.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                reason,
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 12,
                  height: 1.38,
                ),
              ),
            ],
            ..._detailRows(),
            if (chips.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: chips.take(4).map(_ReasonChip.new).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String get _title {
    if (card.title.trim().isNotEmpty) {
      return card.title;
    }
    final beverage = card.beverage;
    if (beverage != null && beverage.displayName.trim().isNotEmpty) {
      return beverage.displayName;
    }
    final venue = card.venue;
    if (venue != null && venue.name.trim().isNotEmpty) {
      return venue.name;
    }
    final purchase = card.purchaseOption;
    if (purchase != null && purchase.beverageName.trim().isNotEmpty) {
      return purchase.beverageName;
    }
    return '추천 카드';
  }

  String get _subtitle {
    if (card.subtitle.trim().isNotEmpty) {
      return card.subtitle;
    }
    final beverage = card.beverage;
    if (beverage != null) {
      return beverage.category;
    }
    final venue = card.venue;
    if (venue != null) {
      return venue.address;
    }
    final purchase = card.purchaseOption;
    if (purchase != null) {
      return '${purchase.placeName} ${purchase.address}'.trim();
    }
    final comparison = card.comparison;
    if (comparison != null) {
      return comparison.summary;
    }
    final profile = card.profileStatus;
    if (profile != null) {
      return _profileStatusLabel(profile.status);
    }
    return '';
  }

  String get _reason {
    if (card.displayReason.trim().isNotEmpty) {
      return card.displayReason;
    }
    return card.beverage?.explanation ??
        card.venue?.explanation ??
        card.purchaseOption?.explanation ??
        '';
  }

  List<String> get _chips {
    if (card.reasonCodes.isNotEmpty) {
      return card.reasonCodes;
    }
    return card.beverage?.reasonCodes ??
        card.venue?.reasonCodes ??
        card.purchaseOption?.reasonCodes ??
        const <String>[];
  }

  int? get _rank {
    final beverageRank = card.beverage?.rank;
    if (beverageRank != null && beverageRank > 0) {
      return beverageRank;
    }
    final venueRank = card.venue?.rank;
    if (venueRank != null && venueRank > 0) {
      return venueRank;
    }
    return null;
  }

  List<Widget> _detailRows() {
    final rows = <Widget>[];
    final venue = card.venue;
    if (venue != null) {
      rows.addAll(_venueRows(venue));
    }
    final purchase = card.purchaseOption;
    if (purchase != null) {
      rows.addAll(_purchaseRows(purchase));
    }
    final comparison = card.comparison;
    if (comparison != null && comparison.options.isNotEmpty) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: comparison.options
                .map((option) => _CompactPurchaseOption(option: option))
                .toList(),
          ),
        ),
      );
    }
    final profile = card.profileStatus;
    if (profile != null && profile.staleReason.trim().isNotEmpty) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: _DetailText('상태 사유: ${profile.staleReason}'),
        ),
      );
    }
    return rows;
  }

  List<Widget> _venueRows(ChatbotVenueCard venue) {
    return [
      const SizedBox(height: 8),
      _DetailWrap(
        items: [
          if (venue.distanceM != null) _distanceLabel(venue.distanceM!),
          if (venue.estimatedTravelTimeSec != null)
            _travelTimeLabel(venue.estimatedTravelTimeSec!),
          if (venue.priceKrw != null) '참고 가격 ${_krw(venue.priceKrw!)}',
          if (venue.availabilityLabel.isNotEmpty) venue.availabilityLabel,
          if (venue.freshnessLabel.isNotEmpty) venue.freshnessLabel,
        ],
      ),
    ];
  }

  List<Widget> _purchaseRows(ChatbotPurchaseOptionCard option) {
    return [
      const SizedBox(height: 8),
      _DetailWrap(
        items: [
          if (option.placeName.isNotEmpty) option.placeName,
          if (option.distanceM != null) _distanceLabel(option.distanceM!),
          if (option.estimatedTravelTimeSec != null)
            _travelTimeLabel(option.estimatedTravelTimeSec!),
          if (option.priceKrw != null) '참고 가격 ${_krw(option.priceKrw!)}',
          if (option.availabilityLabel.isNotEmpty) option.availabilityLabel,
          if (option.freshnessLabel.isNotEmpty) option.freshnessLabel,
        ],
      ),
    ];
  }
}

class _CardKindPill extends StatelessWidget {
  const _CardKindPill({required this.kind, required this.rank});

  final ChatbotCardKind kind;
  final int? rank;

  @override
  Widget build(BuildContext context) {
    final label = rank != null ? '#$rank' : _kindLabel(kind);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _CompactPurchaseOption extends StatelessWidget {
  const _CompactPurchaseOption({required this.option});

  final ChatbotPurchaseOptionCard option;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final detail = [
      if (option.placeName.isNotEmpty) option.placeName,
      if (option.priceKrw != null) '참고 가격 ${_krw(option.priceKrw!)}',
      if (option.distanceM != null) _distanceLabel(option.distanceM!),
    ].join(' · ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        detail,
        style: TextStyle(
          color: palette.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
      ),
    );
  }
}

class _DetailWrap extends StatelessWidget {
  const _DetailWrap({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: items.map(_DetailChip.new).toList(),
    );
  }
}

class _DetailChip extends StatelessWidget {
  const _DetailChip(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: palette.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _ReasonChip extends StatelessWidget {
  const _ReasonChip(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _DetailText extends StatelessWidget {
  const _DetailText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Text(
      text,
      style: TextStyle(
        color: palette.secondary,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _InfoList extends StatelessWidget {
  const _InfoList({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: palette.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            for (final item in items)
              Text(
                '- $item',
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StateLabel extends StatelessWidget {
  const _StateLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4EE),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF9A3412),
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedbackRow extends StatelessWidget {
  const _FeedbackRow({
    required this.submittedFeedback,
    required this.onFeedback,
  });

  final ChatbotFeedbackType? submittedFeedback;
  final ValueChanged<ChatbotFeedbackType> onFeedback;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    if (submittedFeedback != null) {
      return Text(
        '피드백이 기록되었습니다.',
        style: TextStyle(
          color: palette.secondary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      );
    }

    return Wrap(
      spacing: 2,
      runSpacing: 2,
      children: [
        _FeedbackButton(
          tooltip: 'Helpful',
          icon: Icons.thumb_up_alt_outlined,
          onTap: () => onFeedback(ChatbotFeedbackType.helpful),
        ),
        _FeedbackButton(
          tooltip: 'Not helpful',
          icon: Icons.thumb_down_alt_outlined,
          onTap: () => onFeedback(ChatbotFeedbackType.notHelpful),
        ),
        _FeedbackButton(
          tooltip: 'Copy answer',
          icon: Icons.copy,
          onTap: () => onFeedback(ChatbotFeedbackType.copy),
        ),
        _FeedbackButton(
          tooltip: 'Dismiss answer',
          icon: Icons.close,
          onTap: () => onFeedback(ChatbotFeedbackType.dismiss),
        ),
        _FeedbackButton(
          tooltip: 'Report answer',
          icon: Icons.flag_outlined,
          onTap: () => onFeedback(ChatbotFeedbackType.report),
        ),
      ],
    );
  }
}

class _FeedbackButton extends StatelessWidget {
  const _FeedbackButton({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      visualDensity: VisualDensity.compact,
      iconSize: 18,
      color: palette.secondary,
      icon: Icon(icon),
    );
  }
}

class _ChatInput extends StatefulWidget {
  const _ChatInput({
    required this.controller,
    required this.isSending,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool isSending;
  final Future<void> Function() onSend;

  @override
  State<_ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<_ChatInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final canSend =
        widget.controller.text.trim().isNotEmpty && !widget.isSending;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                enabled: !widget.isSending,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) {
                  if (canSend) {
                    unawaited(widget.onSend());
                  }
                },
                decoration: InputDecoration(
                  hintText: '질문을 입력하세요...',
                  hintStyle: TextStyle(color: palette.secondary),
                  filled: true,
                  fillColor: palette.surfaceContainerLow,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: canSend ? () => unawaited(widget.onSend()) : null,
              tooltip: 'Send chatbot message',
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
                foregroundColor: Colors.white,
                disabledBackgroundColor: palette.surfaceContainerLow,
                disabledForegroundColor: palette.secondary,
              ),
              icon: widget.isSending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({
    required this.role,
    required this.text,
    this.messageId = '',
    this.cards = const <ChatbotCardModel>[],
    this.status = ChatbotResponseStatus.unspecified,
    this.refused = false,
    this.profileStatus = ChatbotProfileStatus.unspecified,
    this.missingFacts = const <String>[],
    this.followUpQuestions = const <String>[],
  });

  final ChatbotMessageRole role;
  final String text;
  final String messageId;
  final List<ChatbotCardModel> cards;
  final ChatbotResponseStatus status;
  final bool refused;
  final ChatbotProfileStatus profileStatus;
  final List<String> missingFacts;
  final List<String> followUpQuestions;
}

String _kindLabel(ChatbotCardKind kind) {
  return switch (kind) {
    ChatbotCardKind.beverageRecommendation => '주류',
    ChatbotCardKind.venueRecommendation => '장소',
    ChatbotCardKind.purchaseOption => '구매',
    ChatbotCardKind.comparison => '비교',
    ChatbotCardKind.profileStatus => '프로필',
    ChatbotCardKind.unspecified => '추천',
  };
}

String _profileStatusLabel(ChatbotProfileStatus status) {
  return switch (status) {
    ChatbotProfileStatus.missing => '추천 프로필이 없습니다',
    ChatbotProfileStatus.pendingGeneration => '추천 프로필 생성 중',
    ChatbotProfileStatus.active => '추천 프로필 활성화됨',
    ChatbotProfileStatus.stale => '추천 프로필 갱신 필요',
    ChatbotProfileStatus.failedGeneration => '추천 프로필 생성 실패',
    ChatbotProfileStatus.unspecified => '추천 프로필 상태 미확인',
  };
}

String _distanceLabel(double meters) {
  if (meters >= 1000) {
    return '${(meters / 1000).toStringAsFixed(1)}km';
  }
  return '${meters.round()}m';
}

String _travelTimeLabel(int seconds) {
  final minutes = (seconds / 60).round();
  if (minutes <= 0) {
    return '1분 이내';
  }
  return '약 $minutes분';
}

String _krw(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    final reverseIndex = digits.length - i;
    buffer.write(digits[i]);
    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write(',');
    }
  }
  return '$buffer원';
}
