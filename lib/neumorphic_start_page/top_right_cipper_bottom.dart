import 'package:flutter/material.dart';

/// Neumorphic clipper that is placed the bottom most on the top right
/// Btm just stands for the bottom most
class TopRightNeuClipperBtm extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(272.31 * _xScaling, -94.0542 * _yScaling);
    path.cubicTo(
      293.384 * _xScaling,
      -98.9195 * _yScaling,
      311.702 * _xScaling,
      -114.658 * _yScaling,
      334.255 * _xScaling,
      -110.242 * _yScaling,
    );
    path.cubicTo(
      356.821 * _xScaling,
      -105.825 * _yScaling,
      375.725 * _xScaling,
      -84.715 * _yScaling,
      395.955 * _xScaling,
      -69.847 * _yScaling,
    );
    path.cubicTo(
      415.827 * _xScaling,
      -55.2416 * _yScaling,
      439.202 * _xScaling,
      -44.688 * _yScaling,
      453.026 * _xScaling,
      -22.9491 * _yScaling,
    );
    path.cubicTo(
      466.801 * _xScaling,
      -1.28773 * _yScaling,
      467.17 * _xScaling,
      25.1582 * _yScaling,
      472.07 * _xScaling,
      49.8486 * _yScaling,
    );
    path.cubicTo(
      476.71 * _xScaling,
      73.2298 * _yScaling,
      481.913 * _xScaling,
      96.368 * _yScaling,
      481.259 * _xScaling,
      119.309 * _yScaling,
    );
    path.cubicTo(
      480.574 * _xScaling,
      143.357 * _yScaling,
      479.519 * _xScaling,
      168.596 * _yScaling,
      468.156 * _xScaling,
      187.13 * _yScaling,
    );
    path.cubicTo(
      456.801 * _xScaling,
      205.651 * _yScaling,
      434.845 * _xScaling,
      210.999 * _yScaling,
      417.756 * _xScaling,
      222.889 * _yScaling,
    );
    path.cubicTo(
      399.664 * _xScaling,
      235.477 * _yScaling,
      386.582 * _xScaling,
      259.445 * _yScaling,
      363.769 * _xScaling,
      259.761 * _yScaling,
    );
    path.cubicTo(
      340.926 * _xScaling,
      260.078 * _yScaling,
      319.98 * _xScaling,
      237.008 * _yScaling,
      298.001 * _xScaling,
      224.549 * _yScaling,
    );
    path.cubicTo(
      277.845 * _xScaling,
      213.123 * _yScaling,
      257.385 * _xScaling,
      203.908 * _yScaling,
      238.791 * _xScaling,
      188.915 * _yScaling,
    );
    path.cubicTo(
      218.657 * _xScaling,
      172.679 * _yScaling,
      195.36 * _xScaling,
      157.307 * _yScaling,
      184.312 * _xScaling,
      132.873 * _yScaling,
    );
    path.cubicTo(
      173.264 * _xScaling,
      108.438 * _yScaling,
      180.069 * _xScaling,
      82.2063 * _yScaling,
      178.956 * _xScaling,
      56.5758 * _yScaling,
    );
    path.cubicTo(
      177.879 * _xScaling,
      31.7698 * _yScaling,
      173.091 * _xScaling,
      6.46339 * _yScaling,
      177.816 * _xScaling,
      -16.7134 * _yScaling,
    );
    path.cubicTo(
      182.777 * _xScaling,
      -41.0492 * _yScaling,
      189.666 * _xScaling,
      -66.6928 * _yScaling,
      206.972 * _xScaling,
      -80.8573 * _yScaling,
    );
    path.cubicTo(
      224.221 * _xScaling,
      -94.9751 * _yScaling,
      250.476 * _xScaling,
      -89.0135 * _yScaling,
      272.31 * _xScaling,
      -94.0542 * _yScaling,
    );
    path.cubicTo(
      272.31 * _xScaling,
      -94.0542 * _yScaling,
      272.31 * _xScaling,
      -94.0542 * _yScaling,
      272.31 * _xScaling,
      -94.0542 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
