import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/image.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(
      home: Scaffold(body: MovieImage(imagePath: 'assets/images/backdrop.jpg')),
    );
  }

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
}
