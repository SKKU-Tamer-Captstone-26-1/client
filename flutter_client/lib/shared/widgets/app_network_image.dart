import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }

        return ColoredBox(color: palette.surfaceContainerLow);
      },
      errorBuilder: (context, error, stackTrace) {
        return ColoredBox(
          color: palette.surfaceContainerLow,
          child: Icon(Icons.image_not_supported, color: palette.secondary),
        );
      },
    );
  }
}
