import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/utils/constants.dart';

import 'custom.text.widget.dart';

class MoviesPopularWidget extends StatelessWidget {
  MoviesPopularWidget({Key? key}) : super(key: key);

  final controller = Modular.get<MovieController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviePopulars>(
      future: controller.getMoviePopulars(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider(
            items: <Widget>[
              for (var i = 0; i < snapshot.data!.results.length; i++)
                ClipRRect(
                  borderRadius: BorderRadius.circular(width * .05),
                  child: Image.network(
                    Constants.imageRelativePath +
                        (snapshot.data?.results[i].posterPath ?? ''),
                    width: width * .6,
                    fit: BoxFit.fill,
                  ),
                ),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 0.7,
              aspectRatio: 1.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: CustomTextWidget(
              text: 'Erro interno no servidor',
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
