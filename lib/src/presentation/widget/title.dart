import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class MovieTitle extends StatelessWidget {
  static const double movieTitleFontSize = 25.0;

  final String title;

  const MovieTitle({
    super.key,
    required this.title,
  });

  final TextStyle titleTextStyle = const TextStyle(
    fontSize: 40,
    fontFamily: Constants.caprasimoFontFamily,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: titleTextStyle,
      ),
    );
  }
}
