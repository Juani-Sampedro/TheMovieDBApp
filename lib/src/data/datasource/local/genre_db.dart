import '../../../domain/model/genre.dart';
import '../../../domain/repository/interfaces/i_genre_database_repository.dart';
import 'floor_movie_db.dart';

class GenreDatabase implements IGenreDatabaseRepository {
  const GenreDatabase(this._floorMovieDatabaseDB);

  final FloorMovieDatabase _floorMovieDatabaseDB;

  @override
  Future<void> addGenre(Genre genre) async {
    _floorMovieDatabaseDB.genreDao.insertGenre(genre);
  }

  @override
  Future<List<Genre>> getAllGenres() {
    return _floorMovieDatabaseDB.genreDao.getAllGenres();
  }
}
