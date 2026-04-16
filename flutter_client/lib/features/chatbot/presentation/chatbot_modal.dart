import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

Future<void> showChatbotModal(BuildContext context) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close chatbot',
    barrierColor: Colors.black.withValues(alpha: 0.42),
    transitionDuration: const Duration(milliseconds: 180),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const _ChatbotDialog();
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

class _ChatbotDialog extends StatelessWidget {
  const _ChatbotDialog();

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
              constraints: const BoxConstraints(maxWidth: 448, maxHeight: 618),
              child: Column(
                children: [
                  const _ChatbotHeader(),
                  const Expanded(child: _ChatHistory()),
                  _ChatInput(palette: palette),
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
  const _ChatbotHeader();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(bottom: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
              child: Text(
                'Chat with Neighborhood Guide',
                style: TextStyle(
                  color: palette.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
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
  const _ChatHistory();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return ColoredBox(
      color: palette.surfaceContainerLow.withValues(alpha: 0.35),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _GuideMessage(
            text:
                'Hi there! Looking for a specific bottle or a recommendation for a smooth Friday night in the neighborhood?',
            meta: 'Guide - 10:24 AM',
          ),
          SizedBox(height: 22),
          _UserMessage(
            text:
                "I'm looking for a Japanese Whisky under \$100 nearby. Any suggestions?",
            meta: 'You - 10:25 AM',
          ),
          SizedBox(height: 22),
          _GuideMessage(
            text:
                "Excellent choice! Suntory Toki is currently in stock at Village Spirits for \$48.99. It's great for highballs!",
            meta: 'Guide - 10:26 AM',
            chips: ['View Store', 'More options?'],
          ),
        ],
      ),
    );
  }
}

class _GuideMessage extends StatelessWidget {
  const _GuideMessage({required this.text, required this.meta, this.chips});

  final String text;
  final String meta;
  final List<String>? chips;

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
        const SizedBox(width: 12),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.surfaceContainerLowest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
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
                  Text(
                    text,
                    style: TextStyle(
                      color: palette.onSurfaceVariant,
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                  if (chips != null) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final chip in chips!)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: palette.surfaceContainerLowest,
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: palette.outlineVariant),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Text(
                                chip,
                                style: TextStyle(
                                  color: palette.secondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    meta.toUpperCase(),
                    style: TextStyle(
                      color: palette.secondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
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
  const _UserMessage({required this.text, required this.meta});

  final String text;
  final String meta;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 330),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surfaceContainerLowest,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            border: Border.all(
              color: AppColors.primaryContainer.withValues(alpha: 0.2),
              width: 2,
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: palette.onSurface,
                            fontSize: 14,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          meta.toUpperCase(),
                          style: TextStyle(
                            color: palette.secondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        border: Border(top: BorderSide(color: palette.outlineVariant)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: palette.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file, color: palette.secondary),
              ),
              Expanded(
                child: Text(
                  'Type your message...',
                  style: TextStyle(color: palette.secondary, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: IconButton.filled(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
