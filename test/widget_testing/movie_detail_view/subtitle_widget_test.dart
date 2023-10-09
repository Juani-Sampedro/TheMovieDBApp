import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/constants.dart';
import 'package:movie_db_app/src/presentation/widget/subtitle.dart';
import 'package:movie_db_app/src/presentation/widget/subtitle_text.dart';

void main() {
  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          child: DecoratedBox(
            decoration: Constants.backgroundDecoration,
            child: SafeArea(
              child: ListView.separated(
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return const MovieSubtitle(
                    originalTitle: 'title',
                    dateRelease: 'date',
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    const Divider(
                  height: 2,
                  color: Colors.transparent,
                ),
                itemCount: 1,
              ),
            ),
          ),
        ),
      )
    );
  }

  testWidgets(
    'Subtitle texts displayed correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget());

      final textFinder = find.byType(SubtitleText);

      expect(
        textFinder,
        findsWidgets,
      );
    },
  );
}
