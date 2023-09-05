import 'package:flutter/material.dart';
import '../shared/constants.dart';

class AppBarPopUpItemRow extends StatelessWidget {
  const AppBarPopUpItemRow({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
  final TextStyle popupItemsTextStyle = const TextStyle(
    fontFamily: ConstantsClass.tekturFontFamily,
    fontWeight: FontWeight.bold,
    fontSize: ConstantsClass.homeIconFontSize,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          color: Colors.black,
          icon,
        ),
        Text(
          name,
          style: popupItemsTextStyle,
        ),
      ],
    );
  }
}
