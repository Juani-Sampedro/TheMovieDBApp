import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_app/src/core/util/states.dart';
import 'package:movie_db_app/src/domain/model/movie.dart';
import 'package:movie_db_app/src/presentation/widget/grid_view.dart';
import 'package:movie_db_app/src/presentation/widget/list_view.dart';
import 'package:movie_db_app/src/presentation/widget/page_view.dart';
import 'package:movie_db_app/src/presentation/widget/stream.dart';

Future<void> main() async {
  Future<DataState> getData(int numberState) async {
    ResultState resultState;
    switch (numberState) {
      case 1:
        resultState = ResultState.loading;
        break;
      case 2:
        resultState = ResultState.error;
        break;
      case 3:
        resultState = ResultState.success;
        break;
      case 4:
        resultState = ResultState.empty;
        break;
      default:
        resultState = ResultState.empty;
        break;
    }
    switch (resultState) {
      case ResultState.success:
        return DataState(
          resultState: resultState,
          data: [
            Movie(
              id:1,
              movieOverview: 'mo',
              voteAverage: 10,
              genres: [],
              originalTitle: 'ot',
              dateRelease: '2222-2-2',
              movieTitle: 'mt',
              imagePath: 'assets/images/backdrop.jpg',
              backdropPath: 'assets/images/backdrop.jpg',
              voteCount: 9,
              language: 'EN', categories: [],
            ),
          ],
        );
      default:
        return DataState(resultState: resultState);
    }
  }

  final Stream<DataState> moviesDataLoading = Stream.fromFuture(getData(1));
  final Stream<DataState> moviesDataError = Stream.fromFuture(getData(2));
  final Stream<DataState> gridViewDataSuccess = Stream.fromFuture(getData(3));
  final Stream<DataState> listViewDataSuccess = Stream.fromFuture(getData(3));
  final Stream<DataState> pageViewDataSuccess = Stream.fromFuture(getData(3));

  final Stream<DataState> moviesDataEmpty = Stream.fromFuture(getData(4));

  group(
    'Every case of the switch works correctly',
    () {
      testWidgets(
        'Correct success state, creating a GridView',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: gridViewDataSuccess,
                pageController: PageController(),
                widgetType: CustomGridView,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byType(CustomGridView),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Correct success state, creating a ListView',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: listViewDataSuccess,
                pageController: PageController(),
                widgetType: CustomListView,
              ),
            ),
          );
          await tester.pump();
          expect(
            find.byType(CustomListView),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Correct success state, creating a PageView',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: pageViewDataSuccess,
                pageController: PageController(),
                widgetType: CustomPageView,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byType(CustomPageView),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'Correct load state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: moviesDataLoading,
                pageController: PageController(),
                widgetType: CustomGridView,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(
              const Key('loading key'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Correct empty state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: moviesDataEmpty,
                pageController: PageController(),
                widgetType: CustomGridView,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(
              const Key('empty key'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Correct error state',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomStreamBuilder(
                data: moviesDataError,
                pageController: PageController(),
                widgetType: CustomGridView,
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(
            find.byKey(
              const Key('error key'),
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
