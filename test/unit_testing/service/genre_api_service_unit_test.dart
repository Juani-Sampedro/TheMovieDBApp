import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/data/datasource/remote/genres_api_service.dart';

import 'genre_api_service_unit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GenresApiService>(), MockSpec<http.Client>()])
void main() {
  final mockClient = MockClient();
  test('fetch from GenreApiService behave correctly', () async {
    when(mockClient.get(Uri.parse(
            '${Constants.baseUrl}/3/genre/movie/list?${Constants.apiKey}')))
        .thenAnswer(
      (_) async =>
          http.Response('{"genres": [{"id": 28,"name": "Action"}]}', 200),
    );

    GenresApiService apiService = GenresApiService();
    final fetch = (await apiService.fetch('/genre/movie/list?')).results;

    expect(
      fetch,
      isNotEmpty,
    );
  });

  test('throw exception if the status code is different of 200', () async {
    when(mockClient.get(Uri.parse(
            '${Constants.baseUrl}/3/genre/movie/list?${Constants.apiKey}')))
        .thenAnswer(
      (_) async => throw Exception('Failed to load the genres'),
    );

    GenresApiService apiService = GenresApiService();

    expect(
      apiService.fetch(''),
      throwsException,
    );
  });
}
