import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db_app/src/core/util/states.dart';
import 'package:movie_db_app/src/domain/model/genre.dart';
import 'package:movie_db_app/src/domain/usecase/implementation/genres_usecase_impl.dart';
import 'package:movie_db_app/src/presentation/bloc/genres_in_movie_detail_bloc.dart';
import 'genre_bloc_unit_test.mocks.dart';

@GenerateMocks([
  GenresUseCase,
])
void main() {
  final mock = MockGenresUseCase();
  GenresInMovieDetailBloc bloc = GenresInMovieDetailBloc(useCase: mock);
  test('checks if the genre stream has data', () async {
    when(bloc.useCase.call()).thenAnswer(
      (realInvocation) => Future.value(
        DataState(
          data: [
            Genre(
              id: 80,
              name: 'Crime',
            ),
            Genre(
              id: 53,
              name: 'Thriller',
            ),
          ],
          resultState: ResultState.success,
        ),
      ),
    );
    bloc.initialize();

    expectLater(
      bloc.allGenres,
      emits(DataState(resultState: ResultState.success)),
    );
  });
}
