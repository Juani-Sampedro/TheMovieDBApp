import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.text,
    this.align,
  });

  static const double dsOverviewFontSize = 17.0;
  final String text;
  final TextAlign? align;
  final TextStyle descriptionTextStyle = const TextStyle(
    fontSize: dsOverviewFontSize,
    fontFamily: ConstantsClass.tekturFontFamily,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      softWrap: true,
      text,
      style: descriptionTextStyle,
    );
  }
}
