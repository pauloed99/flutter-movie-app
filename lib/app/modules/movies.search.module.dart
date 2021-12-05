import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/views/pages/movies.search.page.dart';

class MoviesSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const MoviesSearchPage())
  ];
}