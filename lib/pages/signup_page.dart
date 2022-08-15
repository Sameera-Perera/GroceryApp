import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/pages/login_page.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = context.screenSize;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          portrait: Column(
            children: [
              Flexible(
                flex: 2,
                child: Center(
                  child: SvgPicture.asset('assets/images/logo_icon.svg'),
                ),
              ),
              Flexible(
                flex: 8,
                child: _SignupForm(
                  size: _size,
                  fixedSize: MaterialStateProperty.all(
                      Size(_size.width * 0.9, _size.height * 0.07)),
                  textStyle: MaterialStateProperty.all(
                      PrimaryFont.bold(_size.height * 0.025)),
                ),
              ),
              const Padding(padding: EdgeInsets.all(4.0)),
            ],
          ),
          landscape: Row(
            children: [
              Expanded(
                child: Column(children: [
                  Flexible(
                    flex: 7,
                    child: SvgPicture.asset('assets/images/bg_signup.svg'),
                  ),
                  const Spacer(),
                  Flexible(
                      flex: 3,
                      child: _SignupHeader(
                        size: _size,
                      )),
                ]),
              ),
              Expanded(
                child: _SignupForm(
                  size: _size,
                  fixedSize: MaterialStateProperty.all(
                      Size(_size.width * 0.4, _size.height * 0.08)),
                  textStyle: MaterialStateProperty.all(
                      PrimaryFont.bold(_size.height * 0.04)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm({
    Key? key,
    this.fixedSize,
    this.textStyle,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.orientation == Orientation.portrait
          ? const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            )
          : const EdgeInsets.symmetric(
              // vertical: 0.0,
              horizontal: 16.0,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: context.orientation == Orientation.portrait
                ? _SignupHeader(size: _size)
                : const Padding(padding: EdgeInsets.zero),
          ),
          context.orientation == Orientation.portrait
              ? const Padding(padding: EdgeInsets.all(0.0))
              : const Padding(padding: EdgeInsets.all(4.0)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Username',
                hintText: 'Nguyễn Thanh Dũng',
              ),
            ),
          ),
          context.orientation == Orientation.portrait
              ? const Padding(padding: EdgeInsets.all(0.0))
              : const Padding(padding: EdgeInsets.all(4.0)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Email',
                hintText: 'thanhdung12qh@gmail.com',
              ),
            ),
          ),
          context.orientation == Orientation.portrait
              ? const Padding(padding: EdgeInsets.all(0.0))
              : const Padding(padding: EdgeInsets.all(4.0)),
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                // suffixIcon: Icon(),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                // hintText: '',
              ),
            ),
          ),
          context.orientation == Orientation.portrait
              ? const Padding(padding: EdgeInsets.all(0.0))
              : const Padding(padding: EdgeInsets.all(4.0)),
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                // suffixIcon: Icon(),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                // hintText: '',
              ),
            ),
          ),
          Padding(
            padding: context.orientation == Orientation.portrait
                ? const EdgeInsets.all(16.0)
                : const EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: PrimaryFont.light(16)
                          .copyWith(color: kPrimaryColorText),
                      children: [
                    TextSpan(
                      text: 'Terms of Service ',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: PrimaryFont.bold(16).copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                    const TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Privacy Policy ',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: PrimaryFont.bold(16).copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ])),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
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
            child: const Text('Sign Up'),
          ),
          Padding(
            padding: context.orientation == Orientation.portrait
                ? const EdgeInsets.all(16.0)
                : const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: PrimaryFont.light(16)
                          .copyWith(color: kPrimaryColorText),
                      children: [
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('$LoginPage');
                        },
                      style: PrimaryFont.bold(16).copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Sign Up \n',
        style: context.orientation == Orientation.portrait
            ? PrimaryFont.bold(_size.height * 0.03).copyWith(
                color: kPrimaryColorText,
              )
            : PrimaryFont.bold(_size.height * 0.06).copyWith(
                color: kPrimaryColorText,
              ),
        children: [
          TextSpan(
            text: 'Enter your credentials to continue',
            style: context.orientation == Orientation.portrait
                ? PrimaryFont.light(_size.height * 0.02).copyWith(
                    color: kColorLightGray,
                  )
                : PrimaryFont.light(_size.height * 0.04).copyWith(
                    color: kColorLightGray,
                  ),
          )
        ],
      ),
    );
  }
}
