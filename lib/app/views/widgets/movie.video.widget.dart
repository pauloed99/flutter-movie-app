import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/models/movie.videos.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom.text.widget.dart';

class MovieVideoWidget extends StatelessWidget {
  final String id;
  final String? movieImageUrl;
  final String title;

  MovieVideoWidget({
    Key? key,
    required this.id,
    this.movieImageUrl,
    required this.title,
  }) : super(key: key);

  final controller = Modular.get<MovieController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder<MovieVideos>(
      future: controller.getMovieVideos(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return movieImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * .07),
                    bottomRight: Radius.circular(width * .07),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        Constants.imageRelativePath + movieImageUrl!,
                        height: height * .4,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final youtubeUrl =
                              'https://www.youtube.com/embed/${data!.results[0].key}';
                          if (await canLaunch(youtubeUrl)) {
                            await launch(youtubeUrl);
                          }
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.yellow,
                          size: width * .16,
                        ),
                      ),
                      Positioned(
                        top: height * .25,
                        child: CustomTextWidget(
                          text: title,
                          fontSize: width * .055,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                )
              : Image.asset(
                  'assets/images/default_movie_image.jpeg',
                  height: height * .4,
                  fit: BoxFit.cover,
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
