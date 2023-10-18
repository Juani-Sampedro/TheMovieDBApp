import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../domain/model/genre.dart';
import 'chip_list.dart';
import 'description_text.dart';
import 'icon.dart';

class MovieDescription extends StatelessWidget {
  final double descriptionPadding = 32;
  final double descriptionSizedBoxHeight = 10;
  int numberOfFullStars = 0;
  int numberOfHalfStars = 0;
  int numberOfBorderStars = 5;

  final String description;
  final double voteAverage;
  final List<Genre> genres;
  final TextStyle voteAvgTextStyle = const TextStyle(
    fontSize: 17,
    fontFamily: Constants.tekturFontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  MovieDescription({
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
      padding: EdgeInsets.symmetric(horizontal: descriptionPadding),
      child: Column(
        children: [
          SizedBox(height: descriptionSizedBoxHeight),
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
              SizedBox(height: descriptionSizedBoxHeight),
              Text(
                '$voteAverage',
                style: voteAvgTextStyle,
              ),
            ],
          ),
          SizedBox(height: descriptionSizedBoxHeight),
          GenresChipList(genres: genres),
          SizedBox(height: descriptionSizedBoxHeight),
          DescriptionText(
            text: description,
            align: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
