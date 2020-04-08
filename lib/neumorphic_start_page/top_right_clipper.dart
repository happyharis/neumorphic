import 'package:flutter/material.dart';

/// Neumorphic clipper that is placed the top most on the top right
class TopRightNeuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(304.51 * _xScaling, -174.308 * _yScaling);
    path.cubicTo(
      329.223 * _xScaling,
      -181.119 * _yScaling,
      351.649 * _xScaling,
      -199.055 * _yScaling,
      377.304 * _xScaling,
      -196.299 * _yScaling,
    );
    path.cubicTo(
      402.975 * _xScaling,
      -193.542 * _yScaling,
      423.049 * _xScaling,
      -173.058 * _yScaling,
      445.164 * _xScaling,
      -159.199 * _yScaling,
    );
    path.cubicTo(
      466.889 * _xScaling,
      -145.585 * _yScaling,
      492.989 * _xScaling,
      -136.488 * _yScaling,
      507.15 * _xScaling,
      -114.93 * _yScaling,
    );
    path.cubicTo(
      521.261 * _xScaling,
      -93.4484 * _yScaling,
      519.513 * _xScaling,
      -65.87 * _yScaling,
      523.137 * _xScaling,
      -40.4969 * _yScaling,
    );
    path.cubicTo(
      526.568 * _xScaling,
      -16.469 * _yScaling,
      530.669 * _xScaling,
      7.25881 * _yScaling,
      528.028 * _xScaling,
      31.2624 * _yScaling,
    );
    path.cubicTo(
      525.261 * _xScaling,
      56.4238 * _yScaling,
      521.969 * _xScaling,
      82.8593 * _yScaling,
      507.337 * _xScaling,
      103.142 * _yScaling,
    );
    path.cubicTo(
      492.715 * _xScaling,
      123.411 * _yScaling,
      466.947 * _xScaling,
      130.798 * _yScaling,
      446.254 * _xScaling,
      144.616 * _yScaling,
    );
    path.cubicTo(
      424.348 * _xScaling,
      159.245 * _yScaling,
      407.286 * _xScaling,
      185.341 * _yScaling,
      380.941 * _xScaling,
      187.547 * _yScaling,
    );
    path.cubicTo(
      354.563 * _xScaling,
      189.755 * _yScaling,
      332.294 * _xScaling,
      167.393 * _yScaling,
      307.963 * _xScaling,
      156.192 * _yScaling,
    );
    path.cubicTo(
      285.649 * _xScaling,
      145.921 * _yScaling,
      262.802 * _xScaling,
      137.982 * _yScaling,
      242.584 * _xScaling,
      123.857 * _yScaling,
    );
    path.cubicTo(
      220.69 * _xScaling,
      108.562 * _yScaling,
      195.077 * _xScaling,
      94.4301 * _yScaling,
      184.341 * _xScaling,
      69.8294 * _yScaling,
    );
    path.cubicTo(
      173.603 * _xScaling,
      45.2279 * _yScaling,
      183.61 * _xScaling,
      17.2839 * _yScaling,
      184.432 * _xScaling,
      -9.38204 * _yScaling,
    );
    path.cubicTo(
      185.228 * _xScaling,
      -35.1901 * _yScaling,
      181.785 * _xScaling,
      -61.2157 * _yScaling,
      189.141 * _xScaling,
      -85.7998 * _yScaling,
    );
    path.cubicTo(
      196.864 * _xScaling,
      -111.613 * _yScaling,
      206.92 * _xScaling,
      -138.951 * _yScaling,
      228.049 * _xScaling,
      -155.16 * _yScaling,
    );
    path.cubicTo(
      249.109 * _xScaling,
      -171.317 * _yScaling,
      278.908 * _xScaling,
      -167.251 * _yScaling,
      304.51 * _xScaling,
      -174.308 * _yScaling,
    );
    path.cubicTo(
      304.51 * _xScaling,
      -174.308 * _yScaling,
      304.51 * _xScaling,
      -174.308 * _yScaling,
      304.51 * _xScaling,
      -174.308 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
