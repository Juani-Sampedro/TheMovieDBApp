import 'package:flutter/material.dart';
import '../shared/constants.dart';

class MovieTitle extends StatelessWidget {
  static const double movieTitleFontSize = 25.0;

  final String title;

  const MovieTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: ConstantsClass.textFont,
          fontSize: movieTitleFontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
