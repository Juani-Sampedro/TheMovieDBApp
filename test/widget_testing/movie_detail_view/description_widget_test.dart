import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/domain/model/genre.dart';
import 'package:movie_db_app/src/presentation/widget/description.dart';

void main() {
  testWidgets(
    'Description displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieDescription(
              description: 'movie description',
              voteAverage: 2,
              genres: [
                Genre(
                  id: 1,
                  name: 'Action',
                ),
                Genre(
                  id: 2,
                  name: 'Adventure',
                ),
              ],
            ),
          ),
        ),
      );

      final textFinder = find.text('movie description');

      final text2Finder = find.text('Adventure');
      final text3Finder = find.text('Action');

      final starBorderFinder = find.byIcon(Icons.star_border);

      final starFinder = find.byIcon(Icons.star);
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
        starFinder,
        findsWidgets,
      );
      expect(
        starBorderFinder,
        findsWidgets,
      );
    },
  );
}
