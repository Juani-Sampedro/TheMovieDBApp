import 'package:flutter/material.dart';
import 'src/core/util/constants.dart';
import 'src/presentation/view/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        ConstantsClass.homeRouteName: (context) => const Home(),
      },
    );
  }
}
