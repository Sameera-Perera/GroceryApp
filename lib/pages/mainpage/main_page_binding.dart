import 'package:get/get.dart';
import 'package:groceryapp/controllers/home_controller.dart';
import 'package:groceryapp/controllers/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainPageController());
    Get.put(HomeController());
  }
}
