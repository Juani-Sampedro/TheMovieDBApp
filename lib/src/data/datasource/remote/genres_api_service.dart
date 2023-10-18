import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../../model/genre_page_model.dart';

import '../../../core/util/constants.dart';
import 'i_api_service.dart';

class GenresApiService implements IApiService {
  final String exceptionMessage = 'Failed to load the genres';
  final String genreUrl = "/genre/movie/list?";
  final Client client;

  GenresApiService({required this.client});

  @override
  Future<GenrePageModel> fetch() async {
    final response = await client
        .get(Uri.parse('${Constants.baseUrl}/3$genreUrl${Constants.apiKey}'));
    if (response.statusCode == HttpStatus.ok) {
      return GenrePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(exceptionMessage);
    }
  }
}
