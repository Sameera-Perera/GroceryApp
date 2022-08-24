import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/models/banner_model.dart';
import 'package:groceryapp/widgets/banner/banner_slider_card.dart';

class BannerSliderLoading extends StatefulWidget {
  final List<BannerModel> bannerModelList;
  const BannerSliderLoading({
    Key? key,
    required this.bannerModelList,
  }) : super(key: key);

  @override
  State<BannerSliderLoading> createState() => _BannerSliderLoadingState();
}

class _BannerSliderLoadingState extends State<BannerSliderLoading> {
  int _currentBannerIndex = 0;

  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList = widget.bannerModelList
        .map((e) => BannerSliderCard(imageUrl: e.image))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerList,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerModelList.map((e) {
            int index = widget.bannerModelList.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentBannerIndex == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
