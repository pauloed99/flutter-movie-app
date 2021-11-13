import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/modules/home.module.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:movies_app/app/views/pages/splash.page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => Dio(BaseOptions(
            baseUrl: 'https://api.themoviedb.org/3/',
            queryParameters: {'api_key': Constants.apiKey},
          )),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
