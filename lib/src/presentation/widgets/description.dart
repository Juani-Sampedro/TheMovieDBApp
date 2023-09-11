import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../domain/model/genre.dart';
import 'chip_list.dart';
import 'description_text.dart';
import 'icon.dart';

class Description extends StatelessWidget {
  final double dsSpaceBetweenChipList = 2;
  final double dsPadding = 32;
  final double dsSizedBoxHeight = 10;
  final double lastDsSizedBoxHeight = 80;
  final double dsVoteAvgFontSize = 15.0;
  final double dsChipListFontSize = 10.0;
  int numberOfFullStars = 0;
  int numberOfHalfStars = 0;
  int numberOfBorderStars = 5;

  final String description;
  final double voteAverage;
  final List<Genre> genres;
  final TextStyle voteAvgTextStyle = const TextStyle(
    fontSize: 17,
    fontFamily: ConstantsClass.tekturFontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  Description({
    super.key,
    required this.description,
    required this.voteAverage,
    required this.genres,
  });

  void updateNumberOfStars(double voteAverage) {
    switch (voteAverage) {
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
      padding: EdgeInsets.symmetric(horizontal: dsPadding),
      child: Column(
        children: [
          SizedBox(
            height: dsSizedBoxHeight,
          ),
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
              SizedBox(
                height: dsSizedBoxHeight,
              ),
              Text(
                '$voteAverage',
                style: voteAvgTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: dsSizedBoxHeight,
          ),
          GenresChipList(
            genres: genres,
          ),
          SizedBox(
            height: dsSizedBoxHeight,
          ),
          DescriptionText(
            text: description,
            align: TextAlign.justify,
          ),
          SizedBox(
            height: lastDsSizedBoxHeight,
          ),
        ],
      ),
    );
  }
}
