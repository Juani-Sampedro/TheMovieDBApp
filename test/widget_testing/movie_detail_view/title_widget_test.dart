import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/title.dart';

void main() {
  testWidgets(
    'Title displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: MovieTitle(title: 'title'))));

      final textFinder = find.text('title');

      expect(
        textFinder,
        findsOneWidget,
      );
    },
  );
}
