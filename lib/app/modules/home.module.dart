import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/movie.controller.dart';
import 'package:movies_app/app/repositories/movie.repository.dart';
import 'package:movies_app/app/views/pages/home.page.dart';
import 'package:movies_app/app/views/pages/specific.movie.page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => MovieController(movieRepository: i.get<MovieRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePage()),
        ChildRoute(
          '/movie/:id',
          child: (_, args) => SpecificMoviePage(),
        ),
      ];
}
