import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/util/states.dart';
import '../../domain/model/fav_movie.dart';
import '../../domain/model/movie.dart';
import '../../domain/usecase/implementation/fav_movies_usecase_impl.dart';

class FavMoviesBloc implements IBloc {
  final FavMoviesUseCase useCase;
  final _movies = StreamController<DataState>.broadcast();

  FavMoviesBloc({required this.useCase});

  Stream<DataState> get allMovies => _movies.stream;

  Future<void> addFavMovie(FavMovie favMovie) async {
    await useCase.addMovie(favMovie);
  }

  Future<void> deleteFavMovie(FavMovie favMovie) async {
    await useCase.removeMovie(favMovie);
  }

  Future<bool> existById(int id) async {
    return await useCase.existFavMovieById(id);
  }

  @override
  void initialize() async {
    _movies.sink.add(
      DataState(resultState: ResultState.loading),
    );
    final movies = await useCase.getFavoritesMovies();
    _movies.sink.add(movies);
  }

  @override
  void dispose() {
    _movies.close();
  }
}
