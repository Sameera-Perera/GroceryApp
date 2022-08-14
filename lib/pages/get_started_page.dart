// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/pages/login_page.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

import '../utils/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = context.screenSize;
    return Scaffold(
      body: SafeArea(
          child: ResponsiveBuilder(
        portrait: Stack(
          children: [
            const GetStartedBackground(),
            const Align(
              alignment: Alignment(0.0, 0.75),
              child: FractionallySizedBox(
                heightFactor: 0.4,
                widthFactor: 1,
                child: GetStartedHeader(),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.85),
              child: GetStartedButton(
                fixedSize: MaterialStateProperty.all(
                  Size(
                    _size.width * 0.9,
                    _size.height * 0.07,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  PrimaryFont.medium(_size.height * 0.02),
                ),
              ),
            ),
          ],
        ),
        landscape: Row(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  widthFactor: 1,
                  child: GetStartedHeader(),
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                const GetStartedBackground(),
                Align(
                  alignment: const Alignment(0.0, 0.8),
                  child: GetStartedButton(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        _size.width * 0.4,
                        _size.height * 0.07,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.medium(_size.height * 0.03),
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      )),
    );
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FractionallySizedBox(
        heightFactor: context.orientation == Orientation.portrait ? 0.5 : 0.5,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            'assets/images/bg_get_started.svg',
          ),
        ),
      ),
    );
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/images/logo_icon.svg',
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          flex: 2,
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Welcome \n',
                style: PrimaryFont.bold(44).copyWith(
                  height: 1.3,
                  color: kPrimaryColorText,
                ),
                children: [
                  TextSpan(
                    text: 'to our store',
                    style: PrimaryFont.bold(44).copyWith(
                      height: 1.3,
                      color: kPrimaryColorText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: FittedBox(
            child: Center(
              child: Text(
                'Ger your groceries in as fast as one hour',
                style: PrimaryFont.light(18).copyWith(
                  height: 1.3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    required this.fixedSize,
    required this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$LoginPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(kColorWhite),
        fixedSize: fixedSize,
        textStyle: textStyle,
      ),
      child: const Text('Get Started'),
    );
  }
}
