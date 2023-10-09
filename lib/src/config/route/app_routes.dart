import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/util/constants.dart';
import '../../data/datasource/remote/genres_api_service.dart';
import '../../data/repository/genre_repository_class.dart';
import '../../domain/model/movie.dart';
import '../../domain/usecase/implementation/genres_usecase_impl.dart';
import '../../domain/usecase/implementation/movies_usecase_impl.dart';
import '../../presentation/bloc/genres_in_movie_detail_bloc.dart';
import '../../presentation/bloc/movie_list_bloc.dart';
import '../../presentation/view/future_movies.dart';
import '../../presentation/view/home.dart';
import '../../presentation/view/movie_detail.dart';
import '../../presentation/view/popular_movies.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes() {
    return {
      Constants.homeRouteName: (context) => Home(
          bloc: MoviesBloc(
              useCase: MoviesUseCase(endpoint: Constants.homeEndpoint))),
      Constants.popularMoviesRouteName: (context) => PopularMovies(
          bloc: MoviesBloc(
              useCase:
                  MoviesUseCase(endpoint: Constants.popularMoviesEndpoint))),
      Constants.upcomingMoviesRouteName: (context) => FutureMovies(
          bloc: MoviesBloc(
              useCase:
                  MoviesUseCase(endpoint: Constants.upcomingMoviesEndpoint))),
    };
  }

  static void navigateToMovieDetails(
    Movie movie,
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetail(
          bloc: GenresInMovieDetailBloc(
              useCase: GenresUseCase(GenreRepository(
                  apiService: GenresApiService(client: http.Client())))),
          movie: movie,
        ),
      ),
    );
  }
}
