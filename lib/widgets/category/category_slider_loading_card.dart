import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/models/category_model.dart';
import 'package:groceryapp/widgets/category/category_slider_card.dart';

class CategorySliderLoadingCard extends StatelessWidget {
  final List<CategoryModel> categoryModelList;
  const CategorySliderLoadingCard({
    Key? key,
    required this.categoryModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   height: 140,
    //   padding: const EdgeInsets.only(right: 10),
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     // primary: false,
    //     scrollDirection: Axis.horizontal,
    //     physics: BouncingScrollPhysics(),
    //     itemCount: categoryModelList.length,
    //     itemBuilder: (context, index) => SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: CategorySliderCard(
    //         categoryModel: categoryModelList[index],
    //       ),
    //     ),
    //   ),
    // );

    // return List

    return CarouselSlider.builder(
      itemCount: categoryModelList.length,
      itemBuilder: (context, index, realIndex) =>
          CategorySliderCard(categoryModel: categoryModelList[index]),
      options: CarouselOptions(
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        pageSnapping: false,
        // disableCenter: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        // initialPage: 0,
        height: 140,
        autoPlay: false,
        viewportFraction: 0.6,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
