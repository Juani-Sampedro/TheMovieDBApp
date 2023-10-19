import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db_app/src/core/util/categories.dart';
import 'package:movie_db_app/src/core/util/states.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/domain/usecase/implementation/movies_usecase_impl.dart';
import 'package:movie_db_app/src/presentation/bloc/movie_list_bloc.dart';
import 'movie_bloc_unit_test.mocks.dart';

@GenerateMocks([
  MoviesUseCase,
])
void main() {
  final mock = MockMoviesUseCase();
  MoviesBloc bloc = MoviesBloc(useCase: mock, category: CategoryEnum.popular);
  test(
    'checks if the movie stream has data',
    () async {
      when(bloc.useCase.call(CategoryEnum.popular)).thenAnswer(
        (realInvocation) => Future.value(
          DataState(
            data: [
              Movie(
                id: 1,
                language: 'en',
                voteCount: 1234,
                originalTitle: 'The Super Mario Bros. Movie',
                movieTitle: 'The Super Mario Bros. Movie',
                genres: [
                  18,
                  24,
                  16,
                ],
                backdropPath:
                    'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
                imagePath:
                    'https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
                dateRelease: '2023-04-05',
                voteAverage: 7.8,
                movieOverview:
                    'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi '
                    'are transported down a mysterious pipe and wander into a magical new world. But when the '
                    'brothers are separated, Mario embarks on an epic quest to find Luigi.',
                categories: [],
              )
            ],
            resultState: ResultState.success,
          ),
        ),
      );

      bloc.initialize();
      expect(
        bloc.allMovies,
        emits(DataState(resultState: ResultState.success)),
      );
    },
  );
}
