import '../../../domain/model/fav_movie.dart';
import '../../../domain/model/movie.dart';
import '../../../domain/repository/interfaces/i_movie_database_repository.dart';
import 'floor_movie_db.dart';

class MovieDatabase implements IMovieDatabaseRepository<Movie> {
  const MovieDatabase(this._movieDB);

  final FloorMovieDatabase _movieDB;

  @override
  Future<List<Movie>> getMovies({required String category}) async =>
      _movieDB.movieDao.findAllMovies(category);

  @override
  Future<void> saveMovie({required Movie movie}) async {
    _movieDB.movieDao.insertMovie(movie);
  }

  @override
  Future<bool> existMovie(Movie movie) async {
    return await _movieDB.movieDao.findMovieById(movie.id) != null;
  }

  @override
  Future<Movie?> existById({required int id}) {
    return _movieDB.movieDao.findMovieById(id);
  }

  @override
  Future<void> deleteFavMovie({required FavMovie movie}) async {
    _movieDB.movieDao.deleteFavMovie(movie);
  }

  @override
  Future<List<FavMovie>> getFavMovies() {
    return _movieDB.movieDao.findFavMovies();
  }

  @override
  Future<void> saveFavMovie({required FavMovie movie}) async {
    _movieDB.movieDao.insertFavMovie(movie);
  }
}
