import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/notification_service.dart';
import '../../core/util/states.dart';
import '../../data/datasource/remote/genres_api_service.dart';
import '../../domain/model/fav_movie.dart';
import '../../domain/model/movie.dart';

import '../bloc/fav_bloc.dart';
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
    required this.favBloc,
    required this.movie,
    required this.bloc,
    super.key,
  });

  final Movie movie;
  final GenresInMovieDetailBloc bloc;
  final FavMoviesBloc favBloc;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final movieAddedToFavText = 'Movie added to favorites';
  final movieAlreadyAdded = 'It was added before';
  final movieAlreadyRemoved = 'It was removed before';

  final movieRemovedFromFavText = 'Movie removed from favorites';

  late int _likeCounter;
  final double sizedBoxHeight = 20;
  Icon removeFromFavIcon = const Icon(
    CupertinoIcons.minus_square,
    color: Colors.red,
  );
  Icon addToFavIcon = const Icon(
    CupertinoIcons.plus_app,
    color: Colors.green,
  );
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton.extended(
                              heroTag: null,
                              onPressed: () async {
                                if (!await widget.favBloc
                                    .existFavMovieById(widget.movie.id)) {
                                  NotificationService().showNotification(
                                    title: movieAddedToFavText,
                                    body:
                                        '${widget.movie.movieTitle} has been added to your favorite list of movies',
                                  );
                                  widget.favBloc.saveFavMovie(
                                      FavMovie(id: widget.movie.id));
                                } else {
                                  NotificationService().showNotification(
                                    title: movieAlreadyAdded,
                                    body:
                                        '${widget.movie.movieTitle} has already been added to your favorite list of movies',
                                  );
                                }
                              },
                              backgroundColor:
                                  AppColors.likeButtonBackgroundColor,
                              splashColor: AppColors.likeButtonSplashColor,
                              label: Row(
                                children: [addToFavIcon],
                              ),
                            ),
                            FloatingActionButton.extended(
                              heroTag: null,
                              onPressed: () async {
                                if (await widget.favBloc
                                    .existFavMovieById(widget.movie.id)) {
                                  NotificationService().showNotification(
                                    title: movieRemovedFromFavText,
                                    body:
                                        '${widget.movie.movieTitle} has been removed from your favorite list of movies',
                                  );
                                  widget.favBloc.deleteFavMovie(
                                      FavMovie(id: widget.movie.id));
                                } else {
                                  NotificationService().showNotification(
                                    title: movieAlreadyRemoved,
                                    body:
                                        '${widget.movie.movieTitle} has already been removed from your favorite list of movies',
                                  );
                                }
                              },
                              backgroundColor:
                                  AppColors.likeButtonBackgroundColor,
                              splashColor: AppColors.likeButtonSplashColor,
                              label: Row(
                                children: [removeFromFavIcon],
                              ),
                            ),
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
