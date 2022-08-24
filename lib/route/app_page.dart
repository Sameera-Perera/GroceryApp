import 'package:get/get.dart';
import 'package:groceryapp/pages/mainpage/main_page.dart';
import 'package:groceryapp/pages/mainpage/main_page_binding.dart';
import 'package:groceryapp/route/app_route.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const MainPage(),
      binding: MainPageBinding(),
    )
  ];
}
