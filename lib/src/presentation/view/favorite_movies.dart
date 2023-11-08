import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/colors.dart';
import '../bloc/fav_bloc.dart';
import '../widget/custom_scaffold.dart';
import '../widget/stream.dart';
import '../widget/text_under_app_bar.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({super.key});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  final Icon favIcon = const Icon(
    Icons.favorite,
    color: AppColors.iconInTextUnderAppBarColor,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<FavMoviesBloc>(context).initialize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const String favText = ' My Favorite Movies ';
    return CustomScaffold(
      body: Column(
        children: [
          TextUnderAppBar(
            text: favText,
            icon: favIcon,
          ),
          Flexible(
            child: CustomStreamBuilder.favView(
                data: Provider.of<FavMoviesBloc>(context).allMovies),
          )
        ],
      ),
    );
  }
}
