import 'package:flutter/material.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: kColorLightGray,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: kColorLightGray.withOpacity(0.4),
          highlightColor: kColorWhite,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 120,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: kColorLightGray,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 15,
                    color: kColorLightGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
