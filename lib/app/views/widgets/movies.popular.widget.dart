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
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder<MoviePopulars>(
      future: controller.getMoviePopulars(),
      builder: (_, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasData) {
          return CarouselSlider(
            items: <Widget>[
              for (var i = 0; i < data!.results.length; i++)
                GestureDetector(
                  onTap: () => Modular.to
                      .pushNamed('/start/home/movie/${data.results[i].id}'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width * .05),
                          child: data.results[i].posterPath != null
                              ? Image.network(
                                  Constants.imageRelativePath +
                                      data.results[i].posterPath!,
                                  width: width * .6,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  'assets/images/default_image_movie.jpeg',
                                  width: width * .6,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      SizedBox(height: height * .01),
                      CustomTextWidget(
                        text: data.results[i].title,
                        fontSize: width * .05,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      CustomTextWidget(
                        text:
                            "Pontuação de popularidade: ${data.results[i].popularity}",
                        fontSize: width * .035,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
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
    );
  }
}
