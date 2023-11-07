import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/route/app_routes.dart';
import '../../core/util/colors.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../bloc/fav_bloc.dart';
import '../bloc/genres_in_movie_detail_bloc.dart';
import 'image.dart';

class DisplayMovie extends StatelessWidget {
  const DisplayMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;
  final SizedBox spaceBetweenData = const SizedBox(height: sizedBoxHeight);
  static const double sizedBoxHeight = 10;
  static const double movieTitleFontSize = 23;
  static const double movieLanguageFontSize = 15;
  static const double overviewAndVoteAvgFontSize = 16;

  final TextStyle movieTitleTextStyle = const TextStyle(
    fontSize: movieTitleFontSize,
    fontFamily: Constants.homeTextFontFamily,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.visible,
    fontStyle: FontStyle.italic,
  );
  final TextStyle movieLanguageTextStyle = const TextStyle(
    fontSize: movieLanguageFontSize,
    fontFamily: Constants.homeTextFontFamily,
    fontWeight: FontWeight.bold,
    color: AppColors.iconInTextUnderAppBarColor,
  );
  final TextStyle overviewAndVoteAvgTextStyle = const TextStyle(
    fontSize: overviewAndVoteAvgFontSize,
    fontFamily: Constants.tekturFontFamily,
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
        AppRoutes.navigateToMovieDetails(
          movie,
          context,
          Provider.of<GenresInMovieDetailBloc>(
            context,
            listen: false,
          ),
          Provider.of<FavMoviesBloc>(
            context,
            listen: false,
          ),
        );
      },
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  MovieImage(imagePath: movie.imagePath),
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
                    padding: EdgeInsets.all(containerPaddingEdgeInsetsAll),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(borderRadiusCircular)),
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
