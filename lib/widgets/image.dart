import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imagePath,
  });

  static const double imContainerWidth = 250;
  static const double imContainerHeight = 250;
  static const double imBoxDecorationWidth = 2.5;
  static const double imBorderRadius = 20;
  static const double imBorderSize = 48;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imContainerHeight,
      width: imContainerWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imBorderRadius),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(imBorderSize),
          child: Image.network(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
