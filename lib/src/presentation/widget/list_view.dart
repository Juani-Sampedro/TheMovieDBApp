import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../view/popular_movies.dart';
import 'display_movie_detail.dart';

class CustomListView extends StatefulWidget {
  final List<Movie> movies;

  const CustomListView({
    super.key,
    required this.movies,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final double dividerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(PopularMovies.paddingInListView),
          itemCount: widget.movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return DisplayMovie(movie: widget.movies[index]);
          },
          separatorBuilder: (
            BuildContext context,
            int index,
          ) =>
              Divider(
            height: dividerHeight,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
