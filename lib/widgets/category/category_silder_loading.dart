import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/category/category_slider.dart';
import 'package:groceryapp/widgets/category/category_slider_card.dart';

class CategorySliderLoading extends StatelessWidget {
  const CategorySliderLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const CategorySlider(),
      ),
    );
  }
}
