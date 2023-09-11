import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class ErrorMessage extends StatelessWidget {
  final String errorText = 'Ups...an error occurred';

  final TextStyle errorTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: ConstantsClass.homeTextFontFamily,
  );

  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            errorText,
            style: errorTextStyle,
          ),
        ),
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ],
    );
  }
}