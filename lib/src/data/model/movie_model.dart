import '../../domain/model/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.movieTitle,
    required super.originalTitle,
    required super.language,
    required super.dateRelease,
    required super.movieOverview,
    required super.voteAverage,
    required super.genres,
    required super.imagePath,
    required super.backdropPath,
    required super.voteCount,
  });

  factory MovieModel.fromJson(
    Map<String, dynamic> movieData,
  ) {
    return MovieModel(
      movieOverview: movieData['overview'],
      voteCount: movieData['vote_count'],
      voteAverage: movieData['vote_average'].toDouble(),
      genres: List<int>.from(
        movieData['genre_ids'],
      ),
      originalTitle: movieData['original_title'],
      dateRelease: movieData['release_date'],
      movieTitle: movieData['title'],
      imagePath: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
      backdropPath:
          'https://image.tmdb.org/t/p/w500${movieData['backdrop_path']}',
      language: movieData['original_language'],
    );
  }

  static List<MovieModel> listOfMovies(List<dynamic> data) {
    return data.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
