import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/product_slider.dart';

class ProductSliderLoading extends StatelessWidget {
  const ProductSliderLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (ctx, index) => const ProductSlider(),
      ),
    );
  }
}
