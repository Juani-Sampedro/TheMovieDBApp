// Mocks generated by Mockito 5.4.2 from annotations
// in movie_db_app/test/unit_testing/bloc/genre_bloc_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_db_app/src/core/util/categories.dart' as _i7;
import 'package:movie_db_app/src/core/util/states.dart' as _i4;
import 'package:movie_db_app/src/data/datasource/local/genre_db.dart' as _i3;
import 'package:movie_db_app/src/data/repository/genre_repository_class.dart'
    as _i2;
import 'package:movie_db_app/src/domain/usecase/implementation/genres_usecase_impl.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGenreRepository_0 extends _i1.SmartFake
    implements _i2.GenreRepository {
  _FakeGenreRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGenreDatabase_1 extends _i1.SmartFake implements _i3.GenreDatabase {
  _FakeGenreDatabase_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_2<T> extends _i1.SmartFake implements _i4.DataState<T> {
  _FakeDataState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GenresUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGenresUseCase extends _i1.Mock implements _i5.GenresUseCase {
  MockGenresUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GenreRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeGenreRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.GenreRepository);

  @override
  _i3.GenreDatabase get genreDatabase => (super.noSuchMethod(
        Invocation.getter(#genreDatabase),
        returnValue: _FakeGenreDatabase_1(
          this,
          Invocation.getter(#genreDatabase),
        ),
      ) as _i3.GenreDatabase);

  @override
  _i6.Future<_i4.DataState<dynamic>> call([_i7.CategoryEnum? category]) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [category],
        ),
        returnValue:
            _i6.Future<_i4.DataState<dynamic>>.value(_FakeDataState_2<dynamic>(
          this,
          Invocation.method(
            #call,
            [category],
          ),
        )),
      ) as _i6.Future<_i4.DataState<dynamic>>);
}
