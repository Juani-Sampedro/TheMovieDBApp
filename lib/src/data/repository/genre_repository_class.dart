import '../../core/util/states.dart';
import '../../domain/model/genre.dart';
import '../../domain/repository/interfaces/i_genre_repository.dart';
import '../datasource/remote/genres_api_service.dart';
import '../datasource/remote/i_api_service.dart';
import '../model/genre_page_model.dart';
import 'package:http/http.dart' as http;

class GenreRepository implements IGenreRepository {
  final IApiService apiService;

  GenreRepository({
    IApiService? apiService,
  }) : apiService = apiService ?? GenresApiService(client: http.Client());

  @override
  Future<DataState> getData() async {
    try {
      final GenrePageModel response = await apiService.fetch();
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

  @override
  dynamic getNameFromIds(
    List<int> genresIds,
    dynamic genres,
  ) {
    List<Genre> selectedGenres = [];
    selectedGenres =
        genres.where((genre) => genresIds.contains(genre.id)).toList();
    return selectedGenres;
  }
}
