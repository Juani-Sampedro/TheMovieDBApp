import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/presentation/widget/app_bar.dart';

void main() {
  group(
    'Custom AppBar created correctly',
    () {
      testWidgets('Custom AppBar displayed app name', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(home: MyAppBar()),
        );

        final textFinder = find.text(Constants.appName);
        expect(
          textFinder,
          findsOneWidget,
        );
      });

      testWidgets(
        'Custom AppBar shows an icon',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(home: MyAppBar()),
          );

          final iconFinder = find.byIcon(Icons.menu_rounded);
          expect(
            iconFinder,
            findsOneWidget,
          );
        },
      );
    },
  );
}
