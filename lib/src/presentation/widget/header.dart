import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/util/colors.dart';

class Header extends StatelessWidget {
  final double hdImageWidth = 450;
  final double hdImageHeight = 300;
  final List<double> linearGradientStops = [
    0.4,
    0.6,
    1,
  ];
  final String backdrop;

  final double leftAndTop = 0;

  Header({
    super.key,
    required this.backdrop,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: ShaderMask(
        blendMode: BlendMode.dstIn,
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              AppColors.linearGradientColor,
              AppColors.linearGradientColor,
              Colors.transparent,
            ],
            stops: linearGradientStops,
          ).createShader(
            Rect.fromLTRB(
              leftAndTop,
              leftAndTop,
              rect.width,
              rect.height,
            ),
          );
        },
        child: CachedNetworkImage(
          imageUrl: backdrop,
          fit: BoxFit.cover,
          width: hdImageWidth,
          height: hdImageHeight,
          progressIndicatorBuilder: (
            BuildContext context,
            String url,
            DownloadProgress progress,
          ) =>
              Center(
            child: CircularProgressIndicator(
              value: progress.progress,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}
