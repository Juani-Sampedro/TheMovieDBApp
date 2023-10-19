import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../model/genre_page_model.dart';

import '../../../core/util/constants.dart';
import 'i_api_service.dart';

class GenresApiService implements IApiService {
  final String exceptionMessage = 'Failed to load the genres';

  @override
  Future<GenrePageModel> fetch(String endpoint) async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrl}/3$endpoint${Constants.apiKey}'));
    if (response.statusCode == HttpStatus.ok) {
      return GenrePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(exceptionMessage);
    }
  }
}
