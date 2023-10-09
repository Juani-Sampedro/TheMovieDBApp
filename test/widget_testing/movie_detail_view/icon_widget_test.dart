import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/icon.dart';

void main() {
  testWidgets(
    'Icons displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DescriptionIcon(
              icon: Icons.star,
              numberOfIconsCreated: 1,
            ),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.star);
      expect(
        iconFinder,
        findsOneWidget,
      );
    },
  );
}
