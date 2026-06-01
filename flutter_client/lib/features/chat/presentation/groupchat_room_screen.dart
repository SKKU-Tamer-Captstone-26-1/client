import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../auth/data/auth_repository.dart';
import '../../auth/providers/auth_repository_provider.dart';
import '../data/chat_repository.dart';
import '../data/mock_groupchat_data.dart';
import '../models/groupchat_models.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/typing_indicator.dart';

const _chatContentMaxWidth = 768.0;
const _messageBubbleMaxWidth = 640.0;
const _messageListPadding = EdgeInsets.fromLTRB(16, 22, 16, 22);

class GroupchatRoomScreen extends StatefulWidget {
  const GroupchatRoomScreen({
    super.key,
    required this.room,
    this.onBack,
    this.onRoomDeactivated,
    this.chatRepository,
    this.currentUserId,
    this.authToken = '',
  });

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;
  final ValueChanged<String>? onRoomDeactivated;
  final ChatRepository? chatRepository;
  final String? currentUserId;
  final String authToken;

  @override
  State<GroupchatRoomScreen> createState() => _GroupchatRoomScreenState();
}

class _GroupchatRoomScreenState extends State<GroupchatRoomScreen>
    with WidgetsBindingObserver {
  late List<GroupchatMessage> _messages;
  final TextEditingController _composerController = TextEditingController();
  final ScrollController _messageScrollController = ScrollController();
  bool _loading = false;
  StreamSubscription<GroupchatMessage>? _streamSub;
  int _latestSequenceNo = 0;

  List<String?> get _typingNicknames => const <String?>[];

  bool get _canUseRemote {
    return widget.chatRepository != null &&
        widget.currentUserId != null &&
        widget.currentUserId!.isNotEmpty &&
        widget.room.roomId.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _messages = const [];
    _bootstrapMessages();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _streamSub?.cancel();
    _composerController.dispose();
    _messageScrollController.dispose();
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
    var loadedMessages = false;
    try {
      final fetched = await widget.chatRepository!.getMessages(
        roomId: widget.room.roomId,
        userId: widget.currentUserId!,
        authToken: widget.authToken,
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
      loadedMessages = true;
      unawaited(_persistLatestSequenceNo());
      unawaited(_markRoomRead());
      _restartMessageStream();
    } catch (error, stackTrace) {
      if (_messages.isEmpty) {
        _showError(
          'Room unavailable or inactive.',
          operation: 'load_messages',
          technicalMessage: error.toString(),
          error: error,
          stackTrace: stackTrace,
        );
      }
    } finally {
      if (loadedMessages && _streamSub == null) {
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
          authToken: widget.authToken,
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
          unawaited(_markRoomRead());
          _scrollMessagesToBottom();
          unawaited(_persistLatestSequenceNo());
        }, onError: _handleMessageStreamError);
  }

  void _restartMessageStream() {
    if (!_canUseRemote) {
      return;
    }
    _startMessageStream();
  }

  void _handleMessageStreamError(Object error, StackTrace stackTrace) {
    _streamSub?.cancel();
    _streamSub = null;
    if (!mounted) {
      return;
    }
    if (_messages.isEmpty) {
      _showError(
        'Room updates unavailable.',
        operation: 'stream_messages',
        technicalMessage: error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    } else if (kDebugMode) {
      debugPrint('STREAM_MESSAGES_FAILED: $error');
    }
  }

  Future<void> _sendMessage() async {
    final text = _composerController.text.trim();
    if (text.isEmpty) {
      return;
    }
    if (!_canUseRemote) {
      _showError('Chat backend unavailable.', operation: 'send_text');
      return;
    }

    try {
      await widget.chatRepository!.sendTextMessage(
        roomId: widget.room.roomId,
        senderUserId: widget.currentUserId!,
        content: text,
        authToken: widget.authToken,
      );
      _composerController.clear();
      await _loadMessages();
      _scrollMessagesToBottom();
    } catch (error, stackTrace) {
      _showError(
        'Could not send message.',
        operation: 'send_text',
        technicalMessage: error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onMessageLongPress(GroupchatMessage message) async {
    if (!_canUseRemote) {
      return;
    }
    if (message.messageId.isEmpty) {
      return;
    }

    final shouldDelete = await showModalBottomSheet<bool>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Delete message'),
            onTap: () => Navigator.of(context).pop(true),
          ),
        );
      },
    );
    if (shouldDelete != true || !mounted) {
      return;
    }

    await _deleteMessage(message);
  }

  Future<void> _deleteMessage(GroupchatMessage message) async {
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      return;
    }

    try {
      await repo.deleteMessage(
        roomId: widget.room.roomId,
        messageId: message.messageId,
        ownerUserId: userId,
      );
      _showInfo('Message deleted.');
      await _loadMessages();
    } catch (error, stackTrace) {
      _showError(
        'Could not delete message. Owner permission required.',
        operation: 'delete_message',
        technicalMessage: error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _showRoomOptions() async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: ListTile(
            leading: const Icon(Icons.delete_sweep_outlined),
            title: const Text('Deactivate room'),
            onTap: () => Navigator.of(context).pop('deactivate'),
          ),
        );
      },
    );
    if (selected == 'deactivate' && mounted) {
      await _deactivateRoom();
    }
  }

  Future<void> _deactivateRoom() async {
    if (!_canUseRemote) {
      _showError('Chat backend unavailable.', operation: 'deactivate_room');
      return;
    }
    final repo = widget.chatRepository;
    final userId = widget.currentUserId;
    if (repo == null || userId == null || userId.isEmpty) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deactivate room?'),
          content: const Text(
            'This room will be deactivated and removed from active chat.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Deactivate'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    try {
      await repo.deactivateRoom(
        roomId: widget.room.roomId,
        ownerUserId: userId,
      );
      widget.onRoomDeactivated?.call(widget.room.roomId);
      _showInfo('Room deactivated.');
      widget.onBack?.call();
    } catch (error, stackTrace) {
      _showError(
        'Could not deactivate room. Owner permission required.',
        operation: 'deactivate_room',
        technicalMessage: error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _showInfo(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: palette.surfaceContainerLow,
      appBar: _GroupchatRoomAppBar(
        room: widget.room,
        onBack: widget.onBack,
        onRoomOptionsPressed: () {
          _showRoomOptions();
        },
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: _chatContentMaxWidth,
                  ),
                  child: ListView(
                    controller: _messageScrollController,
                    padding: _messageListPadding,
                    children: [
                      if (_loading)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: LinearProgressIndicator(minHeight: 2),
                        ),
                      _MessageList(
                        messages: _messages,
                        onMessageLongPress: _onMessageLongPress,
                      ),
                      const SizedBox(height: 22),
                      const _LiveDropPreview(),
                      const SizedBox(height: 22),
                      const _SuggestionChips(),
                    ],
                  ),
                ),
              ),
            ),
            TypingIndicator(typingNicknames: _typingNicknames),
            ChatInputBar(
              controller: _composerController,
              onSend: _sendMessage,
              onPickAttachment: _showAttachmentOptions,
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

  void _scrollMessagesToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_messageScrollController.hasClients) {
        return;
      }
      _messageScrollController.animateTo(
        _messageScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
    });
  }

  Future<void> _markRoomRead() async {
    final repo = widget.chatRepository;
    final roomId = widget.room.roomId;
    if (repo == null || roomId.isEmpty || widget.authToken.trim().isEmpty) {
      return;
    }
    try {
      await repo.markChatRoomRead(roomId: roomId, authToken: widget.authToken);
    } catch (_) {
      // Keep chat usable if read-state sync fails.
    }
  }

  Future<void> _showAttachmentOptions() async {
    final option = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('Image'),
                    onTap: () => Navigator.of(context).pop('image'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.insert_drive_file_outlined),
                    title: const Text('File'),
                    onTap: () => Navigator.of(context).pop('file'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (option == 'image') {
      await _pickAndSendImage();
      return;
    }
    if (option == 'file') {
      await _pickAndSendFile();
      return;
    }
  }

  Future<void> _pickAndSendImage() async {
    if (!_canUseRemote) {
      _showError('Chat backend unavailable.', operation: 'send_image');
      return;
    }
    final userId = widget.currentUserId;
    final repo = widget.chatRepository;
    if (userId == null || userId.isEmpty || repo == null) {
      return;
    }

    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }

    final filename = file.name.trim().isEmpty ? 'image.jpg' : file.name.trim();
    final contentType = _resolveImageContentType(file, filename);
    final bytes = await file.readAsBytes();
    final createContentType = contentType;
    final putContentType = contentType;

    try {
      _logUploadMime(
        operation: 'send_image',
        createContentType: createContentType,
        putContentType: putContentType,
      );
      final target = await repo.createAttachmentUploadURL(
        userId: userId,
        roomId: widget.room.roomId,
        fileName: filename,
        contentType: createContentType,
        authToken: widget.authToken,
      );
      await repo.uploadToSignedUrl(
        uploadUrl: target.uploadUrl,
        contentType: putContentType,
        bytes: bytes,
      );
      await _retrySendImageMessage(
        roomId: widget.room.roomId,
        senderUserId: userId,
        imageUrl: target.fileUrl,
      );
      await _loadMessages();
      _showInfo('Image sent: $filename');
    } catch (error, stackTrace) {
      final detail = _describeAttachmentError(error);
      _showError(
        'Could not send image.',
        operation: 'send_image',
        technicalMessage:
            'create_content_type=$createContentType put_content_type=$putContentType detail=$detail',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _pickAndSendFile() async {
    if (!_canUseRemote) {
      _showError('Chat backend unavailable.', operation: 'send_file');
      return;
    }
    final userId = widget.currentUserId;
    final repo = widget.chatRepository;
    if (userId == null || userId.isEmpty || repo == null) {
      return;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      allowMultiple: false,
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.first;
    final filename = file.name.trim().isEmpty ? 'attachment' : file.name.trim();
    final contentType = _guessContentType(
      filename,
      fallback: 'application/pdf',
    );
    final createContentType = contentType;
    final putContentType = contentType;
    final bytes = file.bytes ?? await _readBytesFromPath(file.path);
    if (bytes == null || bytes.isEmpty) {
      _showError('Could not read file bytes.', operation: 'send_file');
      return;
    }

    try {
      _logUploadMime(
        operation: 'send_file',
        createContentType: createContentType,
        putContentType: putContentType,
      );
      final target = await repo.createAttachmentUploadURL(
        userId: userId,
        roomId: widget.room.roomId,
        fileName: filename,
        contentType: createContentType,
        authToken: widget.authToken,
      );
      await repo.uploadToSignedUrl(
        uploadUrl: target.uploadUrl,
        contentType: putContentType,
        bytes: bytes,
      );
      await _retrySendFileMessage(
        roomId: widget.room.roomId,
        senderUserId: userId,
        fileUrl: target.fileUrl,
        fileName: filename,
        contentType: contentType,
      );
      await _loadMessages();
      _showInfo('File sent: $filename');
    } catch (error, stackTrace) {
      final detail = _describeAttachmentError(error);
      _showError(
        'Could not send file.',
        operation: 'send_file',
        technicalMessage:
            'create_content_type=$createContentType put_content_type=$putContentType detail=$detail',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _retrySendImageMessage({
    required String roomId,
    required String senderUserId,
    required String imageUrl,
  }) async {
    try {
      await widget.chatRepository!.sendImageMessage(
        roomId: roomId,
        senderUserId: senderUserId,
        imageUrl: imageUrl,
        authToken: widget.authToken,
      );
    } catch (_) {
      await widget.chatRepository!.sendImageMessage(
        roomId: roomId,
        senderUserId: senderUserId,
        imageUrl: imageUrl,
        authToken: widget.authToken,
      );
    }
  }

  Future<void> _retrySendFileMessage({
    required String roomId,
    required String senderUserId,
    required String fileUrl,
    required String fileName,
    required String contentType,
  }) async {
    try {
      await widget.chatRepository!.sendFileMessage(
        roomId: roomId,
        senderUserId: senderUserId,
        fileUrl: fileUrl,
        fileName: fileName,
        contentType: contentType,
        authToken: widget.authToken,
      );
    } catch (_) {
      await widget.chatRepository!.sendFileMessage(
        roomId: roomId,
        senderUserId: senderUserId,
        fileUrl: fileUrl,
        fileName: fileName,
        contentType: contentType,
        authToken: widget.authToken,
      );
    }
  }

  Future<List<int>?> _readBytesFromPath(String? path) async {
    if (path == null || path.isEmpty) {
      return null;
    }
    return File(path).readAsBytes();
  }

  String _guessContentType(String fileName, {required String fallback}) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    if (lower.endsWith('.png')) {
      return 'image/png';
    }
    if (lower.endsWith('.gif')) {
      return 'image/gif';
    }
    if (lower.endsWith('.webp')) {
      return 'image/webp';
    }
    if (lower.endsWith('.pdf')) {
      return 'application/pdf';
    }
    return fallback;
  }

  String _resolveImageContentType(XFile file, String fileName) {
    final mimeType = file.mimeType?.trim();
    if (mimeType != null && mimeType.isNotEmpty) {
      return mimeType;
    }
    return _guessContentType(fileName, fallback: 'image/jpeg');
  }

  String _describeAttachmentError(Object error) {
    if (error is GrpcError) {
      return 'grpc ${error.codeName}: ${error.message}';
    }
    if (error is SocketException) {
      return 'network: ${error.message}';
    }
    if (error is HttpException) {
      return error.message;
    }
    return error.toString();
  }

  void _showError(
    String message, {
    required String operation,
    String? technicalMessage,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _showInfo(message);
    if (!kDebugMode) {
      return;
    }
    unawaited(
      _appendErrorJsonl(
        operation: operation,
        userFacingMessage: message,
        technicalMessage: technicalMessage ?? error?.toString() ?? message,
        error: error,
        stackTrace: stackTrace,
      ),
    );
  }

  Future<void> _appendErrorJsonl({
    required String operation,
    required String userFacingMessage,
    required String technicalMessage,
    Object? error,
    StackTrace? stackTrace,
  }) async {
    try {
      final grpcStatusCode = error is GrpcError ? error.codeName : '';
      final summarizedTechnical = _summarizeTechnicalMessage(
        technicalMessage: technicalMessage,
        error: error,
      );
      final entry = jsonEncode({
        'timestamp': DateTime.now().toUtc().toIso8601String(),
        'feature': 'chat',
        'screen': 'groupchat_room',
        'operation': operation,
        'userFacingMessage': _sanitizeForLog(userFacingMessage),
        'technicalMessage': _sanitizeForLog(summarizedTechnical),
        'grpcStatusCode': grpcStatusCode,
      });
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/flutter_errors.jsonl');
      await file.writeAsString('$entry\n', mode: FileMode.append, flush: true);
      debugPrint('DEV_ERROR_JSONL: $entry');
    } catch (_) {
      // Do not break UX if local dev logging cannot write on this platform.
    }
  }

  String _sanitizeForLog(String value) {
    var sanitized = value;
    sanitized = sanitized.replaceAll(
      RegExp(r'https?:\/\/\S+'),
      '[REDACTED_URL]',
    );
    sanitized = sanitized.replaceAll(
      RegExp(r'<StringToSign>.*?<\/StringToSign>', dotAll: true),
      '<StringToSign>[REDACTED]</StringToSign>',
    );
    sanitized = sanitized.replaceAll(
      RegExp(r'<CanonicalRequest>.*?<\/CanonicalRequest>', dotAll: true),
      '<CanonicalRequest>[REDACTED]</CanonicalRequest>',
    );
    sanitized = sanitized.replaceAll(
      RegExp(
        r'(authorization|token|password|credential)[^,\n]*',
        caseSensitive: false,
      ),
      '[REDACTED_SECRET]',
    );
    return sanitized;
  }

  String _summarizeTechnicalMessage({
    required String technicalMessage,
    Object? error,
  }) {
    if (error is GrpcError) {
      return 'grpc ${error.codeName}';
    }
    final uploadStatus = RegExp(
      r'upload failed with status (\d{3})',
    ).firstMatch(technicalMessage)?.group(1);
    if (uploadStatus != null) {
      return 'upload failed with status $uploadStatus';
    }
    if (error is SocketException) {
      return 'network error';
    }
    if (error is HttpException) {
      return 'http error';
    }
    return 'unexpected error';
  }

  void _logUploadMime({
    required String operation,
    required String createContentType,
    required String putContentType,
  }) {
    if (!kDebugMode) {
      return;
    }
    debugPrint(
      'DEV_UPLOAD_MIME: op=$operation create_content_type=$createContentType put_content_type=$putContentType',
    );
  }
}

List<GroupchatMessage> _normalizeMessages(List<GroupchatMessage> messages) {
  final cloned = [...messages];
  cloned.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
  return cloned;
}

bool isSameDay(DateTime a, DateTime b) {
  final localA = a.toLocal();
  final localB = b.toLocal();
  return localA.year == localB.year &&
      localA.month == localB.month &&
      localA.day == localB.day;
}

String formatChatDate(DateTime date) {
  final localDate = date.toLocal();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final messageDay = DateTime(localDate.year, localDate.month, localDate.day);

  if (isSameDay(messageDay, today)) {
    return 'Today';
  }
  if (isSameDay(messageDay, yesterday)) {
    return 'Yesterday';
  }

  final month = localDate.month.toString().padLeft(2, '0');
  final day = localDate.day.toString().padLeft(2, '0');
  return '${localDate.year}.$month.$day';
}

bool shouldShowDateDivider(
  GroupchatMessage currentMessage,
  GroupchatMessage? previousMessage,
) {
  if (previousMessage == null) {
    return true;
  }
  return !isSameDay(
    _messageDividerDate(currentMessage),
    _messageDividerDate(previousMessage),
  );
}

DateTime _messageDividerDate(GroupchatMessage message) {
  return (message.sentAt ?? DateTime.now()).toLocal();
}

class _GroupchatRoomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _GroupchatRoomAppBar({
    required this.room,
    this.onBack,
    this.onRoomOptionsPressed,
  });

  final GroupchatRoomSummary room;
  final VoidCallback? onBack;
  final VoidCallback? onRoomOptionsPressed;

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
          onPressed: onRoomOptionsPressed,
          tooltip: 'Room options',
          icon: const Icon(Icons.more_vert, color: AppColors.primaryContainer),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class DateDivider extends StatelessWidget {
  const DateDivider({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final label = formatChatDate(date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 1,
              thickness: 1,
              color: palette.outlineVariant.withValues(alpha: 0.55),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: palette.surfaceContainerLowest.withValues(alpha: 0.78),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: palette.outlineVariant.withValues(alpha: 0.45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: palette.secondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              height: 1,
              thickness: 1,
              color: palette.outlineVariant.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({required this.messages, this.onMessageLongPress});

  final List<GroupchatMessage> messages;
  final ValueChanged<GroupchatMessage>? onMessageLongPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < messages.length; index++) ...[
          if (shouldShowDateDivider(
            messages[index],
            index == 0 ? null : messages[index - 1],
          )) ...[
            DateDivider(date: _messageDividerDate(messages[index])),
            const SizedBox(height: 16),
          ],
          MessageBubble(
            message: messages[index],
            onLongPress: onMessageLongPress,
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message, this.onLongPress});

  final GroupchatMessage message;
  final ValueChanged<GroupchatMessage>? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress == null ? null : () => onLongPress!(message),
      child: message.isOutgoing
          ? _OutgoingMessage(message: message)
          : _IncomingMessage(message: message),
    );
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
        constraints: const BoxConstraints(maxWidth: _messageBubbleMaxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _SenderAvatar(
              avatarUrl: message.senderAvatarUrl,
              senderName: message.senderName,
              onTap: () => _showChatProfile(
                context,
                senderId: message.senderId,
                senderName: message.senderName,
                avatarUrl: message.senderAvatarUrl,
              ),
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
                  if (message.timeLabel.trim().isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      message.timeLabel,
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
        constraints: const BoxConstraints(maxWidth: _messageBubbleMaxWidth),
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
            if (message.deliveryLabel != null ||
                message.timeLabel.trim().isNotEmpty) ...[
              const SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message.timeLabel.trim().isNotEmpty)
                    Text(
                      message.timeLabel,
                      style: TextStyle(
                        color: palette.secondary,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (message.timeLabel.trim().isNotEmpty &&
                      message.deliveryLabel != null)
                    const SizedBox(width: 6),
                  if (message.deliveryLabel != null)
                    Text(
                      message.deliveryLabel!,
                      style: TextStyle(
                        color: palette.secondary,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
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
      final caption = _imageCaption(message.text);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              final uri = Uri.tryParse(message.imageUrl);
              if (uri == null) {
                return;
              }
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 220,
                height: 160,
                child: Image.network(
                  message.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            color: textColor.withValues(alpha: 0.8),
                            size: 28,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Tap to open image',
                            style: TextStyle(
                              color: textColor.withValues(alpha: 0.9),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (caption.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              caption,
              style: TextStyle(color: textColor, fontSize: 15, height: 1.4),
            ),
          ],
        ],
      );
    }

    final shouldRenderFile =
        message.contentType == GroupchatMessageContentType.file &&
        message.fileUrl.trim().isNotEmpty;
    if (shouldRenderFile) {
      final filename = message.fileName.trim().isEmpty
          ? 'Attachment'
          : message.fileName.trim();
      final extension = _fileExtension(filename).toUpperCase();
      final badgeLabel = extension.isEmpty ? 'FILE' : extension;
      final icon = _fileIcon(filename, message.fileContentType);
      return InkWell(
        onTap: () async {
          final uri = Uri.tryParse(message.fileUrl);
          if (uri == null) {
            return;
          }
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 20, color: textColor),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      filename,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Text(
      message.text,
      style: TextStyle(color: textColor, fontSize: 15, height: 1.4),
    );
  }

  String _imageCaption(String rawText) {
    final trimmed = rawText.trim();
    if (trimmed.isEmpty || trimmed == '[Image]') {
      return '';
    }
    return trimmed;
  }

  String _fileExtension(String filename) {
    final dot = filename.lastIndexOf('.');
    if (dot < 0 || dot == filename.length - 1) {
      return '';
    }
    return filename.substring(dot + 1);
  }

  IconData _fileIcon(String filename, String contentType) {
    final lowerName = filename.toLowerCase();
    final lowerType = contentType.toLowerCase();
    if (lowerType.contains('pdf') || lowerName.endsWith('.pdf')) {
      return Icons.picture_as_pdf_outlined;
    }
    if (lowerType.startsWith('image/') ||
        lowerName.endsWith('.png') ||
        lowerName.endsWith('.jpg') ||
        lowerName.endsWith('.jpeg') ||
        lowerName.endsWith('.webp')) {
      return Icons.image_outlined;
    }
    return Icons.insert_drive_file_outlined;
  }
}

class _SenderAvatar extends StatelessWidget {
  const _SenderAvatar({
    required this.avatarUrl,
    required this.senderName,
    this.onTap,
  });

  final String? avatarUrl;
  final String? senderName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final url = avatarUrl?.trim() ?? '';

    final Widget avatar;
    if (url.isNotEmpty) {
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AppNetworkImage(url: url, width: 40, height: 40),
      );
    } else {
      final fallbackChar = _avatarInitial(senderName);
      avatar = Container(
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

    if (onTap == null) return avatar;
    return GestureDetector(onTap: onTap, child: avatar);
  }
}

String _avatarInitial(String? senderName) {
  final normalized = (senderName ?? '').trim();
  if (normalized.isEmpty) {
    return 'M';
  }
  return normalized.substring(0, 1).toUpperCase();
}

void _showChatProfile(
  BuildContext context, {
  String? senderId,
  String? senderName,
  String? avatarUrl,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    isScrollControlled: true,
    builder: (_) => _ChatProfileBottomSheet(
      senderId: senderId,
      senderName: senderName,
      avatarUrl: avatarUrl,
    ),
  );
}

int _mockAlcoholScore(String? name) {
  return ((name ?? '').hashCode.abs() % 79) + 20;
}

String _alcoholTierLabel(int score) {
  if (score <= 40) return 'Novice Sipper';
  if (score <= 65) return 'Draft Enthusiast';
  if (score <= 82) return 'Barrel Aged';
  return 'Master Blender';
}

class _ChatProfileBottomSheet extends ConsumerStatefulWidget {
  const _ChatProfileBottomSheet({
    this.senderId,
    this.senderName,
    this.avatarUrl,
  });

  final String? senderId;
  final String? senderName;
  final String? avatarUrl;

  @override
  ConsumerState<_ChatProfileBottomSheet> createState() =>
      _ChatProfileBottomSheetState();
}

class _ChatProfileBottomSheetState
    extends ConsumerState<_ChatProfileBottomSheet> {
  PublicUserProfile? _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    if (widget.senderId != null) _loadProfile();
  }

  Future<void> _loadProfile() async {
    setState(() => _loading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      final profile = await repo.getUser(widget.senderId!);
      if (mounted) setState(() => _profile = profile);
    } catch (_) {
      // fall back to local mock data on error
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    final name = _profile?.nickname?.trim().isNotEmpty == true
        ? _profile!.nickname!
        : (widget.senderName?.trim().isNotEmpty == true
            ? widget.senderName!
            : 'Member');
    final url =
        (_profile?.profileImageUrl ?? widget.avatarUrl)?.trim() ?? '';
    final score =
        _profile != null ? _profile!.alcoholScore : _mockAlcoholScore(widget.senderName);
    final tierLabel = _alcoholTierLabel(score);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 96),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 48,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4D4D4),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 24),
                // Avatar
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: ClipOval(
                      child: _loading
                          ? ColoredBox(
                              color: palette.surfaceContainerLow,
                              child: const SizedBox.expand(),
                            )
                          : url.isNotEmpty
                              ? AppNetworkImage(url: url, width: 120, height: 120)
                              : ColoredBox(
                                  color: palette.surfaceContainerLow,
                                  child: Center(
                                    child: Text(
                                      _avatarInitial(widget.senderName),
                                      style: TextStyle(
                                        color: palette.onSurfaceVariant,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Nickname
                _loading
                    ? Container(
                        width: 120,
                        height: 24,
                        decoration: BoxDecoration(
                          color: palette.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      )
                    : Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF151C23),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                const SizedBox(height: 32),
                // Score header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'ALCOHOL SCORE',
                      style: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Text(
                      '$score%',
                      style: const TextStyle(
                        color: Color(0xFFA04100),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: SizedBox(
                    height: 16,
                    child: Stack(
                      children: [
                        const ColoredBox(
                          color: Color(0xFFDBE3EC),
                          child: SizedBox.expand(),
                        ),
                        FractionallySizedBox(
                          widthFactor: score / 100,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFA04100), Color(0xFFFF7E36)],
                              ),
                              borderRadius: BorderRadius.circular(999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x4DA04100),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: const SizedBox.expand(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Tier label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tierLabel,
                    style: const TextStyle(
                      color: Color(0xFF737373),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Close button
          Positioned(
            top: 24,
            right: 24,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Material(
                color: palette.surfaceContainerLow,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: palette.secondary, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
                  'New bottle stock is live nearby.',
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
