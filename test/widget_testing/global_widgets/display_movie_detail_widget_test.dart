import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/presentation/widget/display_movie_detail.dart';
import 'package:movie_db_app/src/presentation/widget/image.dart';

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
                  return DisplayMovie(movie: movie);
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
    'Movie details displayed correctly',
    () {
      testWidgets(
        'Image displayed ',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());
          final imageFinder = find.byType(MovieImage);
          expect(
            imageFinder,
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Star displayed ',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());
          final starFinder = find.byIcon(Icons.star);

          expect(
            starFinder,
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Movie texts displayed correctly',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            buildWidget(),
          );

          final textFinder = find.text('Title');
          final text2Finder = find.text('Original language: EN');
          final text3Finder = find.text('overview');
          final text4Finder = find.text('2.0/10');

          expect(
            textFinder,
            findsOneWidget,
          );
          expect(
            text2Finder,
            findsOneWidget,
          );
          expect(
            text3Finder,
            findsOneWidget,
          );
          expect(
            text4Finder,
            findsOneWidget,
          );
        },
      );
    },
  );
}
