import 'package:flutter/material.dart';
import 'package:groceryapp/utils/theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: PrimaryFont.medium(24).copyWith(
              color: kColorBlackText,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: PrimaryFont.bold(16).copyWith(
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
