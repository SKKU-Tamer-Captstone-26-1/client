import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onPickAttachment,
  });

  final TextEditingController controller;
  final Future<void> Function() onSend;
  final VoidCallback onPickAttachment;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  bool _isSending = false;

  bool get _hasText => widget.controller.text.trim().isNotEmpty;
  bool get _canSend => _hasText && !_isSending;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void didUpdateWidget(covariant ChatInputBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) {
      return;
    }
    oldWidget.controller.removeListener(_handleTextChanged);
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _handleSend() async {
    if (!_canSend) {
      return;
    }
    setState(() {
      _isSending = true;
    });
    try {
      await widget.onSend();
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 768),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton.filledTonal(
                  onPressed: widget.onPickAttachment,
                  tooltip: 'Add attachment',
                  style: IconButton.styleFrom(
                    backgroundColor: palette.surfaceContainerLow,
                    foregroundColor: palette.onSurfaceVariant,
                    shape: const CircleBorder(),
                    fixedSize: const Size(44, 44),
                  ),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 44,
                      maxHeight: 128,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: palette.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: palette.outlineVariant.withValues(alpha: 0.9),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: TextField(
                          controller: widget.controller,
                          minLines: 1,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 15,
                            height: 1.3,
                          ),
                          cursorColor: AppColors.primaryContainer,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: TextStyle(
                              color: palette.secondary,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: _canSend ? _handleSend : null,
                  tooltip: 'Send message',
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(const Size(44, 44)),
                    shape: WidgetStateProperty.all(const CircleBorder()),
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.disabled)) {
                        return palette.surfaceContainerLow;
                      }
                      return AppColors.primaryContainer;
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.disabled)) {
                        return palette.secondary.withValues(alpha: 0.48);
                      }
                      return Colors.white;
                    }),
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
