import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/domain/model/genre.dart';
import 'package:movie_db_app/src/presentation/widget/chip_list.dart';

void main() {
  testWidgets(
    'List of genres displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GenresChipList(
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

      final textFinder = find.text('Action');
      final text2Finder = find.text('Adventure');
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
}
