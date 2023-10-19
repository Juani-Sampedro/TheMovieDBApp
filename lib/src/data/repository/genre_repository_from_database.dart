import '../../core/util/states.dart';
import '../../domain/model/genre.dart';
import '../../domain/repository/interfaces/i_genre_repository.dart';
import '../datasource/local/genre_db.dart';

class GenreRepoFromDB implements IGenreRepository {
  GenreRepoFromDB({required this.genreDatabase});

  final GenreDatabase genreDatabase;

  Future<void> addGenre (Genre genre) async {
    await genreDatabase.addGenre(genre);
  }

  @override
  Future<DataState> getData() async {
    List<Genre> genres = await genreDatabase.getAllGenres();
    if (genres.isNotEmpty) {
      return DataState(
        resultState: ResultState.success,
        data: genres,
      );
    } else {
      return DataState(resultState: ResultState.empty);
    }
  }
}
