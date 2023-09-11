import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/interfaces/i_movie_repository.dart';

class MovieJsonManagement implements IMovieRepository<List<Movie>> {
  @override
  Future<List<Movie>> getData() async {
    final String response = await rootBundle.loadString(
      ConstantsClass.movieJsonPath,
    );
    final data = await json.decode(
      response,
    );

    List<Movie> movies = [];
    for (var movie in data) {
      movies.add(
        Movie.fromJson(
          movie,
        ),
      );
    }
    return movies;
  }
}
