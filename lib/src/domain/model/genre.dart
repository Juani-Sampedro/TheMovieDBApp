import 'package:floor/floor.dart';

@entity
class Genre {
  @primaryKey
  late int id;
  late String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> data) {
    return Genre(
      id: data['id'],
      name: data['name'],
    );
  }
}
