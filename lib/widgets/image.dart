import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imagePath,
  });

  static const double imContainerWidth = 300;
  static const double imContainerHeight = 300;
  static const double imBoxDecorationWidth = 2.5;
  static const double imBorderRadius = 20;
  static const double imBorderSize = 48;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imContainerHeight,
      width: imContainerWidth,
      decoration: BoxDecoration(
        border: Border.all(
          width: imBoxDecorationWidth,
          color: Colors.black,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imBorderRadius),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(imBorderSize),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
