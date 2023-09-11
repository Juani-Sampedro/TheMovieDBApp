import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../view/movie_detail.dart';
import 'image.dart';

class DisplayMovie extends StatelessWidget {
  const DisplayMovie({super.key, required this.movie});

  final Movie movie;
  final SizedBox spaceBetweenData = const SizedBox(
    height: 10,
  );
  final TextStyle movieTitleTextStyle = const TextStyle(
    fontSize: 24,
    fontFamily: ConstantsClass.homeTextFontFamily,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  final TextStyle movieLanguageTextStyle = const TextStyle(
    fontSize: 15,
    fontFamily: ConstantsClass.homeTextFontFamily,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  final TextStyle overviewAndVoteAvgTextStyle = const TextStyle(
    fontSize: 16,
    fontFamily: ConstantsClass.tekturFontFamily,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  final int maxLinesOverviewDisplayed = 7;
  final double containerPaddingEdgeInsetsAll = 20;
  final double borderRadiusCircular = 5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(
              movie: movie,
            ),
          ),
        );
      },
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  MovieImage(
                    imagePath: movie.imagePath,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        style: overviewAndVoteAvgTextStyle,
                        '${movie.voteAverage}/10',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      containerPaddingEdgeInsetsAll,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          borderRadiusCircular,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            movie.movieTitle,
                            style: movieTitleTextStyle,
                          ),
                          spaceBetweenData,
                          Text(
                            textAlign: TextAlign.left,
                            'Original language: ${movie.language.toUpperCase()}',
                            style: movieLanguageTextStyle,
                          ),
                          spaceBetweenData,
                          Text(
                            textAlign: TextAlign.justify,
                            maxLines: maxLinesOverviewDisplayed,
                            overflow: TextOverflow.ellipsis,
                            movie.movieOverview,
                            style: overviewAndVoteAvgTextStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
