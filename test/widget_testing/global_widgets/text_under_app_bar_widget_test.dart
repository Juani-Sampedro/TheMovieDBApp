import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/text_under_app_bar.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: TextUnderAppBar(
          text: 'Title',
          icon: Icon(Icons.star),
        ),
      ),
    );
  }

  group(
    'Text and icons displayed correctly',
    () {
      testWidgets(
        'Stars displayed ',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());
          final starFinder = find.byIcon(Icons.star);

          expect(
            starFinder,
            findsWidgets,
          );
        },
      );

      testWidgets(
        'Movie texts displayed correctly',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());

          final textFinder = find.text('Title');
          expect(
            textFinder,
            findsOneWidget,
          );
        },
      );
    },
  );
}
