import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  static const double hdImageWidth = 450;
  static const double hdImageHeight = 300;

  final String backdrop;

  const Header({
    super.key,
    required this.backdrop,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        backdrop,
        fit: BoxFit.cover,
        width: hdImageWidth,
        height: hdImageHeight,
      ),
    );
  }
}
