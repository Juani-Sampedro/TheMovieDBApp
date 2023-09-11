import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/util/constants.dart';
import '../../domain/model/genre.dart';
import '../../domain/repository/interfaces/i_genre_repository.dart';

class GenreJsonManagement implements IGenreRepository<List<Genre>> {
  @override
  Future<List<Genre>> getData() async {
    String genreData = await rootBundle.loadString(
      ConstantsClass.genreJsonPath,
    );
    var genresDecoded = jsonDecode(genreData);
    List<dynamic> listGenres = genresDecoded['genres'];
    return listGenres
        .map(
          (genre) => Genre.fromJson(
            genre,
          ),
        )
        .toList();
  }

  @override
  List<Genre> getNameFromIds(
    List<int> genresIds,
    List<Genre> genres,
  ) {
    List<Genre> selectedGenres = [];
    selectedGenres = genres
        .where(
          (
            genre,
          ) =>
              genresIds.contains(
            genre.id,
          ),
        )
        .toList();
    return selectedGenres;
  }
}
