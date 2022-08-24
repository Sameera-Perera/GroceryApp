import 'package:get/get.dart';

class MainPageController extends GetxController {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }
}
