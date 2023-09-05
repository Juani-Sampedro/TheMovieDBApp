import 'dart:convert';
import 'package:flutter/services.dart';
import '/interfaces/i_repository.dart';
import '/model/movie.dart';
import '/shared/constants.dart';

class MovieJsonManagement implements IMyRepository<List<Movie>> {
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
