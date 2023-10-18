import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imagePath,
  });

  static const double imContainerWidth = 250;
  static const double imContainerHeight = 250;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imContainerHeight,
      width: imContainerWidth,
      child: CachedNetworkImage(
        imageUrl: imagePath,
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
    );
  }
}
