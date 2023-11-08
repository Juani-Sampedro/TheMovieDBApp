import 'package:floor/floor.dart';

@Entity(tableName: 'FavMovie')
class FavMovie {

  @primaryKey
  late int id;

  FavMovie({required this.id});
}
