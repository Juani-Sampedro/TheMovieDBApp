import 'package:flutter/material.dart';

class DescriptionIcon extends StatelessWidget {
  const DescriptionIcon({
    super.key,
    required this.icon,
    required this.numberOfIconsCreated,
  });

  static const Color iconColor = Colors.yellow;

  final IconData icon;
  final int numberOfIconsCreated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < numberOfIconsCreated; index++)
          Icon(
            icon,
            color: iconColor,
          ),
      ],
    );
  }
}
