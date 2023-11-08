import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class CustomFavGridView extends StatefulWidget {
  final List<dynamic> movies;

  const CustomFavGridView({
    super.key,
    required this.movies,
  });

  @override
  State<CustomFavGridView> createState() => _CustomFavGridViewState();
}

class _CustomFavGridViewState extends State<CustomFavGridView> {
  @override
  Widget build(BuildContext context) {
    const SliverGridDelegate sliverGridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
    );

    const double textFontSize = 30;
    const double padding = 20;

    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          itemCount: widget.movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Center(
              child: Text(
                widget.movies.elementAt(index).movieTitle.toString(),
                style: const TextStyle(
                  fontFamily: Constants.appFontFamily,
                  color: AppColors.iconInTextUnderAppBarColor,
                  fontSize: textFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          gridDelegate: sliverGridDelegate,
        ),
      ),
    );
  }
}
