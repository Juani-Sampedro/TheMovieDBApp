import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

enum DrawerRoute {
  home(
    Icons.home,
    'Home',
    Constants.homeRouteName,
  ),
  popular(
    Icons.stars_rounded,
    'Popular Movies',
    Constants.popularMoviesRouteName,
  ),
  upcoming(
    Icons.arrow_forward_outlined,
    'Upcoming Movies',
    Constants.upcomingMoviesRouteName,
  ),
  favorites(
  Icons.favorite,
  'Favorite Movies',
  Constants.favoriteMoviesRouteName,
  );

  const DrawerRoute(
    this.icon,
    this.routeName,
    this.route,
  );

  final IconData icon;
  final String routeName;
  final String route;
}
