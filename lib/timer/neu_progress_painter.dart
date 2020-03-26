import 'package:flutter/material.dart';
import 'dart:math';

class NeuProgressPainter extends CustomPainter {
  //
  Color defaultCircleColor;
  Color percentageCompletedCircleColor;
  double completedPercentage;
  double circleWidth;

  NeuProgressPainter(
      {this.defaultCircleColor,
      this.percentageCompletedCircleColor,
      this.completedPercentage,
      this.circleWidth});

  getPaint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint defaultCirclePaint = getPaint(defaultCircleColor);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    Rect boundingSquare = Rect.fromCircle(center: center, radius: radius);

    paint(
      List<Color> colors,
    ) {
      final Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: colors,
      );

      return Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = circleWidth
        ..shader = gradient.createShader(boundingSquare);
    }

    canvas.drawCircle(center, radius, defaultCirclePaint);

    double arcAngle = 2 * pi * (completedPercentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paint(
        [
          Color.fromRGBO(255, 219, 129, 1),
          Color.fromRGBO(255, 126, 29, 1),
        ],
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }
}
