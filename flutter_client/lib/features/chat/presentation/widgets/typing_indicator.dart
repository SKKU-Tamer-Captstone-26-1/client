import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

const _typingIndicatorMaxWidth = 768.0;

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key, required this.typingNicknames});

  final List<String?> typingNicknames;

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _dotController;

  bool get _hasTypingUsers => widget.typingNicknames.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    if (_hasTypingUsers) {
      _dotController.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant TypingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_hasTypingUsers && !_dotController.isAnimating) {
      _dotController.repeat();
    } else if (!_hasTypingUsers && _dotController.isAnimating) {
      _dotController.stop();
    }
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasTypingUsers) {
      return const SizedBox.shrink();
    }

    final palette = context.palette;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _typingIndicatorMaxWidth),
          child: Align(
            alignment: Alignment.centerLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: palette.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: palette.outlineVariant.withValues(alpha: 0.55),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TypingDots(animation: _dotController),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        _label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: palette.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get _label {
    final typingNicknames = widget.typingNicknames;
    if (typingNicknames.isEmpty) {
      return '';
    }
    if (typingNicknames.length == 1) {
      final nickname = typingNicknames.single?.trim();
      if (nickname != null && nickname.isNotEmpty) {
        return '$nickname is typing...';
      }
      return 'Someone is typing...';
    }
    return '${typingNicknames.length} people are typing...';
  }
}

class _TypingDots extends StatelessWidget {
  const _TypingDots({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var index = 0; index < 3; index++) ...[
              _TypingDot(
                opacity: _dotOpacity(index, animation.value),
                scale: _dotScale(index, animation.value),
              ),
              if (index != 2) const SizedBox(width: 3),
            ],
          ],
        );
      },
    );
  }

  double _dotOpacity(int index, double value) {
    final phase = (value + index * 0.22) % 1.0;
    if (phase < 0.5) {
      return 0.35 + phase * 1.3;
    }
    return 1.0 - (phase - 0.5) * 1.3;
  }

  double _dotScale(int index, double value) {
    final opacity = _dotOpacity(index, value);
    return 0.75 + (opacity - 0.35) * 0.38;
  }
}

class _TypingDot extends StatelessWidget {
  const _TypingDot({required this.opacity, required this.scale});

  final double opacity;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: AppColors.primaryContainer.withValues(alpha: opacity),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
