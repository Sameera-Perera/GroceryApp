import 'package:flutter/material.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: kColorLightGray,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: kColorLightGray,
          highlightColor: kColorWhite,
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
                color: kColorLightGray,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
