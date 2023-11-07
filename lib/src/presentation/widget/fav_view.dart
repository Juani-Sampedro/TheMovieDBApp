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
    );

    const double textFontSize = 20;

    return DecoratedBox(
      decoration: Constants.backgroundDecoration,
      child: SafeArea(
        child: GridView.builder(
          itemCount: widget.movies.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Center(
                child: Text(
              widget.movies.elementAt(index).id.toString(),
              style: const TextStyle(
                color: AppColors.appNameFontColor,
                fontSize: textFontSize,
              ),
            ));
          },
          gridDelegate: sliverGridDelegate,
        ),
      ),
    );
  }
}
