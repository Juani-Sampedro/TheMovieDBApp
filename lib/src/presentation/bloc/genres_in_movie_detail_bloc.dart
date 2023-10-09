import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/util/states.dart';
import '../../domain/usecase/implementation/genres_usecase_impl.dart';

class GenresInMovieDetailBloc implements IBloc {
  final GenresUseCase useCase;

  final _genres = StreamController<DataState<dynamic>>.broadcast();

  Stream<DataState> get allGenres => _genres.stream;

  GenresInMovieDetailBloc({required this.useCase});

  @override
  void initialize() async {
    DataState genres = await useCase.call();
    _genres.sink.add(genres);
  }

  @override
  void dispose() {
    _genres.close();
  }
}
