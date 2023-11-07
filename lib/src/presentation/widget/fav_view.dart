import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class CustomFavView extends StatefulWidget {
  final List<dynamic> movies;

  const CustomFavView({
    super.key,
    required this.movies,
  });

  @override
  State<CustomFavView> createState() => _CustomFavViewState();
}

class _CustomFavViewState extends State<CustomFavView> {
  @override
  Widget build(BuildContext context) {
    const SliverGridDelegate sliverGridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
    );

    const double textFontSize = 20;

    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: widget.movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Center(
              child: Text(
                widget.movies.elementAt(index).movieTitle.toString(),
                style: const TextStyle(
                  color: AppColors.appNameFontColor,
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
