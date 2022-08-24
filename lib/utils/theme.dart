import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF53B175);
const kPrimaryColorText = Color(0xFF030303);
const kColorWhite = Color(0xFFFFFFFF);
const kColorLightGray = Color(0xFF7C7C7C);
const kColorGrayBg = Color(0xFFF5F5F5);
const kColorBlackText = Color(0xFF000000);

class PrimaryFont {
  static String fontFamily = 'Lato';

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w100,
      fontSize: size,
    );
  }

  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
    );
  }

  static TextStyle bold(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }

  static TextStyle black(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      fontSize: size,
    );
  }
}

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
