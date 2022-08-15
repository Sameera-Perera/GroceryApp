import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/pages/signup_page.dart';
import 'package:groceryapp/utils/theme.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                flex: 5,
                child: _LoginForm(
                  size: _size,
                  fixedSize: MaterialStateProperty.all(
                      Size(_size.width * 0.9, _size.height * 0.07)),
                  textStyle: MaterialStateProperty.all(
                      PrimaryFont.bold(_size.height * 0.025)),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          landscape: Row(
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset('assets/images/bg_login.svg'),
                ),
              ),
              Expanded(
                child: _LoginForm(
                  size: _size,
                  fixedSize: MaterialStateProperty.all(
                      Size(_size.width * 0.4, _size.height * 0.12)),
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

class _LoginForm extends StatelessWidget {
  const _LoginForm({
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
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Login \n',
                style: context.orientation == Orientation.portrait
                    ? PrimaryFont.bold(_size.height * 0.03).copyWith(
                        color: kPrimaryColorText,
                      )
                    : PrimaryFont.bold(_size.height * 0.06).copyWith(
                        color: kPrimaryColorText,
                      ),
                children: [
                  TextSpan(
                    text: 'Enter your emails and password',
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
            ),
          ),
          context.orientation == Orientation.portrait
              ? const Padding(padding: EdgeInsets.all(0.0))
              : const Padding(padding: EdgeInsets.all(8.0)),
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
              : const Padding(padding: EdgeInsets.all(8.0)),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: PrimaryFont.bold(16).copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ),
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
            child: const Text('Log in'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: PrimaryFont.light(16)
                          .copyWith(color: kPrimaryColorText),
                      children: [
                    TextSpan(
                      text: 'Signup',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('$SignupPage');
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
