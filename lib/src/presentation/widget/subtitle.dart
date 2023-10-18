import 'package:flutter/material.dart';
import 'subtitle_text.dart';

class MovieSubtitle extends StatelessWidget {
  final String originalTitle;
  final String dateRelease;

  const MovieSubtitle({
    super.key,
    required this.originalTitle,
    required this.dateRelease,
  });

  final SizedBox sizedBox = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizedBox,
          SubtitleText(text: originalTitle),
          SubtitleText(text: dateRelease),
        ],
      ),
    );
  }
}
