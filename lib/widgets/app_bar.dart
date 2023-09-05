import 'package:flutter/material.dart';
import 'package:movie_db_app/widgets/popup_menu_item.dart';
import '/shared/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.appBar,
  });

  final double boxConstraintsMaxWidth = 125;
  final AppBar appBar;
  final int homePopupItemValue = 0;
  final String homePopupItemName = 'Home';

  final TextStyle appBarTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: ConstantsClass.appFontFamily,
    fontSize: ConstantsClass.appFontSize,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        ConstantsClass.appName,
        style: appBarTextStyle,
      ),
      centerTitle: true,
      backgroundColor: ConstantsClass.appColor,
      leading: PopupMenuButton(
        color: Colors.white,
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: homePopupItemValue,
              child: AppBarPopUpItemRow(
                name: homePopupItemName,
                icon: Icons.home,
              ),
            ),
          ];
        },
        onSelected: (valueToNavigate) {
          if (valueToNavigate == homePopupItemValue) {
            Navigator.pushNamed(
              context,
              ConstantsClass.homeRouteName,
            );
          }
        },
        constraints: BoxConstraints(
          maxWidth: boxConstraintsMaxWidth,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        appBar.preferredSize.height,
      );
}
