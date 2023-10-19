import 'package:flutter/material.dart';
import 'colors.dart';

class Constants {
  static const String appFontFamily = 'Handjet';
  static const String tekturFontFamily = 'Tektur';
  static const String homeTextFontFamily = 'Roboto';
  static const String caprasimoFontFamily = 'Caprasimo';
  static const String apiKey = 'api_key=8213b93b04d7579fb681076a1db7a7c7';
  static const double appFontSize = 30.0;
  static const double paddingHorizontalSymmetricForLikeCounterButton = 40;

  static const String appName = 'MovieDB App';

  static const String databaseName = 'movie_database.db';
  static const String homeRouteName = '/home';
  static const String popularMoviesRouteName = '/popularMovies';
  static const String upcomingMoviesRouteName = '/upcomingMovies';
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String popularMoviesEndpoint = '/3/movie/popular';
  static const String topRatedMoviesEndpoint = '/3/movie/top_rated';
  static const String upcomingMoviesEndpoint = '/3/movie/upcoming';
  static const String backgroundImagePath = "assets/images/gradient.jpeg";
  static const String logoImagePath = 'assets/images/logo.png';
  static const String emptyStateText = 'We could not find any movie.';
  static const String textAboutUs =
      'This app was created by \n Juan Ignacio Sampedro. \n Globant Internship. \n 2023.';

  static const Decoration backgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(Constants.backgroundImagePath),
      fit: BoxFit.cover,
    ),
  );

  static Border borderAppBar = const Border(
    bottom: BorderSide(
      color: AppColors.appNameFontColor,
      width: 2,
    ),
  );
}
