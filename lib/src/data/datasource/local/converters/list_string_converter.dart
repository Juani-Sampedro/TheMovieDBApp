import 'dart:convert';

import 'package:floor/floor.dart';

class ListStringConverter extends TypeConverter<List<String?>, String> {
  static const String key = 'categories';
  @override
  List<String?> decode(String databaseValue) {
    var json = jsonDecode(databaseValue);
    return List<String?>.from(json[key]);
  }

  @override
  String encode(List<String?> value) {
    var map = <String, List<String?>>{};
    map.addAll({key: value});
    return jsonEncode(map);
  }
}
