import '../../core/util/states.dart';
import '../../domain/model/genre.dart';
import '../../domain/repository/interfaces/i_genre_repository.dart';
import '../datasource/remote/i_api_service.dart';
import '../model/genre_page_model.dart';

class GenreRepository implements IGenreRepository {
  final IApiService apiService;
  static const url = '/genre/movie/list?';

  GenreRepository({required this.apiService});

  @override
  Future<DataState<List<Genre>>> getData() async {
    try {
      final GenrePageModel response = await apiService.fetch(url);
      return DataState(
        resultState:
            response.results.isEmpty ? ResultState.empty : ResultState.success,
        data: response.results.map((genre) => genre).toList(),
      );
    } catch (e) {
      return DataState(
        resultState: ResultState.error,
        errorMsg: e.toString(),
      );
    }
  }

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
