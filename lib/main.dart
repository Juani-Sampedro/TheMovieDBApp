import 'package:flutter/material.dart';
import 'src/core/util/constants.dart';
import 'src/core/parameter/app_initializer.dart';
import 'src/config/route/app_routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Initializer _initCore;
  late AppRoutes _routes;

  @override
  void initState() {
    super.initState();
    _routes = AppRoutes();
    _initCore = Initializer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initCore.initialize(),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.hasData) {
          return MaterialApp(
            initialRoute: Constants.homeRouteName,
            routes: _routes.routes(_initCore),
            debugShowCheckedModeBanner: false,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
