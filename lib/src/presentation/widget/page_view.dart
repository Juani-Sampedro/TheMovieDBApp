import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/route/app_routes.dart';
import '../../core/util/constants.dart';
import '../../domain/model/movie.dart';
import '../bloc/genres_in_movie_detail_bloc.dart';

class CustomPageView extends StatefulWidget {
  final PageController pageController;
  final List<Movie> movies;

  const CustomPageView({
    super.key,
    required this.movies,
    required this.pageController,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final List<BoxShadow>? shadow = const [
    BoxShadow(
      offset: Offset(
        0,
        4,
      ),
      blurRadius: 4,
      color: Colors.black26,
    ),
  ];
  final BorderRadiusGeometry? circularBorder = BorderRadius.circular(50);
  final double paddingInImageHorizontal = 20.0;
  final double paddingInImageVertical = 60.0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: PageView.builder(
          itemCount: widget.movies.length,
          physics: const ClampingScrollPhysics(),
          controller: widget.pageController,
          itemBuilder: (
            context,
            index,
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: paddingInImageVertical,
                        horizontal: paddingInImageHorizontal,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                                widget.movies[index].imagePath),
                          ),
                          borderRadius: circularBorder,
                          boxShadow: shadow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
