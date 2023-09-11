import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  final String textAboutUs =
      'This App was created by \n Juan Ignacio Sampedro. \n Globant Internship. \n 2023.';
  final int durationOfTextAnimation = 80;
  final double animatedTextFontSize = 40;
  final Color scaffoldBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  textAlign: TextAlign.justify,
                  textStyle: TextStyle(
                    fontFamily: ConstantsClass.appFontFamily,
                    color: Colors.black,
                    fontSize: animatedTextFontSize,
                  ),
                  textAboutUs,
                  speed: Duration(
                    milliseconds: durationOfTextAnimation,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
