import 'package:flutter/material.dart';
import 'src/domain/usecase/implementation/movies_usecase_impl.dart';
import 'src/presentation/view/home.dart';
import 'src/config/route/app_routes.dart';
import 'src/core/util/constants.dart';
import 'src/presentation/bloc/movie_list_bloc.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(
          bloc: MoviesBloc(
              useCase: MoviesUseCase(endpoint: Constants.homeEndpoint))),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes(),
    );
  }
}
