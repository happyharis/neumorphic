import 'package:flutter/material.dart';

class NeumorphicTheme {
  NeumorphicTheme({
    this.outerShadow,
    this.innerShadowColors,
    this.borderColor,
    this.buttonColor,
    this.isDark = false,
  });

  final List<BoxShadow> outerShadow;
  final List<Color> innerShadowColors;
  final Color borderColor;
  final Color buttonColor;
  final bool isDark;
}

final darkNeumorphicTheme = NeumorphicTheme(
  innerShadowColors: [
    kDarkBackgroundShadowColour,
    kOutline,
  ],
  borderColor: kOutline,
  buttonColor: kDarkBackgroundColour,
  outerShadow: kDarkBackgroundShadow,
  isDark: true,
);
final lightNeumorphicTheme = NeumorphicTheme(
  innerShadowColors: [kDarkShadow, Colors.white],
  borderColor: Colors.transparent,
  buttonColor: kBackgroundColour,
  outerShadow: kShadow,
);

final kBackgroundColour = Color.fromRGBO(239, 238, 238, 1);
final kOrange = Color.fromRGBO(238, 134, 48, 1); // rgb(238, 134, 48)
final kDarkShadow = Color.fromRGBO(216, 213, 208, 1); // rgb(216, 213, 208)
final kDarkBackgroundColour = Color.fromRGBO(38, 38, 38, 1); // rgb(38,38,38)
final kDarkBackgroundShadowColour = Color.fromRGBO(
  30,
  30,
  30,
  1,
); // rgb(30,30,30)
final kOutline = Color.fromRGBO(46, 46, 46, 1); // rgb(46,46,46)

final kShadow = [
  BoxShadow(
    blurRadius: 15,
    offset: -Offset(5, 5),
    color: Colors.white,
  ),
  BoxShadow(
    blurRadius: 15,
    offset: Offset(4.5, 4.5),
    color: kDarkShadow,
  )
];

final kDarkBackgroundShadow = [
  BoxShadow(
    blurRadius: 15,
    offset: Offset(4.5, 4.5),
    color: kDarkBackgroundShadowColour,
  )
];
