import 'package:flutter/material.dart';
import '../../domain/model/genre.dart';
import '../../domain/model/movie.dart';
import '../../domain/repository/interfaces/i_genre_repository.dart';
import '../widgets/error_message.dart';
import 'about_us.dart';
import '/src/presentation/widgets/app_bar.dart';
import '../../data/repository/genre_repository_class.dart';
import '/src/presentation/widgets/back_button.dart';
import '/src/presentation/widgets/description.dart';
import '/src/presentation/widgets/header.dart';
import '/src/presentation/widgets/subheader.dart';
import '../../core/util/constants.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late int _likeCounter;
  final IGenreRepository<List<Genre>> genreJsonManagement = GenreJsonManagement();
  final double sizedBoxHeight = 20;
  final Color likeButtonBackgroundColor = const Color(0xFF03607F);
  final Color likeButtonSplashColor = const Color(0XFF5CBBDB);
  final Color thumbUpIconColor = const Color(0XFF34ABD3);
  final String backgroundImagePath = 'assets/images/white.png';
  late Future<List<Genre>> genresData;

  @override
  void initState() {
    genresData = genreJsonManagement.getData();
    super.initState();
    _likeCounter = widget.movie.voteCount;
  }

  _MovieDetailState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
      ),
      body: FutureBuilder<List<Genre>>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AboutUs();
          } else if (snapshot.hasError) {
            return const ErrorMessage();
          } else {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      backgroundImagePath,
                    ),
                  ),
                ),
                child: ListView(
                  children: [
                    Header(
                      backdrop: widget.movie.backdropPath,
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                    SubHeader(
                      imagePath: widget.movie.imagePath,
                      title: widget.movie.movieTitle,
                      originalTitle: widget.movie.originalTitle,
                      dateRelease: widget.movie.dateRelease,
                    ),
                    Description(
                      description: widget.movie.movieOverview,
                      voteAverage: widget.movie.voteAverage,
                      genres: genreJsonManagement.getNameFromIds(
                        widget.movie.genres,
                        snapshot.data,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        future: genresData,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantsClass.paddingHorizontalSymmetricForBackbutton,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyBackButton(),
            FloatingActionButton.extended(
              onPressed: () {
                if (_likeCounter == widget.movie.voteCount) {
                  setState(
                    () => _likeCounter++,
                  );
                }
              },
              backgroundColor: likeButtonBackgroundColor,
              splashColor: likeButtonSplashColor,
              label: Row(
                children: [
                  Icon(
                    Icons.thumb_up_outlined,
                    color: thumbUpIconColor,
                  ),
                  Text(
                    ' $_likeCounter',
                    style: TextStyle(
                      color: thumbUpIconColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
