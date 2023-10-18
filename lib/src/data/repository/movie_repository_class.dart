import '../../core/util/states.dart';
import '../../domain/repository/interfaces/i_movie_repository.dart';
import '../datasource/remote/i_api_service.dart';
import '../datasource/remote/movie_list_api_service.dart';
import '../model/movie_page_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository implements IMovieRepository {
  final IApiService apiService;
  final String endpoint;

  MovieRepository({
    required this.endpoint,
    IApiService? apiService,
  }) : apiService = apiService ??
            MovieListApiService(
              client: http.Client(),
              endpoint: endpoint,
            );

  @override
  Future<DataState> getData() async {
    try {
      final MoviePageModel response = await apiService.fetch();
      return DataState(
        resultState: response.results.isEmpty ? ResultState.empty : ResultState.success,
        data: response.results.map((genre) => genre).toList(),
      );
    } catch (e) {
      return DataState(
        resultState: ResultState.error,
        errorMsg: e.toString(),
      );
    }
  }
}
