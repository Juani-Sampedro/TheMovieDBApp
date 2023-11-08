import '../../model/fav_movie.dart';

abstract class IMovieDatabaseRepository<T> {
  Future<List<T>> getMovies({required String category});

  Future<List<FavMovie>> getFavMovies();

  Future<void> saveMovie({required T movie});

  Future<void> saveFavMovie({required FavMovie movie});

  Future<void> deleteFavMovie({required FavMovie movie});

  Future<bool> existFavMovieById({required int id});

  Future<T?> existById({required int id});

  Future<List<T>> fetchMovies();
}
