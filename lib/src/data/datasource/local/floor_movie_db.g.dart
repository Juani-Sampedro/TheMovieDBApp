// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_movie_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorMovieDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorMovieDatabaseBuilder databaseBuilder(String name) =>
      _$FloorMovieDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorMovieDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorMovieDatabaseBuilder(null);
}

class _$FloorMovieDatabaseBuilder {
  _$FloorMovieDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorMovieDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorMovieDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorMovieDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorMovieDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorMovieDatabase extends FloorMovieDatabase {
  _$FloorMovieDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  GenreDao? _genreDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`categories` TEXT NOT NULL, `genres` TEXT NOT NULL, `language` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `dateRelease` TEXT NOT NULL, `movieTitle` TEXT NOT NULL, `imagePath` TEXT NOT NULL, `backdropPath` TEXT NOT NULL, `movieOverview` TEXT NOT NULL, `voteCount` INTEGER NOT NULL, `voteAverage` REAL NOT NULL, `id` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Genre` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FavMovie` (`id` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  GenreDao get genreDao {
    return _genreDaoInstance ??= _$GenreDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'categories': _listStringConverter.encode(item.categories),
                  'genres': _listIntConverter.encode(item.genres),
                  'language': item.language,
                  'originalTitle': item.originalTitle,
                  'dateRelease': item.dateRelease,
                  'movieTitle': item.movieTitle,
                  'imagePath': item.imagePath,
                  'backdropPath': item.backdropPath,
                  'movieOverview': item.movieOverview,
                  'voteCount': item.voteCount,
                  'voteAverage': item.voteAverage,
                  'id': item.id
                }),
        _favMovieInsertionAdapter = InsertionAdapter(database, 'FavMovie',
            (FavMovie item) => <String, Object?>{'id': item.id}),
        _favMovieDeletionAdapter = DeletionAdapter(database, 'FavMovie', ['id'],
            (FavMovie item) => <String, Object?>{'id': item.id});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  final InsertionAdapter<FavMovie> _favMovieInsertionAdapter;

  final DeletionAdapter<FavMovie> _favMovieDeletionAdapter;

  @override
  Future<List<Movie>> findAllMovies(String category) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Movie where categories LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => Movie(
            categories:
                _listStringConverter.decode(row['categories'] as String),
            id: row['id'] as int,
            movieOverview: row['movieOverview'] as String,
            voteAverage: row['voteAverage'] as double,
            genres: _listIntConverter.decode(row['genres'] as String),
            originalTitle: row['originalTitle'] as String,
            dateRelease: row['dateRelease'] as String,
            movieTitle: row['movieTitle'] as String,
            imagePath: row['imagePath'] as String,
            backdropPath: row['backdropPath'] as String,
            voteCount: row['voteCount'] as int,
            language: row['language'] as String),
        arguments: [category]);
  }

  @override
  Future<List<FavMovie>> findFavMovies() async {
    return _queryAdapter.queryList('SELECT * FROM FavMovie',
        mapper: (Map<String, Object?> row) => FavMovie(id: row['id'] as int));
  }

  @override
  Future<Movie?> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM Movie WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            categories:
                _listStringConverter.decode(row['categories'] as String),
            id: row['id'] as int,
            movieOverview: row['movieOverview'] as String,
            voteAverage: row['voteAverage'] as double,
            genres: _listIntConverter.decode(row['genres'] as String),
            originalTitle: row['originalTitle'] as String,
            dateRelease: row['dateRelease'] as String,
            movieTitle: row['movieTitle'] as String,
            imagePath: row['imagePath'] as String,
            backdropPath: row['backdropPath'] as String,
            voteCount: row['voteCount'] as int,
            language: row['language'] as String),
        arguments: [id]);
  }

  @override
  Future<FavMovie?> findFavMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM FavMovie WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FavMovie(id: row['id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Movie>> joinMovieFavMovie() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Movie JOIN FavMovie using(id)',
        mapper: (Map<String, Object?> row) => Movie(
            categories:
                _listStringConverter.decode(row['categories'] as String),
            id: row['id'] as int,
            movieOverview: row['movieOverview'] as String,
            voteAverage: row['voteAverage'] as double,
            genres: _listIntConverter.decode(row['genres'] as String),
            originalTitle: row['originalTitle'] as String,
            dateRelease: row['dateRelease'] as String,
            movieTitle: row['movieTitle'] as String,
            imagePath: row['imagePath'] as String,
            backdropPath: row['backdropPath'] as String,
            voteCount: row['voteCount'] as int,
            language: row['language'] as String));
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertFavMovie(FavMovie movie) async {
    await _favMovieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteFavMovie(FavMovie movie) async {
    await _favMovieDeletionAdapter.delete(movie);
  }
}

class _$GenreDao extends GenreDao {
  _$GenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreInsertionAdapter = InsertionAdapter(
            database,
            'Genre',
            (Genre item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Genre> _genreInsertionAdapter;

  @override
  Future<List<Genre>> getAllGenres() async {
    return _queryAdapter.queryList('SELECT * From Genre',
        mapper: (Map<String, Object?> row) =>
            Genre(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<void> deleteGenre() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Genre');
  }

  @override
  Future<void> insertGenre(Genre movieGenre) async {
    await _genreInsertionAdapter.insert(movieGenre, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _listIntConverter = ListIntConverter();
final _listStringConverter = ListStringConverter();
