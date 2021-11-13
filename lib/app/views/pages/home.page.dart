import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';

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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 20),
            child: CustomTextWidget(
              text: 'Filmes mais populares',
              fontSize: width * .06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: width,
            height: height * .4,
            child: FutureBuilder<MoviePopulars>(
              future: controller.getMoviePopulars(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Image.network(
                      Constants.imageRelativePath +
                          (snapshot.data!.results![index].posterPath ?? ''),
                      height: height * .2,
                      width: width * .4,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: CustomTextWidget(
                      text: 'erro interno no servidor',
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
