import 'package:floor/floor.dart';

@entity
class Movie {
  late List<String?> categories;
  late List<int> genres;
  late String language;
  late String originalTitle;
  late String dateRelease;
  late String movieTitle;
  late String imagePath;
  late String backdropPath;
  late String movieOverview;
  late int voteCount;
  late double voteAverage;
  @primaryKey
  late int id;

  Movie({
    required this.categories,
    required this.id,
    required this.movieOverview,
    required this.voteAverage,
    required this.genres,
    required this.originalTitle,
    required this.dateRelease,
    required this.movieTitle,
    required this.imagePath,
    required this.backdropPath,
    required this.voteCount,
    required this.language,
  });
}
