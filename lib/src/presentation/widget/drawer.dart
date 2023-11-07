import 'package:flutter/material.dart';

import '../../core/util/colors.dart';
import '../../core/util/constants.dart';
import 'drawer_list_tile.dart';
import 'drawer_route.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final Image logoImage = Image.asset(
    fit: BoxFit.fill,
    Constants.logoImagePath,
  );
  final double drawerOpacity = 0.9;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: drawerOpacity,
      child: Drawer(
        backgroundColor: AppColors.appBarColor,
        child: ListView(
          children: [
            logoImage,
            DrawerListTile(
              icon: DrawerRoute.home.icon,
              text: DrawerRoute.home.routeName,
              routeToGo: DrawerRoute.home.route,
            ),
            DrawerListTile(
              icon: DrawerRoute.popular.icon,
              text: DrawerRoute.popular.routeName,
              routeToGo: DrawerRoute.popular.route,
            ),
            DrawerListTile(
              icon: DrawerRoute.upcoming.icon,
              text: DrawerRoute.upcoming.routeName,
              routeToGo: DrawerRoute.upcoming.route,
            ),
            DrawerListTile(
              icon: DrawerRoute.favorites.icon,
              text: DrawerRoute.favorites.routeName,
              routeToGo: DrawerRoute.favorites.route,
            ),
          ],
        ),
      ),
    );
  }
}
