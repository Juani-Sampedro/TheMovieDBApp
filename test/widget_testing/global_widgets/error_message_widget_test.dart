import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/error_message.dart';

void main() {
  testWidgets(
    'Error message displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorMessage('Error'),
          ),
        ),
      );

      final textFinder = find.text('Error');
      final iconFinder = find.byIcon(Icons.error);
      expect(
        textFinder,
        findsOneWidget,
      );
      expect(
        iconFinder,
        findsOneWidget,
      );
    },
  );
}
