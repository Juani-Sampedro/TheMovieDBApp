import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/route/app_routes.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../bloc/genres_in_movie_detail_bloc.dart';

class CustomGridView extends StatefulWidget {
  final List<Movie> movies;

  const CustomGridView({
    super.key,
    required this.movies,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    const TextStyle movieTitleTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 24,
      fontFamily: Constants.homeTextFontFamily,
    );
    const SliverGridDelegate sliverGridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.5,
    );
    const double gridVerticalPadding = 12.0;
    const double imageWidth = 200;
    const double imageHeight = 300;
    const BorderRadiusGeometry circularBorder =
        BorderRadius.all(Radius.circular(11));

    const SizedBox sizedBox = SizedBox(
      height: 10,
    );

    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: gridVerticalPadding),
          itemCount: widget.movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return GestureDetector(
              onTap: () {
                AppRoutes.navigateToMovieDetails(
                  widget.movies[index],
                  context,
                  Provider.of<GenresInMovieDetailBloc>(
                    context,
                    listen: false,
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            widget.movies[index].imagePath),
                      ),
                      borderRadius: circularBorder,
                      color: Colors.transparent,
                    ),
                  ),
                  sizedBox,
                  Text(
                    widget.movies[index].movieTitle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: movieTitleTextStyle,
                  )
                ],
              ),
            );
          },
          gridDelegate: sliverGridDelegate,
        ),
      ),
    );
  }
}
