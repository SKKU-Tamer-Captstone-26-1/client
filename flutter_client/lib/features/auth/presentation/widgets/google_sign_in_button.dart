import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style:
            OutlinedButton.styleFrom(
              foregroundColor: palette.onSurface,
              backgroundColor: palette.surfaceContainerLowest,
              side: BorderSide(color: palette.outlineVariant),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                palette.surfaceContainerLow.withValues(alpha: 0.55),
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const GoogleLogo(size: 22),
            const SizedBox(width: 16),
            Text(
              'Continue with Google',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key, this.size = 22});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.square(size), painter: _GoogleLogoPainter());
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.18;
    final rect =
        Offset(stroke / 2, stroke / 2) &
        Size(size.width - stroke, size.height - stroke);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = stroke;

    canvas.drawArc(
      rect,
      -0.18,
      1.58,
      false,
      paint..color = const Color(0xFF4285F4),
    );
    canvas.drawArc(
      rect,
      1.4,
      1.7,
      false,
      paint..color = const Color(0xFF34A853),
    );
    canvas.drawArc(
      rect,
      2.9,
      1.1,
      false,
      paint..color = const Color(0xFFFBBC05),
    );
    canvas.drawArc(
      rect,
      3.95,
      1.5,
      false,
      paint..color = const Color(0xFFEA4335),
    );

    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(
      Offset(size.width * 0.55, size.height * 0.5),
      Offset(size.width * 0.92, size.height * 0.5),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
