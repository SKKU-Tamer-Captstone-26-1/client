import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style:
            OutlinedButton.styleFrom(
              foregroundColor: palette.onSurface,
              backgroundColor: palette.surfaceContainerLowest,
              side: BorderSide(
                color: palette.outlineVariant.withValues(alpha: 0.82),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                palette.surfaceContainerLow.withValues(alpha: 0.55),
              ),
            ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: palette.onSurface,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: palette.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: GoogleLogo(size: 18),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Continue with Google',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
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
