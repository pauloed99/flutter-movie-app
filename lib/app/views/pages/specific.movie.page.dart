import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/models/movie.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';
import 'package:movies_app/app/views/widgets/movie.details.widget.dart';
import 'package:movies_app/app/views/widgets/movie.video.widget.dart';

class SpecificMoviePage extends StatelessWidget {
  SpecificMoviePage({Key? key}) : super(key: key);

  final String id = Modular.args.params['id'];

  final controller = Modular.get<MovieController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<Movie>(
        future: controller.getSpecificMovie(id),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieVideoWidget(
                  id: id,
                  movieImageUrl: data!.backdropPath,
                  title: data.title,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: height * .04,
                        left: width * .05,
                        bottom: height * .04,
                      ),
                      child: MovieDetailsWidget(movie: data),
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: CustomTextWidget(
                text: snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
