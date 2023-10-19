import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/model/genre.dart';
import '../../../domain/model/movie.dart';
import 'DAOs/genre_dao.dart';
import 'DAOs/movie_dao.dart';
import 'converters/list_int_converter.dart';
import 'converters/list_string_converter.dart';

part 'floor_movie_db.g.dart';

@TypeConverters(<Type>[ListIntConverter, ListStringConverter])
@Database(
  version: 1,
  entities: <Type>[
    Movie,
    Genre,
  ],
)
abstract class FloorMovieDatabase extends FloorDatabase {
  MovieDao get movieDao;

  GenreDao get genreDao;
}
