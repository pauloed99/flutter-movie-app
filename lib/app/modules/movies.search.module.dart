import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.search.controller.dart';
import 'package:movies_app/app/repositories/movie.repository.dart';
import 'package:movies_app/app/views/pages/movies.search.page.dart';

class MoviesSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => MovieSearchController(i.get<MovieRepository>())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => MoviesSearchPage())
  ];
}