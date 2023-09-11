import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ConstantsClass.appColor,
      onPressed: () {
        Navigator.pop(context);
      },
      heroTag: null,
      child: const Icon(
        color: Colors.white,
        Icons.arrow_back,
      ),
    );
  }
}
