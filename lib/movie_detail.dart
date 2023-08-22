import 'package:flutter/material.dart';
import 'widgets/description.dart';
import 'widgets/header.dart';
import 'model/movie.dart';
import 'widgets/subheader.dart';
import 'shared/constants.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  int _likeCounter = 0;
  final Movie movie = Movie.mockMovie();

  static const String appName = 'The MovieDB App';

  _MovieDetailState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: TextStyle(
            fontFamily: ConstantsClass.appFontFamily,
            fontSize: ConstantsClass.appFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ConstantsClass.appColor,
        leading: const Icon(Icons.menu_rounded),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              Header(backdrop: movie.backdropPath),
              SubHeader(
                  imagePath: movie.imagePath,
                  title: movie.movieTitle,
                  originalTitle: movie.originalTitle,
                  dateRelease: movie.dateRelease),
              Description(
                description: movie.movieOverview,
                voteAverage: movie.voteAverage,
                genres: movie.genres,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _likeCounter++),
        backgroundColor: Colors.red,
        splashColor: Colors.redAccent,
        label: Row(
          children: [
            const Icon(
              Icons.thumb_up,
              color: Colors.white,
            ),
            Text(
              ' $_likeCounter',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
