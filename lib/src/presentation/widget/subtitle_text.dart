import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required this.text,
  });

  final String text;
  final TextStyle subtitleTextStyle = const TextStyle(
    fontSize: 16,
    fontFamily: Constants.homeTextFontFamily,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: AppColors.iconInTextUnderAppBarColor,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: subtitleTextStyle,
    );
  }
}
