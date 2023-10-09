import 'package:flutter/material.dart';

import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.routeToGo,
  });

  final TextStyle itemsTextStyle = const TextStyle(
    fontFamily: Constants.appFontFamily,
    fontSize: 25,
  );
  final double sizedBoxWidth = 10;
  final IconData? icon;
  final String text;
  final String routeToGo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: AppColors.appNameFontColor,
          ),
          SizedBox(width: sizedBoxWidth),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
      textColor: AppColors.appNameFontColor,
      titleTextStyle: itemsTextStyle,
      onTap: () {
        Navigator.pushNamed(
          context,
          routeToGo,
        );
      },
    );
  }
}
