import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp/controllers/main_page_controller.dart';
import 'package:groceryapp/pages/category_page.dart';
import 'package:groceryapp/pages/history_order_page.dart';
import 'package:groceryapp/pages/home/home_page.dart';
import 'package:groceryapp/pages/profile_account_page.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const CategoryPage(),
    const HistoryOrderPage(),
    const ProfileAccountPage(),
  ];
  // int currentIndex = 0;
  // void _onTapBottomBar(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: ResponsiveBuilder(
            portrait: pages[controller.currentIndex],
            landscape: Row(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kColorGrayBg,
          onTap: (val) {
            controller.updateIndex(val);
          },
          currentIndex: controller.currentIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kColorLightGray,
          showUnselectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Category', icon: Icon(Icons.category)),
            BottomNavigationBarItem(label: 'Order', icon: Icon(Icons.payment)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
