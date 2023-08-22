import 'package:flutter/material.dart';
import '../shared/constants.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key, required this.text, this.align});

  static const double dsOverviewFontSize = 17.0;
  final String text;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      softWrap: true,
      text,
      style: const TextStyle(
        fontFamily: ConstantsClass.textFont,
        fontSize: dsOverviewFontSize,
        color: Colors.white,
      ),
    );
  }
}
