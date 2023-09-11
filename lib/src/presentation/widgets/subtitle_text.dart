import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required this.text,
  });

  final String text;
  final TextStyle subtitleTextStyle = const TextStyle(
    fontSize: 15,
    fontFamily: ConstantsClass.homeTextFontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: subtitleTextStyle,
    );
  }
}
