import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/bottom.navigation.controller.dart';
import 'package:movies_app/app/modules/home.module.dart';
import 'package:movies_app/app/modules/movies.search.module.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:movies_app/app/views/pages/splash.page.dart';
import 'package:movies_app/app/views/pages/start.page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => Dio(BaseOptions(
            baseUrl: 'https://api.themoviedb.org/3/',
            queryParameters: {'api_key': Constants.apiKey},
          )),
        ),
        Bind((i) => BottomNavigationController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ChildRoute('/start', child: (_, args) => StartPage(), children: [
          ModuleRoute('/home', module: HomeModule()),
          ModuleRoute('/moviesSearch', module: MoviesSearchModule()),
        ]),
      ];
}
