import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/app/controllers/bottom.navigation.controller.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final controller = Modular.get<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          onTap: (value) {
            controller.setCurrentIndex(value);
            if (value == 0) Modular.to.navigate('/start/home');
            if (value == 1) Modular.to.navigate('/start/moviesSearch');
          },
          currentIndex: controller.currentIndex,
          unselectedFontSize: width * .035,
          selectedFontSize: width * .04,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Advanced Search',
              activeIcon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
