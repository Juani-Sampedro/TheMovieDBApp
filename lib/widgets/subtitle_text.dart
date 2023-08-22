import 'package:flutter/material.dart';
import '../shared/constants.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required this.text,
  });

  final String text;
  static const double subtitleTextFontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: ConstantsClass.textFont,
        fontSize: subtitleTextFontSize,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
