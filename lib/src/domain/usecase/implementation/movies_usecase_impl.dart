import '../../../core/util/states.dart';
import '../../../data/repository/movie_repository_class.dart';
import '../i_usecase.dart';

class MoviesUseCase implements IUseCase {
  final MovieRepository repository;
  final String endpoint;

  MoviesUseCase({
    required this.endpoint,
    MovieRepository? repository,
  }) : repository = repository ?? MovieRepository(endpoint: endpoint);

  @override
  Future<DataState> call() async {
    DataState popular = await repository.getData();
    return popular;
  }
}
