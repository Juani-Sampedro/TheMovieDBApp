import 'package:flutter/material.dart';
import '../interfaces/i_repository.dart';
import '/widgets/error_message.dart';
import '/model/movie.dart';
import 'about_us.dart';
import '/repositories/local/movie_repository_class.dart';
import '/widgets/app_bar.dart';
import '/widgets/display_movie_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const double paddingInListView = 15;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final IMyRepository<List<Movie>> movieJsonManagement = MovieJsonManagement();
  late Future<List<Movie>> moviesData;

  final double dividerHeight = 50;
  final double dividerIndent = 20;
  final double endDividerIndent = 20;
  final double dividerThickness = 5;
  final String backgroundWhiteImagePath = "assets/images/white.png";

  @override
  void initState() {
    moviesData = movieJsonManagement.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
      ),
      body: FutureBuilder<List<Movie>>(
        future: moviesData,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AboutUs();
          } else if (snapshot.hasError) {
            return const ErrorMessage();
          } else {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    backgroundWhiteImagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: ListView.separated(
                  padding: const EdgeInsets.all(
                    Home.paddingInListView,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return DisplayMovie(
                      movie: snapshot.data[index],
                    );
                  },
                  separatorBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      Divider(
                    height: dividerHeight,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
