import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/data/datasource/remote/movie_list_api_service.dart';

import 'movie_api_service_unit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieListApiService>(), MockSpec<http.Client>()])
void main() {
  final mockClient = MockClient();

  test('throw exception if the status code is different of 200', () async {
    when(mockClient.get(Uri.parse(
            '${Constants.baseUrl}${Constants.popularMoviesEndpoint}?${Constants.apiKey}')))
        .thenAnswer(
      (_) async => throw Exception('Failed to load the movies'),
    );

    MovieListApiService apiService = MovieListApiService(
      endpoint: Constants.popularMoviesEndpoint,
      client: mockClient,
    );

    expect(
      apiService.fetch(),
      throwsException,
    );
  });

  test(
    'fetch from MovieListApiService behave correctly',
    () async {
      when(mockClient.get(Uri.parse(
              '${Constants.baseUrl}${Constants.popularMoviesEndpoint}?${Constants.apiKey}')))
          .thenAnswer((_) async => http.Response(
              '{"results": [{"adult": false,"backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg","genre_ids": [14,28,12],"id": 455476,"original_language": "en","original_title": "Knights of the Zodiac","overview": "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?","popularity": 3963.447,"poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg","release_date": "2023-04-27","title": "Knights of the Zodiac","video": false,"vote_average": 6.5,"vote_count": 367}]}',
              200));

      MovieListApiService apiService = MovieListApiService(
        endpoint: Constants.popularMoviesEndpoint,
        client: mockClient,
      );
      final fetch = (await apiService.fetch()).results;

      expect(
        fetch,
        isNotEmpty,
      );
    },
  );
}
