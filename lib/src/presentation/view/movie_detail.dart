import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/states.dart';
import '../../data/datasource/remote/genres_api_service.dart';
import '../../domain/model/movie.dart';

import '../bloc/genres_in_movie_detail_bloc.dart';
import '../widget/error_message.dart';
import 'about_us.dart';
import '../../data/repository/genre_repository_class.dart';
import '../widget/description.dart';
import '../widget/header.dart';
import '../widget/subheader.dart';
import '../../core/util/constants.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    required this.movie,
    required this.bloc,
    super.key,
  });

  final Movie movie;
  final GenresInMovieDetailBloc bloc;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late int _likeCounter;
  final double sizedBoxHeight = 20;

  final GenreRepository genreJsonManagement = GenreRepository(
    apiService: GenresApiService(),
  );

  @override
  void initState() {
    super.initState();

    _likeCounter = widget.movie.voteCount;
  }

  @override
  void didChangeDependencies() {
    widget.bloc.initialize();
    super.didChangeDependencies();
  }

  _MovieDetailState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Constants.borderAppBar,
        iconTheme: const IconThemeData(color: AppColors.appNameFontColor),
        backgroundColor: AppColors.appBarColor,
      ),
      body: StreamBuilder(
        initialData: DataState(resultState: ResultState.loading),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          switch (snapshot.data?.resultState) {
            case ResultState.loading:
              return const AboutUs(text: Constants.textAboutUs);
            case ResultState.error:
              return ErrorMessage(snapshot.error.toString());
            case ResultState.empty:
              return const Text(Constants.emptyStateText);
            case ResultState.success:
              return SafeArea(
                child: Container(
                  decoration: Constants.backgroundDecoration,
                  child: ListView(
                    children: [
                      Header(backdrop: widget.movie.backdropPath),
                      SizedBox(height: sizedBoxHeight),
                      SubHeader(
                        imagePath: widget.movie.imagePath,
                        title: widget.movie.movieTitle,
                        originalTitle: widget.movie.originalTitle,
                        dateRelease: widget.movie.dateRelease,
                      ),
                      MovieDescription(
                        description: widget.movie.movieOverview,
                        voteAverage: widget.movie.voteAverage,
                        genres: genreJsonManagement.getNameFromIds(
                          widget.movie.genres,
                          snapshot.data.data,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Constants
                              .paddingHorizontalSymmetricForLikeCounterButton,
                          vertical: Constants
                              .paddingHorizontalSymmetricForLikeCounterButton,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () {
                                if (_likeCounter == widget.movie.voteCount) {
                                  setState(() => _likeCounter++);
                                }
                              },
                              backgroundColor:
                                  AppColors.likeButtonBackgroundColor,
                              splashColor: AppColors.likeButtonSplashColor,
                              label: Row(
                                children: [
                                  const Icon(
                                    Icons.thumb_up_outlined,
                                    color: AppColors.thumbUpIconColor,
                                  ),
                                  Text(
                                    ' $_likeCounter',
                                    style: const TextStyle(
                                        color: AppColors.thumbUpIconColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            default:
              return const AboutUs(text: Constants.textAboutUs);
          }
        },
        stream: widget.bloc.allGenres,
      ),
    );
  }
}
