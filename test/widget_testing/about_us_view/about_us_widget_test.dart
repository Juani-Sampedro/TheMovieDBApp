import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/presentation/view/about_us.dart';

void main() {
  testWidgets('AboutUs has a text given as a parameter',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AboutUs(text: Constants.textAboutUs)),
    );
    await tester.pumpAndSettle(
      const Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: Constants.textAboutUs.length * 80),
    );
    final textFinder = find.text(Constants.textAboutUs);
    expect(
      textFinder,
      findsOneWidget,
    );
  });
}
