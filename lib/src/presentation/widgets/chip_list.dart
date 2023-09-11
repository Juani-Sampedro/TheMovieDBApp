import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../domain/model/genre.dart';

class GenresChipList extends StatelessWidget {
  const GenresChipList({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;
  final double labelPaddingEdgeInsets = 2.0;
  final double spacingWrap = 6.0;
  final double runSpacingWrap = 6.0;
  final double paddingEdgeInsets = 8.0;
  final Color circleAvatarBackgroundColor = const Color(0XFF70B45A);
  final TextStyle genresFirstLetterTextStyle = const TextStyle(
    fontFamily: ConstantsClass.homeTextFontFamily,
    fontSize: 20,
    color: Color(0xFF114800),
    fontWeight: FontWeight.bold,
  );
  final TextStyle genresNamesTextStyle = const TextStyle(
    fontSize: 20,
    fontFamily: ConstantsClass.homeTextFontFamily,
    color: Color(0XFFA1D890),
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 4,
        spreadRadius: 2,
      ),
    ],
  );

  final Color genreBackgroundColor = const Color(0xFF114800);

  Widget _buildChip(String label) {
    return Chip(
      labelPadding: EdgeInsets.all(
        labelPaddingEdgeInsets,
      ),
      avatar: CircleAvatar(
        backgroundColor: circleAvatarBackgroundColor,
        child: Text(
          style: genresFirstLetterTextStyle,
          label[0].toUpperCase(),
        ),
      ),
      label: Text(
        label,
        style: genresNamesTextStyle,
      ),
      backgroundColor: genreBackgroundColor,
      padding: EdgeInsets.all(paddingEdgeInsets),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacingWrap,
      runSpacing: runSpacingWrap,
      children: [
        for (Genre genre in genres) _buildChip(genre.name),
      ],
    );
  }
}
