import 'package:flutter/material.dart';
import '../bloc/movie_list_bloc.dart';
import '../widget/custom_scaffold.dart';
import '../widget/stream.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({
    super.key,
    required this.bloc,
  });

  final MoviesBloc bloc;

  static const double paddingInListView = 15;

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  void initState() {
    super.initState();
    widget.bloc.initialize();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: CustomStreamBuilder.listView(data: widget.bloc.allMovies));
  }
}
