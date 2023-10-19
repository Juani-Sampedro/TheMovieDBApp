import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/presentation/widget/page_view.dart';

void main() {
  testWidgets('PageView created correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomPageView(
          movies: [
            Movie(
              id: 1,
              movieOverview: 'mo',
              voteAverage: 10,
              genres: [],
              originalTitle: 'ot',
              dateRelease: '2222-2-2',
              movieTitle: 'mt',
              imagePath: 'assets/images/backdrop.jpg',
              backdropPath: 'assets/images/backdrop.jpg',
              voteCount: 9,
              language: 'EN', categories: [],
            )
          ],
          pageController: PageController(),
        ),
      ),
    );
    await tester.pump();
    final pageFinder = find.byType(CustomPageView);
    expect(
      pageFinder,
      findsOneWidget,
    );
  });
}
