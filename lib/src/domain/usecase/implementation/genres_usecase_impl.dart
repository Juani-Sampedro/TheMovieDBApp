import '../../../core/util/states.dart';
import '../../../data/datasource/remote/i_api_service.dart';
import '../../../data/repository/genre_repository_class.dart';
import '../i_usecase.dart';

class GenresUseCase implements IUseCase {
  final GenreRepository repository;

  GenresUseCase(this.repository, {IApiService? apiService});

  @override
  Future<DataState> call() async {
    DataState genres = await repository.getData();
    return genres;
  }
}
