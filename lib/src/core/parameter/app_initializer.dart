
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../data/datasource/local/floor_movie_db.dart';
import '../../data/datasource/local/genre_db.dart';
import '../../data/datasource/local/movie_db.dart';
import '../../data/datasource/remote/genres_api_service.dart';
import '../../data/datasource/remote/movie_list_api_service.dart';
import '../../data/repository/genre_repository_class.dart';
import '../../data/repository/genre_repository_from_database.dart';
import '../../data/repository/movie_repository_from_apiservice.dart';
import '../../data/repository/movie_repository_from_database.dart';
import '../../domain/usecase/implementation/fav_movies_usecase_impl.dart';
import '../../domain/usecase/implementation/genres_usecase_impl.dart';
import '../../domain/usecase/implementation/movies_usecase_impl.dart';
import '../../presentation/bloc/fav_bloc.dart';
import '../../presentation/bloc/genres_in_movie_detail_bloc.dart';
import '../../presentation/bloc/movie_list_bloc.dart';
import 'package:http/http.dart' as http;

import '../util/categories.dart';
import '../util/constants.dart';

class Initializer {
  late MovieListApiService _moviesApiService;
  late GenresApiService _genresApiService;

  late MovieRepoFromApiService _topRatedMovieRepositoryFromApiService;
  late MovieRepoFromApiService _upcomingMovieRepositoryFromApiService;
  late MovieRepoFromApiService _popularMoviesRepositoryFromApiService;
  late MovieDatabase _movieDatabase;
  late GenreDatabase _genreDatabase;
  late GenreRepository _genreRepository;
  late MovieRepoFromDB _repoFromDB;
  late GenreRepoFromDB _genreRepoFromDB;

  late MoviesUseCase _topRatedMoviesUseCase;
  late MoviesUseCase _upcomingMoviesUseCase;
  late MoviesUseCase _popularMoviesUseCase;
  late GenresUseCase _genresUseCase;
  late FavMoviesUseCase _favMoviesUseCase;

  late MoviesBloc _topRatedMoviesBloc;
  late MoviesBloc _upcomingMoviesBloc;
  late MoviesBloc _popularMoviesBloc;
  late GenresInMovieDetailBloc _genresBloc;
  late FavMoviesBloc _favMoviesBloc;
  late FloorMovieDatabase _floorDatabase;

  MoviesBloc get topRatedMoviesBloc => _topRatedMoviesBloc;

  MoviesBloc get upcomingMoviesBloc => _upcomingMoviesBloc;

  MoviesBloc get popularMoviesBloc => _popularMoviesBloc;

  FavMoviesBloc get favMoviesBloc => _favMoviesBloc;

  GenresInMovieDetailBloc get genresBloc => _genresBloc;

  FloorMovieDatabase get database => _floorDatabase;

  Future<bool> initialize() async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    _floorDatabase = await $FloorFloorMovieDatabase
        .databaseBuilder(Constants.databaseName)
        .build();
    _genreDatabase = GenreDatabase(_floorDatabase);
    _movieDatabase = MovieDatabase(_floorDatabase);
    _moviesApiService = MovieListApiService(client: http.Client());
    _genresApiService = GenresApiService();

    _repoFromDB = MovieRepoFromDB(movieDatabase: _movieDatabase);
    _genreRepoFromDB = GenreRepoFromDB(genreDatabase: _genreDatabase);
    _topRatedMovieRepositoryFromApiService = MovieRepoFromApiService(
      apiService: _moviesApiService,
      endpoint: Constants.topRatedMoviesEndpoint,
    );
    _upcomingMovieRepositoryFromApiService = MovieRepoFromApiService(
      apiService: _moviesApiService,
      endpoint: Constants.upcomingMoviesEndpoint,
    );
    _popularMoviesRepositoryFromApiService = MovieRepoFromApiService(
      apiService: _moviesApiService,
      endpoint: Constants.popularMoviesEndpoint,
    );
    _genreRepository = GenreRepository(apiService: _genresApiService);

    _topRatedMoviesUseCase = MoviesUseCase(
      repoFromApiService: _topRatedMovieRepositoryFromApiService,
      repoFromDB: _repoFromDB,
    );
    _upcomingMoviesUseCase = MoviesUseCase(
      repoFromApiService: _upcomingMovieRepositoryFromApiService,
      repoFromDB: _repoFromDB,
    );
    _popularMoviesUseCase = MoviesUseCase(
      repoFromApiService: _popularMoviesRepositoryFromApiService,
      repoFromDB: _repoFromDB,
    );
    _genresUseCase = GenresUseCase(
      repository: _genreRepository,
      repoFromDB: _genreRepoFromDB,
    );
    _favMoviesUseCase = FavMoviesUseCase(
      repoFromDB: _repoFromDB,
    );


    _favMoviesBloc = FavMoviesBloc(useCase: _favMoviesUseCase);
    _topRatedMoviesBloc = MoviesBloc(
      useCase: _topRatedMoviesUseCase,
      category: CategoryEnum.topRated,
    );
    _upcomingMoviesBloc = MoviesBloc(
      useCase: _upcomingMoviesUseCase,
      category: CategoryEnum.upcoming,
    );
    _popularMoviesBloc = MoviesBloc(
      useCase: _popularMoviesUseCase,
      category: CategoryEnum.popular,
    );
    _genresBloc = GenresInMovieDetailBloc(useCase: _genresUseCase);

    return true;
  }
}
