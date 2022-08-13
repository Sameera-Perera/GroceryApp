import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FractionallySizedBox(
        heightFactor: 1,
        child: SvgPicture.asset('bg_get_started.svg'),
      ),
    ));
  }
}
