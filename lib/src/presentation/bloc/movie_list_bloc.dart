import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/util/categories.dart';
import '../../core/util/states.dart';
import '../../domain/usecase/implementation/movies_usecase_impl.dart';

class MoviesBloc implements IBloc {
  final MoviesUseCase useCase;
  final CategoryEnum category;
  final _movies = StreamController<DataState>.broadcast();

  MoviesBloc({
    required this.useCase, required this.category,
  });

  Stream<DataState> get allMovies => _movies.stream;

  @override
  void initialize() async {
    _movies.sink.add(
      DataState(resultState: ResultState.loading),
    );
    final movies = await useCase.call(category);
    _movies.sink.add(movies);
  }

  @override
  void dispose() {
    _movies.close();
  }
}
