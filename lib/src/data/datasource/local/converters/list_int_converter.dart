import 'dart:convert';

import 'package:floor/floor.dart';

class ListIntConverter extends TypeConverter<List<int>, String> {

  static const String key = 'Genres';
  @override
  List<int> decode(String databaseValue) {
    final dynamic jsonFile = json.decode(databaseValue);
    return List<int>.from(jsonFile[key]);
  }

  @override
  String encode(List<int> value) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data.addAll(<String, dynamic>{key: value});
    return json.encode(data);
  }
}
