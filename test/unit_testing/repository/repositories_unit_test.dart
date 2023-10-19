import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/core/util/states.dart';
import 'package:movie_db_app/src/data/datasource/remote/i_api_service.dart';
import 'package:movie_db_app/src/data/model/genre_page_model.dart';
import 'package:movie_db_app/src/data/model/movie_page_model.dart';
import 'package:movie_db_app/src/data/repository/genre_repository_class.dart';
import 'package:movie_db_app/src/data/repository/movie_repository_from_apiservice.dart';

class MovieApiProviderSuccess implements IApiService {
  @override
  Future<MoviePageModel> fetch(String endpoint) async {
    return MoviePageModel.fromJson(
      {
        'page': 2,
        'total_results': 2,
        'total_pages': 2,
        'results': [
          {
            "adult": false,
            "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
            "genre_ids": [14, 28, 12],
            "id": 455476,
            "original_language": "en",
            "original_title": "Knights of the Zodiac",
            "overview":
                "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
            "popularity": 3963.447,
            "poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
            "release_date": "2023-04-27",
            "title": "Knights of the Zodiac",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 367
          },
        ],
      },
    );
  }
}

class MovieApiProviderEmpty implements IApiService {
  @override
  Future<MoviePageModel> fetch(String endpoint) async {
    return MoviePageModel.fromJson(
      {
        'page': 2,
        'total_results': 2,
        'total_pages': 2,
        'results': [],
      },
    );
  }
}

class MovieApiProviderFailure implements IApiService {
  @override
  Future fetch(String endpoint) {
    throw Exception('Error');
  }
}

class GenreApiProvideSuccess implements IApiService {
  @override
  Future<GenrePageModel> fetch(String endpoint) async {
    return GenrePageModel.fromJson({
      'genres': [
        {"id": 53, "name": "Thriller"},
        {"id": 80, "name": "Crime"},
      ],
    });
  }
}

class GenreApiProvideEmpty implements IApiService {
  @override
  Future<GenrePageModel> fetch(String endpoint) async {
    return GenrePageModel.fromJson({
      'genres': [],
    });
  }
}

class GenreApiProvideFailure implements IApiService {
  @override
  Future fetch(String endpoint) {
    throw Exception('Error');
  }
}

void main() {
  group('testing each possibility in repositories', () {
    test('getData() from MovieRepository behave correctly in a success state',
        () async {
      final MovieRepoFromApiService repository = MovieRepoFromApiService(
        endpoint: Constants.topRatedMoviesEndpoint,
        apiService: MovieApiProviderSuccess(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.success),
      );
    });

    test('getData() from MovieRepository behave correctly in an empty state',
        () async {

      final MovieRepoFromApiService repository = MovieRepoFromApiService(
        endpoint: Constants.topRatedMoviesEndpoint,
        apiService: MovieApiProviderEmpty(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.empty),
      );
    });

    test('getData() from MovieRepository behave correctly in an error state',
        () async {
      final MovieRepoFromApiService repository = MovieRepoFromApiService(
        endpoint: Constants.topRatedMoviesEndpoint,
        apiService: MovieApiProviderFailure(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.error),
      );
    });

    test('getData() from GenreRepository behave correctly in a success state',
        () async {
      final GenreRepository repository = GenreRepository(
        apiService: GenreApiProvideSuccess(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.success),
      );
    });

    test('getData() from GenreRepository behave correctly in an empty state',
        () async {
      final GenreRepository repository = GenreRepository(
        apiService: GenreApiProvideEmpty(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.empty),
      );
    });

    test('getData() from GenreRepository behave correctly in an error state',
        () async {
      final GenreRepository repository = GenreRepository(
        apiService: GenreApiProvideFailure(),
      );
      final DataState dataState = await repository.getData();
      expect(
        dataState.resultState,
        equals(ResultState.error),
      );
    });
  });
}
