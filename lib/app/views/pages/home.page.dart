import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';
import 'package:movies_app/app/views/widgets/movies.popular.widget.dart';
import 'package:movies_app/app/views/widgets/movies.top.rated.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<MovieController>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Home',
          fontSize: width * .055,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: width * .03,
                top: height * .02,
              ),
              child: CustomTextWidget(
                text: 'Filmes mais populares',
                fontSize: width * .06,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * .02),
              width: width,
              height: height * .3,
              child: MoviesPopularWidget(),
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * .03,
                top: height * .05,
              ),
              child: CustomTextWidget(
                text: 'Filmes mais bem avaliados',
                fontSize: width * .06,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: width,
              height: height * .3,
              margin: const EdgeInsets.only(top: 15),
              child: MoviesTopRatedWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
