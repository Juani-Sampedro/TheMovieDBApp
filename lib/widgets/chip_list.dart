import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.genres,
  });

  final List<String> genres;
  static const double labelPaddingEdgeInsets = 2.0;
  static const double spacingWrap = 6.0;
  static const double runSpacingWrap = 6.0;
  static const double paddingEdgeInsets = 8.0;

  Widget _buildChip(String label) {
    return Chip(
      labelPadding: const EdgeInsets.all(labelPaddingEdgeInsets),
      avatar: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text(
          label[0].toUpperCase(),
        ),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      backgroundColor: Colors.red.shade300,
      padding: const EdgeInsets.all(paddingEdgeInsets),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacingWrap,
      runSpacing: runSpacingWrap,
      children: [
        for (int index = 0; index < genres.length; index++)
          _buildChip(
            genres.elementAt(
              index,
            ),
          ),
      ],
    );
  }
}
