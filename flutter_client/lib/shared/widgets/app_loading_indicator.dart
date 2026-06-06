import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.label = '불러오는 중',
    this.compact = false,
  });

  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spinnerSize = compact ? 18.0 : 32.0;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: spinnerSize,
            height: spinnerSize,
            child: CircularProgressIndicator(
              strokeWidth: compact ? 2 : 3,
              color: AppColors.primaryContainer,
            ),
          ),
          SizedBox(height: compact ? 8 : 12),
          Text(
            label,
            style: TextStyle(
              color: palette.secondary,
              fontSize: compact ? 12 : 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
