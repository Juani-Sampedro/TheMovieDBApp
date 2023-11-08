import 'package:flutter/material.dart';
import 'fav_grid_view.dart';
import 'page_view.dart';

import '../../core/util/states.dart';
import '../../core/util/constants.dart';
import '../view/about_us.dart';
import 'error_message.dart';
import 'grid_view.dart';
import 'list_view.dart';

class CustomStreamBuilder extends StatefulWidget {
  final Stream<DataState<dynamic>> data;
  final PageController pageController;
  final Type widgetType;

  const CustomStreamBuilder({
    super.key,
    required this.data,
    required this.pageController,
    required this.widgetType,
  });

  factory CustomStreamBuilder.listView(
      {required Stream<DataState<dynamic>> data}) {
    return CustomStreamBuilder(
      data: data,
      pageController: PageController(),
      widgetType: CustomListView,
    );
  }

  factory CustomStreamBuilder.gridView(
      {required Stream<DataState<dynamic>> data}) {
    return CustomStreamBuilder(
      data: data,
      pageController: PageController(),
      widgetType: CustomGridView,
    );
  }

  factory CustomStreamBuilder.favMoviesGridView(
      {required Stream<DataState<dynamic>> data}) {
    return CustomStreamBuilder(
      data: data,
      pageController: PageController(),
      widgetType: CustomFavGridView,
    );
  }

  factory CustomStreamBuilder.pageView({
    required Stream<DataState<dynamic>> data,
    required PageController pageController,
  }) {
    return CustomStreamBuilder(
      data: data,
      pageController: pageController,
      widgetType: CustomPageView,
    );
  }

  final String loadingStateKey = 'loading key';
  final String errorStateKey = 'error key';
  final String emptyStateKey = 'empty key';

  @override
  State<CustomStreamBuilder> createState() => _CustomStreamBuilderState();
}

class _CustomStreamBuilderState extends State<CustomStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DataState(resultState: ResultState.loading),
      stream: widget.data,
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        switch (snapshot.data?.resultState) {
          case ResultState.loading:
            return AboutUs(
              key: Key(widget.loadingStateKey),
              text: Constants.textAboutUs,
            );
          case ResultState.error:
            return ErrorMessage(
              key: Key(widget.errorStateKey),
              snapshot.error.toString(),
            );
          case ResultState.empty:
            return Text(
              key: Key(widget.emptyStateKey),
              Constants.emptyStateText,
            );
          case ResultState.success:
            if (widget.widgetType == CustomListView) {
              return CustomListView(movies: snapshot.data.data);
            } else if(widget.widgetType == CustomFavGridView){
              return CustomFavGridView(movies: snapshot.data.data);
            } else if (widget.widgetType == CustomGridView) {
              return CustomGridView(movies: snapshot.data.data);
            } else {
              return CustomPageView(
                movies: snapshot.data.data,
                pageController: widget.pageController,
              );
            }
          default:
            return const AboutUs(text: Constants.textAboutUs);
        }
      },
    );
  }
}
