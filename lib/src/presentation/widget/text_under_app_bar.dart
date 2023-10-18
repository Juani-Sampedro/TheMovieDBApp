import 'package:flutter/material.dart';

import '../../core/util/colors.dart';

class TextUnderAppBar extends StatelessWidget {
  const TextUnderAppBar({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;
  final TextStyle textStyle = const TextStyle(
    color: AppColors.appBarColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(
          text,
          style: textStyle,
        ),
        icon,
      ],
    );
  }
}
