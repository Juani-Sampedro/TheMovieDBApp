import 'package:flutter/material.dart';
import 'chip_list.dart';
import 'description_text.dart';
import 'icon.dart';

class Description extends StatelessWidget {
  static const double dsSpaceBetweenChipList = 2;
  static const double dsPadding = 32;
  static const double dsSizedBoxHeight = 10;
  static const double dsVoteAvgFontSize = 15.0;
  static const double dsChipListFontSize = 10.0;
  int numberOfFullStars = 0;
  int numberOfHalfStars = 0;
  int numberOfBorderStars = 5;

  final String description;
  final String voteAverage;
  final List<String> genres;

  Description({
    super.key,
    required this.description,
    required this.voteAverage,
    required this.genres,
  });

  void updateNumberOfStars(String voteAverage) {
    double voteAverageAsDouble = double.parse(voteAverage);
    switch (voteAverageAsDouble) {
      case 10.0:
        numberOfFullStars = 5;
        numberOfHalfStars = 0;
        numberOfBorderStars = 0;
        break;
      case > 8.0 && < 10.0:
        numberOfFullStars = 4;
        numberOfHalfStars = 1;
        numberOfBorderStars = 0;
        break;
      case 8.0:
        numberOfFullStars = 4;
        numberOfBorderStars = 0;
        numberOfBorderStars = 1;
        break;
      case > 6.0 && < 8.0:
        numberOfFullStars = 3;
        numberOfHalfStars = 1;
        numberOfBorderStars = 1;
        break;
      case 6.0:
        numberOfFullStars = 3;
        numberOfHalfStars = 0;
        numberOfBorderStars = 2;
        break;
      case > 4.0 && < 6.0:
        numberOfFullStars = 2;
        numberOfHalfStars = 1;
        numberOfBorderStars = 2;
        break;
      case 4.0:
        numberOfFullStars = 2;
        numberOfHalfStars = 0;
        numberOfBorderStars = 3;
        break;
      case > 2.0 && < 4.0:
        numberOfFullStars = 1;
        numberOfHalfStars = 1;
        numberOfBorderStars = 3;
        break;
      case 2.0:
        numberOfFullStars = 1;
        numberOfHalfStars = 0;
        numberOfBorderStars = 4;
        break;
      case > 0.0 && < 2.0:
        numberOfFullStars = 0;
        numberOfHalfStars = 1;
        numberOfBorderStars = 4;
        break;
      case 0.0:
        numberOfFullStars = 0;
        numberOfHalfStars = 0;
        numberOfBorderStars = 5;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    updateNumberOfStars(voteAverage);
    return Container(
      padding: const EdgeInsets.all(dsPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DescriptionIcon(
                icon: Icons.star,
                numberOfIconsCreated: numberOfFullStars,
              ),
              DescriptionIcon(
                icon: Icons.star_half,
                numberOfIconsCreated: numberOfHalfStars,
              ),
              DescriptionIcon(
                icon: Icons.star_border,
                numberOfIconsCreated: numberOfBorderStars,
              ),
              const SizedBox(height: dsSizedBoxHeight),
              DescriptionText(
                text: voteAverage,
              ),
            ],
          ),
          const SizedBox(
            height: dsSizedBoxHeight,
          ),
          Genres(
            genres: genres,
          ),
          const SizedBox(
            height: dsSizedBoxHeight,
          ),
          DescriptionText(
            text: description,
            align: TextAlign.justify,
          ),
          const SizedBox(
            height: dsSizedBoxHeight,
          ),
        ],
      ),
    );
  }
}
