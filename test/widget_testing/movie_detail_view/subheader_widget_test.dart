import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/presentation/widget/image.dart';
import 'package:movie_db_app/src/presentation/widget/subheader.dart';
import 'package:movie_db_app/src/presentation/widget/subtitle.dart';
import 'package:movie_db_app/src/presentation/widget/title.dart';

void main() {
  Widget buildWidget() {
    final movie = Movie(
      movieOverview: 'overview',
      voteAverage: 2,
      genres: [],
      originalTitle: '',
      dateRelease: '',
      movieTitle: 'Title',
      imagePath: 'assets/images/gradient.jpg',
      backdropPath: '',
      voteCount: 2,
      language: 'EN',
    );

    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          child: DecoratedBox(
            decoration: Constants.backgroundDecoration,
            child: SafeArea(
              child: ListView.separated(
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return SubHeader(
                    originalTitle: movie.originalTitle,
                    dateRelease: movie.dateRelease,
                    title: movie.movieTitle,
                    imagePath: movie.imagePath,
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    const Divider(
                  height: 2,
                  color: Colors.transparent,
                ),
                itemCount: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  group(
    'Subheader displayed correctly',
    () {
      testWidgets('Image displayed ', (WidgetTester tester) async {
        await tester.pumpWidget(buildWidget());
        final imageFinder = find.byType(MovieImage);
        expect(
          imageFinder,
          findsOneWidget,
        );
      });

      testWidgets(
        'Movie texts displayed correctly',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());

          final textFinder = find.byType(MovieTitle);
          final text2Finder = find.byType(MovieSubtitle);

          expect(
            textFinder,
            findsOneWidget,
          );
          expect(
            text2Finder,
            findsOneWidget,
          );
        },
      );
    },
  );
}
