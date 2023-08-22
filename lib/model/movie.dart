class Movie {
  final String movieOverview;
  final String voteAverage;
  final List<String> genres;
  final String originalTitle;
  final String dateRelease;
  final String movieTitle;
  final String imagePath;
  final String backdropPath;

  const Movie({
    required this.movieOverview,
    required this.voteAverage,
    required this.genres,
    required this.originalTitle,
    required this.dateRelease,
    required this.movieTitle,
    required this.imagePath,
    required this.backdropPath,
  });

  factory Movie.mockMovie() {
    return const Movie(
      voteAverage: '7.8',
      movieOverview:
          'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      genres: [
        'Adventure',
        'Animation',
        'Comedy',
        'Family',
        'Fantasy',
      ],
      originalTitle: 'Original Title: The Super Mario Bros. Movie',
      dateRelease: '2023-04-05',
      movieTitle: 'The Super Mario Bros. Movie',
      imagePath: 'assets/images/poster.jpg',
      backdropPath: 'assets/images/backdrop.jpg',
    );
  }
}
