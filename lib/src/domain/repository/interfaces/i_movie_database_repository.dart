import '../../model/fav_movie.dart';

abstract class IMovieDatabaseRepository<T> {
  Future<List<T>> getAllMovies({required String category});

  Future<List<FavMovie>> getAllFavMovies();

  Future<void> saveMovie({required T movie});

  Future<void> saveFavMovie({required FavMovie movie});

  Future<void> deleteFavMovie({required FavMovie movie});

  Future<bool> existFavMovieById({required int id});

  Future<T?> existMovieById({required int id});

  Future<List<T>> joinMovieFavMovie();
}
