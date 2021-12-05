import 'package:mobx/mobx.dart';

part 'bottom.navigation.controller.g.dart';

class BottomNavigationController = _BottomNavigationControllerBase with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int value) => currentIndex = value;
}