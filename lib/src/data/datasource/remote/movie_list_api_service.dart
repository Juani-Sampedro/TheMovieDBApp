import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import '../../../core/util/constants.dart';
import '../../model/movie_page_model.dart';
import 'i_api_service.dart';

class MovieListApiService implements IApiService {
  final String endpoint;
  final String exceptionMessage = 'Failed to load the movies';
  final Client client;

  MovieListApiService({
    required this.client,
    required this.endpoint,
  });

  @override
  Future<MoviePageModel> fetch() async {
    final response = await client
        .get(Uri.parse('${Constants.baseUrl}$endpoint?${Constants.apiKey}'));

    if (response.statusCode == HttpStatus.ok) {
      return MoviePageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(exceptionMessage);
    }
  }
}
