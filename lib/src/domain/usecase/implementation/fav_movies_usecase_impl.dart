import '../../../core/util/states.dart';
import '../../../data/repository/movie_repository_from_database.dart';
import '../../model/fav_movie.dart';
import '../i_usecase.dart';

class FavMoviesUseCase implements IUseCase {
  final MovieRepoFromDB repoFromDB;

  FavMoviesUseCase({
    required this.repoFromDB,
  });


  Future<bool> existFavMovieById(int id) async {
    return await repoFromDB.existFavMovieById(id);
  }

  Future<void> saveFavMovie(FavMovie favMovie) async {
    return await repoFromDB.saveFavMovie(favMovie);
  }

  Future<void> deleteFavMovie(FavMovie favMovie) async {
    return await repoFromDB.deleteFavMovie(favMovie);
  }

  Future<DataState> getMoviesJoinFavMovies() async {
    return await repoFromDB.getMoviesJoinFavMovies();
  }

  @override
  Future<DataState> call() async {
    return await repoFromDB.getAllFavMovies();
  }
}
