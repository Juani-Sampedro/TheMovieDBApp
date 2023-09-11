class Movie {
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

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> data) {
    return Movie(
      movieOverview: data['overview'],
      voteCount: data['vote_count'],
      voteAverage: data['vote_average'].toDouble(),
      genres: List<int>.from(
        data['genre_ids'],
      ),
      originalTitle: data['original_title'],
      dateRelease: data['release_date'],
      movieTitle: data['title'],
      imagePath: 'https://image.tmdb.org/t/p/w500${data['poster_path']}',
      backdropPath: 'https://image.tmdb.org/t/p/w500${data['backdrop_path']}',
      language: data['original_language'],
    );
  }
}
