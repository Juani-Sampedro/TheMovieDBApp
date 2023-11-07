import 'package:flutter/material.dart';

import '../../core/parameter/app_initializer.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../../presentation/bloc/fav_bloc.dart';
import '../../presentation/bloc/genres_in_movie_detail_bloc.dart';
import '../../presentation/view/favorite_movies.dart';
import '../../presentation/view/future_movies.dart';
import '../../presentation/view/home.dart';
import '../../presentation/view/movie_detail.dart';
import '../../presentation/view/popular_movies.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routes(Initializer initCore) {
    return {
      Constants.homeRouteName: (context) => MultiProvider(
            providers: [
              Provider(create: (_) => initCore.genresBloc),
              Provider(create: (_) => initCore.favMoviesBloc),
              Provider(create: (_) => initCore.topRatedMoviesBloc),
            ],
            child: const Home(),
          ),
      Constants.popularMoviesRouteName: (context) => MultiProvider(
            providers: [
              Provider(create: (_) => initCore.genresBloc),
              Provider(create: (_) => initCore.favMoviesBloc),
              Provider(create: (_) => initCore.popularMoviesBloc)
            ],
            child: const PopularMovies(),
          ),
      Constants.upcomingMoviesRouteName: (context) => MultiProvider(
            providers: [
              Provider(create: (_) => initCore.genresBloc),
              Provider(create: (_) => initCore.favMoviesBloc),
              Provider(create: (_) => initCore.upcomingMoviesBloc)
            ],
            child: const FutureMovies(),
          ),
      Constants.favoriteMoviesRouteName: (context) => MultiProvider(
            providers: [Provider(create: (_) => initCore.favMoviesBloc)],
            child: const FavoriteMovies(),
          ),
    };
  }

  static void navigateToMovieDetails(
    Movie movie,
    BuildContext context,
    GenresInMovieDetailBloc genresBloc,
    FavMoviesBloc favBloc,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetail(
          bloc: genresBloc,
          movie: movie,
          favBloc: favBloc,
        ),
      ),
    );
  }
}
