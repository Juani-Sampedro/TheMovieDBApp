import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  final String iconKey = 'icon key';
  final TextStyle appBarTextStyle = const TextStyle(
    color: AppColors.appNameFontColor,
    fontFamily: Constants.appFontFamily,
    fontSize: Constants.appFontSize,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            key: Key(iconKey),
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.appNameFontColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      shape: Constants.borderAppBar,
      title: Text(
        Constants.appName,
        style: appBarTextStyle,
      ),
      centerTitle: true,
      backgroundColor: AppColors.appBarColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
