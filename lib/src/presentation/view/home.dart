import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/colors.dart';
import '../bloc/movie_list_bloc.dart';
import '../widget/custom_scaffold.dart';
import '../widget/stream.dart';
import '../widget/text_under_app_bar.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Icon topRatedIcon = const Icon(
    Icons.leaderboard,
    color: AppColors.iconInTextUnderAppBarColor,
  );

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
    const String topRatedText = ' Top Rated Movies ';
    return CustomScaffold(
      body: Column(
        children: [
          TextUnderAppBar(
            text: topRatedText,
            icon: topRatedIcon,
          ),
          Flexible(
              child: CustomStreamBuilder.gridView(
                  data: Provider.of<MoviesBloc>(context).allMovies)),
        ],
      ),
    );
  }
}
