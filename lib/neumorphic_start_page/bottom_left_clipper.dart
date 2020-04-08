import 'package:flutter/material.dart';

/// Neumorphic clipper that is placed the top most on the bottom left
class BottomLeftNeuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(15.8844 * _xScaling, 194.032 * _yScaling);
    path.cubicTo(
      41.7322 * _xScaling,
      187.818 * _yScaling,
      64.4102 * _xScaling,
      168.631 * _yScaling,
      91.895 * _xScaling,
      173.507 * _yScaling,
    );
    path.cubicTo(
      119.396 * _xScaling,
      178.385 * _yScaling,
      142.116 * _xScaling,
      203.325 * _yScaling,
      166.569 * _xScaling,
      220.764 * _yScaling,
    );
    path.cubicTo(
      190.591 * _xScaling,
      237.895 * _yScaling,
      218.969 * _xScaling,
      250.109 * _yScaling,
      235.467 * _xScaling,
      275.895 * _yScaling,
    );
    path.cubicTo(
      251.907 * _xScaling,
      301.59 * _yScaling,
      251.874 * _xScaling,
      333.261 * _yScaling,
      257.411 * _xScaling,
      362.746 * _yScaling,
    );
    path.cubicTo(
      262.655 * _xScaling,
      390.668 * _yScaling,
      268.591 * _xScaling,
      418.289 * _yScaling,
      267.371 * _xScaling,
      445.781 * _yScaling,
    );
    path.cubicTo(
      266.093 * _xScaling,
      474.598 * _yScaling,
      264.341 * _xScaling,
      504.85 * _yScaling,
      250.113 * _xScaling,
      527.259 * _yScaling,
    );
    path.cubicTo(
      235.895 * _xScaling,
      549.652 * _yScaling,
      208.962 * _xScaling,
      556.46 * _yScaling,
      187.856 * _xScaling,
      571.016 * _yScaling,
    );
    path.cubicTo(
      165.513 * _xScaling,
      586.425 * _yScaling,
      149.084 * _xScaling,
      615.374 * _yScaling,
      121.194 * _xScaling,
      616.171 * _yScaling,
    );
    path.cubicTo(
      93.2682 * _xScaling,
      616.968 * _yScaling,
      68.0885 * _xScaling,
      589.718 * _yScaling,
      41.4531 * _xScaling,
      575.197 * _yScaling,
    );
    path.cubicTo(
      17.0259 * _xScaling,
      561.879 * _yScaling,
      -7.81309 * _xScaling,
      551.216 * _yScaling,
      -30.2651 * _xScaling,
      533.596 * _yScaling,
    );
    path.cubicTo(
      -54.5775 * _xScaling,
      514.517 * _yScaling,
      -82.7712 * _xScaling,
      496.531 * _yScaling,
      -95.8271 * _xScaling,
      467.465 * _yScaling,
    );
    path.cubicTo(
      -108.883 * _xScaling,
      438.398 * _yScaling,
      -100.086 * _xScaling,
      406.852 * _yScaling,
      -100.977 * _xScaling,
      376.171 * _yScaling,
    );
    path.cubicTo(
      -101.84 * _xScaling,
      346.477 * _yScaling,
      -107.228 * _xScaling,
      316.252 * _yScaling,
      -101.029 * _xScaling,
      288.404 * _yScaling,
    );
    path.cubicTo(
      -94.5197 * _xScaling,
      259.162 * _yScaling,
      -85.6289 * _xScaling,
      228.319 * _yScaling,
      -64.217 * _xScaling,
      211.036 * _yScaling,
    );
    path.cubicTo(
      -42.8756 * _xScaling,
      193.809 * _yScaling,
      -10.8945 * _xScaling,
      200.469 * _yScaling,
      15.8844 * _xScaling,
      194.032 * _yScaling,
    );
    path.cubicTo(
      15.8844 * _xScaling,
      194.032 * _yScaling,
      15.8844 * _xScaling,
      194.032 * _yScaling,
      15.8844 * _xScaling,
      194.032 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
