import '../../model/genre.dart';

abstract class IGenreDatabaseRepository {
  Future<List<Genre>> getAllGenres();

  Future<void> addGenre(Genre genre);
}
