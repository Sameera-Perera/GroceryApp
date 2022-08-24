import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp/controllers/controllers.dart';
import 'package:groceryapp/utils/section_title.dart';
import 'package:groceryapp/widgets/banner/banner_slider.dart';
import 'package:groceryapp/widgets/banner/banner_slider_loading.dart';
import 'package:groceryapp/widgets/category/category_silder_loading.dart';
import 'package:groceryapp/widgets/category/category_slider_loading_card.dart';
import 'package:groceryapp/widgets/home_header.dart';
import 'package:groceryapp/widgets/product_slider_loading.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          portrait: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        if (homeController.bannerList.isNotEmpty) {
                          return BannerSliderLoading(
                              bannerModelList: homeController.bannerList);
                        } else {
                          return const BannerSlider();
                        }
                      }),
                      // BannerSlider(),
                      const SectionTitle(title: 'Exclusive Offer'),
                      ProductSliderLoading(),
                      const SectionTitle(title: 'Best Selling'),
                      ProductSliderLoading(),
                      const SectionTitle(title: 'Groceries'),

                      Obx(() {
                        if (homeController.categoryList.isNotEmpty) {
                          return CategorySliderLoadingCard(
                              categoryModelList: homeController.categoryList);
                        } else {
                          return const CategorySliderLoading();
                        }
                      }),
                      ProductSliderLoading(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          landscape: Row(),
        ),
      ),
    );
  }
}
