import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/util/colors.dart';
import '../../core/util/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    super.key,
    required this.text,
  });

  final String text;
  final int durationOfTextAnimation = 80;
  final double animatedTextFontSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  textAlign: TextAlign.justify,
                  textStyle: TextStyle(
                    fontFamily: Constants.appFontFamily,
                    color: AppColors.appNameFontColor,
                    fontSize: animatedTextFontSize,
                  ),
                  text,
                  speed: Duration(milliseconds: durationOfTextAnimation),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
