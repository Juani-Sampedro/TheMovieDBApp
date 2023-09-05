import 'dart:convert';
import 'package:flutter/services.dart';
import '/interfaces/i_repository.dart';
import '/model/genre.dart';
import '/shared/constants.dart';

class GenreJsonManagement implements IMyRepository<List<Genre>> {
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
