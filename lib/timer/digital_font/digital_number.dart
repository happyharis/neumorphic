import 'package:flutter/material.dart';

class DigitalNumber extends StatelessWidget {
  final int value;
  final int padLeft;
  final double height;
  final Color color;

  DigitalNumber({
    Key key,
    @required this.value,
    @required this.height,
    @required this.color,
    this.padLeft = 0,
  })  : assert(value != null),
        assert(height != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget digitPainter(int digit) {
      return new CustomPaint(
        size: new Size(height / 2.0, height),
        painter: new _DigitalDigitPainter(digit, height, color),
      );
    }

    final Widget digitPadding = new SizedBox(width: height / 10.0);

    List<Widget> children = [];

    int digits = 0;
    int remaining = value;
    // do-while required for when [value] is 0
    do {
      int digit = remaining.remainder(10);
      // If this is not our first entry, add padding
      if (remaining != value) {
        children.add(digitPadding);
      }
      children.add(digitPainter(digit));
      remaining ~/= 10;
      digits++;
    } while (remaining > 0);

    // If need to pad this number with zeros
    while (digits < padLeft) {
      children.add(digitPadding);
      children.add(digitPainter(0));
      digits++;
    }

    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: new List.from(children.reversed),
    );
  }
}

class _DigitalDigitPainter extends CustomPainter {
  final int value;
  final double height;
  final Color color;

  _DigitalDigitPainter(this.value, this.height, this.color)
      : assert(value >= 0),
        assert(value < 10);

  @override
  bool shouldRepaint(_DigitalDigitPainter oldDelegate) {
    return value != oldDelegate.value ||
        height != oldDelegate.height ||
        color != oldDelegate.color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double width = height / 2; // Digits are half as wide as they are tall
    final double thickness = width / 5; // Arbitrary thickness that looks good

    final double bigGap = thickness * 2 / 3; // Inside angle for outer pixels
    final double midGap = thickness / 2; // Angle for middle bar
    final double smallGap = thickness / 3; // Outside angle for outer pixels

    final double smallPad = thickness / 10; // Spacing for middle bar
    final double bigPad = smallGap + smallPad; // Spacing for outer pixels

    // Alias/pre-calculate convenient locations
    final double top = size.height - height;
    final double left = size.width - width;
    final double right = size.width;
    final double bottom = size.height;
    final double middle = size.height - width;

    final Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    /// Build a polygon for the left side of the digit
    List<Offset> leftPolygon(top, bottom) {
      return [
        new Offset(left + smallGap, top),
        new Offset(left, top + smallGap),
        new Offset(left, bottom - smallGap),
        new Offset(left + smallGap, bottom),
        new Offset(left + thickness, bottom - bigGap),
        new Offset(left + thickness, top + bigGap),
      ];
    }

    /// Build a polygon for the right side of the digit
    List<Offset> rightPolygon(top, bottom) {
      return [
        new Offset(right - smallGap, top),
        new Offset(right - thickness, top + bigGap),
        new Offset(right - thickness, bottom - bigGap),
        new Offset(right - smallGap, bottom),
        new Offset(right, bottom - smallGap),
        new Offset(right, top + smallGap),
        new Offset(right - smallGap, top),
      ];
    }

    Path p = new Path();
    // Top
    if (value != 1 && value != 4) {
      final tleft = left + bigPad;
      final tright = right - bigPad;
      p.addPolygon([
        new Offset(tleft, top + smallGap),
        new Offset(tleft + smallGap, top),
        new Offset(tright - smallGap, top),
        new Offset(tright, top + smallGap),
        new Offset(tright - bigGap, top + thickness),
        new Offset(tleft + bigGap, top + thickness),
      ], true);
    }
    // Left Top
    if (value == 0 || (value > 3 && value != 7)) {
      p.addPolygon(leftPolygon(top + bigPad, middle - smallPad), true);
    }
    // Right Top
    if (value != 5 && value != 6) {
      p.addPolygon(rightPolygon(top + bigPad, middle - smallPad), true);
    }
    // Middle
    if (value > 1 && value != 7) {
      final mleft = left + bigPad;
      final mright = right - bigPad;
      final halfThick = thickness / 2;
      p.addPolygon([
        new Offset(mleft, middle),
        new Offset(mleft + midGap, middle - halfThick),
        new Offset(mright - midGap, middle - halfThick),
        new Offset(mright, middle),
        new Offset(mright - midGap, middle + halfThick),
        new Offset(mleft + midGap, middle + halfThick),
        new Offset(mleft, middle),
      ], false);
    }
    // Left Bottom
    if (value == 0 || value == 2 || value == 6 || value == 8) {
      p.addPolygon(leftPolygon(middle + smallPad, bottom - bigPad), true);
    }
    // Right bottom
    if (value != 2) {
      p.addPolygon(rightPolygon(middle + smallPad, bottom - bigPad), true);
    }
    // Bottom
    if (value != 1 && value != 4 && value != 7) {
      final bleft = left + bigPad;
      final bright = right - bigPad;
      p.addPolygon([
        new Offset(bleft, bottom - smallGap),
        new Offset(bleft + bigGap, bottom - thickness),
        new Offset(bright - bigGap, bottom - thickness),
        new Offset(bright, bottom - smallGap),
        new Offset(bright - smallGap, bottom),
        new Offset(bleft + smallGap, bottom),
        new Offset(bleft, bottom - smallGap),
      ], false);
    }

    canvas.drawPath(p, paint);
  }
}
