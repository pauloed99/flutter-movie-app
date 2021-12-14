import 'package:flutter/material.dart';
import 'package:movies_app/app/models/movie.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';
import 'package:movies_app/app/views/widgets/movie.images.widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Resumo',
          fontSize: width * .05,
          fontWeight: FontWeight.bold,
        ),
        Container(
          margin: EdgeInsets.only(
            right: width * .03,
            top: height * .01,
            bottom: height * .02,
          ),
          child: CustomTextWidget(
            text: movie.overview ?? '',
            fontSize: width * .045,
            textAlign: TextAlign.justify,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Data de Lançamento',
                    fontSize: width * .05,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: height * .005),
                  CustomTextWidget(
                    text: movie.releaseDate,
                    fontSize: width * .045,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Tempo de Duração',
                    fontSize: width * .05,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: height * .005),
                  CustomTextWidget(
                    text: '${movie.runtime.toString()} min',
                    fontSize: width * .045,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Idioma de Origem',
                    fontSize: width * .05,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: height * .005),
                  CustomTextWidget(
                    text: movie.originalLanguage,
                    fontSize: width * .045,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            top: height * .04,
            bottom: height * .005,
          ),
          child: CustomTextWidget(
            text: 'Fotos do Filme',
            fontSize: width * .05,
            fontWeight: FontWeight.bold,
          ),
        ),
        MovieImagesWidget(id: movie.id.toString()),
      ],
    );
  }
}
