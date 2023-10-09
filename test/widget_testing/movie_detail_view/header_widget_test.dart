import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/header.dart';

void main() {
  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
          body:
              SafeArea(child: Header(backdrop: 'assets/images/backdrop.jpg'))),
    );
  }

  group(
    'Header displayed correctly',
    () {
      testWidgets(
        'Image displayed ',
        (WidgetTester tester) async {
          await tester.pumpWidget(buildWidget());
          final imageFinder = find.byType(CachedNetworkImage);
          expect(
            imageFinder,
            findsOneWidget,
          );
        },
      );
    },
  );
}
