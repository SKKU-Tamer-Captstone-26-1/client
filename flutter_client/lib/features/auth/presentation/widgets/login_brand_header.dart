import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final logoAsset = Theme.of(context).brightness == Brightness.dark
        ? 'assets/on-the-block-white.svg'
        : 'assets/on-the-block-dark.svg';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: palette.primaryContainer,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(logoAsset, fit: BoxFit.cover),
        ),
        const SizedBox(height: 32),
        Text(
          'ON THE BLOCK',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 12),
        Text(
          'HYPERLOCAL LIQUOR COMMUNITY',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: palette.secondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.2,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
