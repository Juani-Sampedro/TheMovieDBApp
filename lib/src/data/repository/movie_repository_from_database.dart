import '../../core/util/categories.dart';
import '../../core/util/states.dart';
import '../../domain/model/fav_movie.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/interfaces/i_movie_repository.dart';
import '../datasource/local/movie_db.dart';

class MovieRepoFromDB implements IMovieRepository {
  MovieRepoFromDB({required this.movieDatabase});

  final MovieDatabase movieDatabase;

  Future<Movie?> existMovieById(int id) {
    return movieDatabase.existMovieById(id: id);
  }

  Future<bool> existFavMovieById(int id) {
    return movieDatabase.existFavMovieById(id: id);
  }

  Future<void> saveMovie(Movie movie) async {
    await movieDatabase.saveMovie(movie: movie);
  }

  Future<void> saveFavMovie(FavMovie movie) async {
    await movieDatabase.saveFavMovie(movie: movie);
  }

  Future<void> deleteFavMovie(FavMovie movie) async {
    await movieDatabase.deleteFavMovie(movie: movie);
  }

  Future<DataState> getMoviesJoinFavMovies() async {
    final movies = await movieDatabase.joinMovieFavMovie();
    return DataState(
      resultState: ResultState.success,
      data: movies,
    );
  }

  Future<DataState> getAllFavMovies() async {
    final movies = await movieDatabase.getAllFavMovies();
    return DataState(
      resultState: ResultState.success,
      data: movies,
    );
  }

  @override
  Future<DataState> getData([CategoryEnum? categoryCall]) async {
    List<Movie> movies =
        await movieDatabase.getAllMovies(category: categoryCall!.category);
    if (movies.isNotEmpty) {
      return DataState(
        resultState: ResultState.success,
        data: movies,
      );
    } else {
      return DataState(resultState: ResultState.empty);
    }
  }
}
