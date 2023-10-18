import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/presentation/widget/drawer.dart';

void main() {
  testWidgets(
    'Drawer List tile displayed correctly ',
    (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: const MyDrawer(),
          ),
        ),
      );
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();
      final drawer = find.byType((Drawer));
      await tester.tap(drawer);
      final listTile = find.byType((ListTile));
      expect(
        listTile,
        findsWidgets,
      );
    },
  );
}
