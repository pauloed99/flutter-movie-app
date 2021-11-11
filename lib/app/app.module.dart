import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/modules/home.module.dart';
import 'package:movies_app/app/views/pages/splash.page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}