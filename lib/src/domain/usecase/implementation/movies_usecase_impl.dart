import '../../../core/util/categories.dart';
import '../../../core/util/states.dart';
import '../../../data/repository/movie_repository_from_apiservice.dart';
import '../../../data/repository/movie_repository_from_database.dart';
import '../../model/movie.dart';
import '../i_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MoviesUseCase implements IUseCase {
  late MovieRepoFromApiService repoFromApiService;
  final Connectivity _connectivity = Connectivity();
  final MovieRepoFromDB repoFromDB;

  MoviesUseCase({
    required this.repoFromDB,
    required this.repoFromApiService,
  });

  @override
  Future<DataState> call([CategoryEnum? categoryCall]) async {
    late List<Movie>? movies;
    late DataState<List<Movie>>? dataStateMovie;
    if (await _connectivity.checkConnectivity() == ConnectivityResult.none) {
      return await repoFromDB.getData(categoryCall);
    } else {
      dataStateMovie = (await repoFromApiService.getData());
      movies = dataStateMovie.data;
      for (var movie in movies!) {
        Movie? movieInDataBase = await repoFromDB.existById(movie.id);
        if (movieInDataBase != null) {
          if (!movieInDataBase.categories.contains(categoryCall!.category)) {
            movieInDataBase.categories.add(categoryCall.category);
            repoFromDB.saveMovie(movieInDataBase);
          }
        } else {
          movie.categories.add(categoryCall!.category);
          repoFromDB.saveMovie(movie);
        }
      }
      return dataStateMovie;
    }
  }
}
