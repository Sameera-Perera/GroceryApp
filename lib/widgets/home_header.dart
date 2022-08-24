import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/utils/theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: kColorWhite,
        boxShadow: [
          BoxShadow(
            color: kColorLightGray.withOpacity(0.3),
            // offset: Offset(0, 0),
            blurRadius: 100,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: false,
              onSubmitted: (_) {},
              onChanged: (_) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                fillColor: kColorWhite,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: 'Type something ...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kColorWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kColorLightGray.withOpacity(0.3),
                  // offset: Offset(0, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: kColorLightGray,
            ),
          ),
          const SizedBox(width: 10),
          Badge(
            badgeContent: const Text('99'),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kColorWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kColorLightGray.withOpacity(0.3),
                    // offset: Offset(0, 0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: kColorLightGray,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
