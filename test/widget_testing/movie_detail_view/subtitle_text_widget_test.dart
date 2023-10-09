import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/subtitle_text.dart';

void main() {
  testWidgets(
    'Subtitle text displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: SubtitleText(text: 'text'))),
      );

      final textFinder = find.text('text');

      expect(
        textFinder,
        findsOneWidget,
      );
    },
  );
}
