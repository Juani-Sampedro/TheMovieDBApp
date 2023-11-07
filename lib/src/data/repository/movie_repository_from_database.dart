import '../../core/util/categories.dart';
import '../../core/util/states.dart';
import '../../domain/model/fav_movie.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/interfaces/i_movie_repository.dart';
import '../datasource/local/movie_db.dart';

class MovieRepoFromDB implements IMovieRepository {
  MovieRepoFromDB({required this.movieDatabase});

  final MovieDatabase movieDatabase;

  Future<Movie?> existById(int id) {
    return movieDatabase.existById(id: id);
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

  Future<DataState> getFavData() async {
    final movies = await movieDatabase.getFavMovies();
    return DataState(
      resultState: ResultState.success,
      data: movies,
    );
  }

  @override
  Future<DataState> getData([CategoryEnum? categoryCall]) async {
    List<Movie> movies =
        await movieDatabase.getMovies(category: categoryCall!.category);
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
