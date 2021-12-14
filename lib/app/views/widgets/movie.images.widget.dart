import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/models/movie.images.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';

class MovieImagesWidget extends StatelessWidget {
  final String id;

  MovieImagesWidget({Key? key, required this.id}) : super(key: key);

  final controller = Modular.get<MovieController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder<MovieImages>(
      future: controller.getMovieImages(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return SizedBox(
            width: width,
            height: height * .25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data!.backdrops.length,
              itemBuilder: (context, index) => Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * .07),
                    ),
                    child: Image.network(
                      Constants.imageRelativePath +
                          data.backdrops[index].filePath,
                    ),
                  ),
                  SizedBox(width: width * .02),
                ],
              ),
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
