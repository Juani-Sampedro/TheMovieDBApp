import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/util/categories.dart';
import '../../../core/util/states.dart';
import '../../../data/repository/genre_repository_class.dart';
import '../../../data/repository/genre_repository_from_database.dart';
import '../../model/genre.dart';
import '../i_usecase.dart';

class GenresUseCase implements IUseCase {
  final GenreRepository repository;
  final GenreRepoFromDB repoFromDB;
  final Connectivity _connectivity = Connectivity();

  GenresUseCase({
    required this.repoFromDB,
    required this.repository,
  });

  @override
  Future<DataState> call([CategoryEnum? category]) async {
    late DataState<List<Genre>> genres;
    late List<Genre>? listOfGenres;
    if (await _connectivity.checkConnectivity() == ConnectivityResult.none) {
      return await repoFromDB.getData();
    } else {
      genres = await repository.getData();
      listOfGenres = genres.data;
      _saveGenres(listOfGenres);
      return genres;
    }
  }

  Future<void> _saveGenres(List<Genre>? genres) async {
    await Future.forEach<Genre>(genres as Iterable<Genre>, (genre) async {
      await repoFromDB.addGenre(genre);
    });
  }
}
