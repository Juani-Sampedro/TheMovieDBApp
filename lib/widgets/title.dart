import 'package:flutter/material.dart';
import 'package:movie_db_app/shared/constants.dart';

class MovieTitle extends StatelessWidget {
  static const double movieTitleFontSize = 25.0;

  final String title;

  const MovieTitle({
    super.key,
    required this.title,
  });

  final TextStyle titleTextStyle = const TextStyle(
    fontSize: 24,
    fontFamily: ConstantsClass.homeTextFontFamily,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: titleTextStyle,
      ),
    );
  }
}
