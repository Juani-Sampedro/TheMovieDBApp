import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/description_text.dart';

void main() {
  testWidgets(
    'Description displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DescriptionText(
              text: 'Action',
              align: TextAlign.justify,
            ),
          ),
        ),
      );

      final textFinder = find.text('Action');

      expect(
        textFinder,
        findsOneWidget,
      );
    },
  );
}
