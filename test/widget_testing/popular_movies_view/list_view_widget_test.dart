import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/presentation/widget/list_view.dart';

void main() {
  testWidgets(
    'ListView created correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: CustomListView(movies: [
        Movie(
            movieOverview: 'mo',
            id: 1,
            voteAverage: 10,
            genres: [],
            originalTitle: 'ot',
            dateRelease: '2222-2-2',
            movieTitle: 'mt',
            imagePath: 'assets/images/backdrop.jpg',
            backdropPath: 'assets/images/backdrop.jpg',
            voteCount: 9,
            language: 'EN', categories: [])
      ])));
      await tester.pump();
      final listFinder = find.byType(CustomListView);
      expect(
        listFinder,
        findsOneWidget,
      );
    },
  );
}
