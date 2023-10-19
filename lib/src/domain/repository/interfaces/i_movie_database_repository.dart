import '../../model/movie.dart';

abstract class IMovieDatabaseRepository {
  Future<List<Movie>> getMovies({required String category});

  Future<bool> existMovie(Movie movie);

  Future<void> saveMovie({required Movie movie});

  Future<Movie?> existById({required int id});
}
