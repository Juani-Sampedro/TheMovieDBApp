import '../../core/util/states.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/interfaces/i_movie_repository.dart';
import '../datasource/remote/i_api_service.dart';
import '../model/movie_page_model.dart';

class MovieRepoFromApiService implements IMovieRepository {
  final IApiService apiService;
  final String endpoint;

  MovieRepoFromApiService({
    required this.endpoint,
    required this.apiService,
  });

  @override
  Future<DataState<List<Movie>>> getData() async {
    try {
      final MoviePageModel response = await apiService.fetch(endpoint);
      final List<Movie> movieList =
          response.results.map((movie) => movie).toList();
      return DataState(
        resultState:
            response.results.isEmpty ? ResultState.empty : ResultState.success,
        data: movieList,
      );
    } catch (e) {
      return DataState(
        resultState: ResultState.error,
        errorMsg: e.toString(),
      );
    }
  }
}
