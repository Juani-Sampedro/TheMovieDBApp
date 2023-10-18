import '../../domain/model/genre.dart';

class GenreModel extends Genre {
  GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(
    Map<String, dynamic> genreData,
  ) {
    return GenreModel(
      id: genreData['id'],
      name: genreData['name'],
    );
  }

  static List<GenreModel> listOfGenres(List<dynamic> data) {
    return data.map((genre) => GenreModel.fromJson(genre)).toList();
  }
}
