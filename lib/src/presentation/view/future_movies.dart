import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/util/colors.dart';
import '../bloc/movie_list_bloc.dart';
import '../widget/custom_scaffold.dart';
import '../widget/stream.dart';
import '../widget/text_under_app_bar.dart';

class FutureMovies extends StatefulWidget {
  const FutureMovies({
    super.key,
  });

  @override
  State<FutureMovies> createState() => _FutureMoviesState();
}

class _FutureMoviesState extends State<FutureMovies> {
  final Icon questionIcon = const Icon(
    Icons.event_note_rounded,
    color: AppColors.iconInTextUnderAppBarColor,
  );
  final double viewportFractionInCarousel = 0.8;
  late PageController _pageController;
  final int _currentPage = 0;
  final String upcomingText = ' Upcoming Movies ';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: viewportFractionInCarousel,
    );
  }

  @override
  void didChangeDependencies() {
    Provider.of<MoviesBloc>(context).initialize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          TextUnderAppBar(
            text: upcomingText,
            icon: questionIcon,
          ),
          Flexible(
            child: CustomStreamBuilder.pageView(
              data: Provider.of<MoviesBloc>(context).allMovies,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}
