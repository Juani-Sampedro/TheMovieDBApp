import 'package:floor/floor.dart';

import '../../../../domain/model/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie where categories LIKE '%' || :category || '%'")
  Future<List<Movie>> findAllMovies(String category);

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);
}
