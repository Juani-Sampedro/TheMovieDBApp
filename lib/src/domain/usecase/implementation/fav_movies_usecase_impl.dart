import '../../../core/util/states.dart';
import '../../../data/repository/movie_repository_from_database.dart';
import '../../model/fav_movie.dart';
import '../../model/movie.dart';
import '../i_usecase.dart';

class FavMoviesUseCase implements IUseCase {
  final MovieRepoFromDB repoFromDB;

  FavMoviesUseCase({
    required this.repoFromDB,
  });

  Future<Movie?> existById(int id) async {
    return await repoFromDB.existById(id);
  }

  Future<bool> existFavMovieById(int id) async {
    return await repoFromDB.existFavMovieById(id);
  }

  Future<void> addMovie(FavMovie favMovie) async {
    return await repoFromDB.saveFavMovie(favMovie);
  }

  Future<void> removeMovie(FavMovie favMovie) async {
    return await repoFromDB.deleteFavMovie(favMovie);
  }

  Future<DataState> getFavoritesMovies() async {
    return await repoFromDB.getFavMovies();
  }

  @override
  Future<DataState> call() async {
    return await repoFromDB.getFavData();
  }
}
