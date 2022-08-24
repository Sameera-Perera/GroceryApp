import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/models/category_model.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class CategorySliderCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategorySliderCard({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: CachedNetworkImage(
        imageUrl: categoryModel.image,
        imageBuilder: (context, imageProvider) => Material(
          elevation: 8,
          shadowColor: kColorLightGray,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
              color: kColorLightGray,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                categoryModel.name,
                style: PrimaryFont.bold(18).copyWith(
                  color: kColorWhite,
                ),
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Material(
          elevation: 8,
          shadowColor: kColorLightGray,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                color: kColorLightGray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          elevation: 8,
          shadowColor: kColorLightGray,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
              color: kColorLightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.error_outline,
                color: kColorLightGray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
