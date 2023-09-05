import 'package:flutter/material.dart';
import 'subtitle.dart';
import 'title.dart';
import 'image.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({
    super.key,
    required this.originalTitle,
    required this.dateRelease,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String originalTitle;
  final String dateRelease;
  final String imagePath;
  final SizedBox separatorSizedBox = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTitle(
          title: title,
        ),
        MovieSubtitle(
          originalTitle: originalTitle,
          dateRelease: dateRelease,
        ),
        separatorSizedBox,
        Center(
          child: MovieImage(
            imagePath: imagePath,
          ),
        ),
      ],
    );
  }
}
