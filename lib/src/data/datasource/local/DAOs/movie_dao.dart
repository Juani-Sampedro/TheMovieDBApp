import 'package:floor/floor.dart';

import '../../../../domain/model/fav_movie.dart';
import '../../../../domain/model/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie where categories LIKE '%' || :category || '%'")
  Future<List<Movie>> findAllMovies(String category);

  @Query("SELECT * FROM FavMovie")
  Future<List<FavMovie>> findFavMovies();

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Query('SELECT * FROM FavMovie WHERE id = :id')
  Future<FavMovie?> findFavMovieById(int id);

  @Query('SELECT * FROM Movie JOIN FavMovie using(id)')
  Future<List<Movie>> fetch();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);

  @delete
  Future<void> deleteFavMovie(FavMovie movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavMovie(FavMovie movie);
}
