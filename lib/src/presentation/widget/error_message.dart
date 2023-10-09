import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class ErrorMessage extends StatelessWidget {
  final String errorText;
  final String defaultText = 'Ups...an error occurred: ';

  final TextStyle errorTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: Constants.homeTextFontFamily,
  );

  const ErrorMessage(this.errorText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            defaultText,
            style: errorTextStyle,
          ),
        ),
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
