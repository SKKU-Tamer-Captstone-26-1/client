import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoAsset = isDark
        ? 'assets/on-the-block-white.svg'
        : 'assets/on-the-block-dark.svg';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0F0C0A) : palette.onSurface,
            shape: BoxShape.circle,
            border: Border.all(
              color: palette.primaryContainer.withValues(alpha: 0.42),
              width: 1.4,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 12,
                offset: Offset(0, 5),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(logoAsset, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ON THE BLOCK',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: palette.primaryContainer,
                  fontSize: 26,
                  height: 1,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'PREMIUM LOCAL BOTTLE CLUB',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: palette.onSurfaceVariant,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.7,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
