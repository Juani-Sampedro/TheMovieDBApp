import 'package:flutter/material.dart';

import '../../core/util/colors.dart';

class DescriptionIcon extends StatelessWidget {
  const DescriptionIcon({
    super.key,
    required this.icon,
    required this.numberOfIconsCreated,
  });

  final IconData icon;
  final int numberOfIconsCreated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < numberOfIconsCreated; index++)
          Icon(
            icon,
            color: AppColors.iconColor,
          ),
      ],
    );
  }
}
