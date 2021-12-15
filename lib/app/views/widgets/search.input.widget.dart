import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.search.controller.dart';

class SearchInputWidget extends StatelessWidget {
  SearchInputWidget({Key? key}) : super(key: key);

  final controller = Modular.get<MovieSearchController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * .03),
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      child: TextField(
        controller: controller.inputController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width),
            ),
            suffixIcon: const Icon(Icons.search),
            hintText: 'Pesquise pelo o filme que deseja'),
        onChanged: (value) => controller.searchSpecificMovies(),
      ),
    );
  }
}
