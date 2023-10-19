import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/movie_list_bloc.dart';
import '../widget/custom_scaffold.dart';
import '../widget/stream.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({
    super.key,
  });

  static const double paddingInListView = 15;

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<MoviesBloc>(context).initialize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: CustomStreamBuilder.listView(
            data: Provider.of<MoviesBloc>(context).allMovies));
  }
}
