
import '../../model/fav_movie.dart';

abstract class IMovieDatabaseRepository<T> {
  Future<List<T>> getMovies({required String category});

  Future<List<FavMovie>> getFavMovies();

  Future<bool> existMovie(T movie);

  Future<void> saveMovie({required T movie});

  Future<void> saveFavMovie({required FavMovie movie});

  Future<void> deleteFavMovie({required FavMovie movie});

  Future<T?> existById({required int id});

  Future<List<T>> fetchMovies();
}
