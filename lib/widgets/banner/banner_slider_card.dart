import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class BannerSliderCard extends StatelessWidget {
  final String imageUrl;
  const BannerSliderCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (content, url, downloadProgress) =>
              Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
