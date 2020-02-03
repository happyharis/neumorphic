import 'dart:math';

import 'package:flutter/material.dart';

class ProgressRings extends CustomPainter {
  /// From 0.0 to 1.0
  final double completedPercentage;
  final double circleWidth;
  final List<Color> gradient;
  final num gradientStartAngle;
  final num gradientEndAngle;
  final double progressStartAngle;
  final double lengthToRemove;

  ProgressRings({
    this.completedPercentage,
    this.circleWidth,
    this.gradient,
    this.gradientStartAngle = 3 * pi / 2,
    this.gradientEndAngle = 4 * pi / 2,
    this.progressStartAngle = 0,
    this.lengthToRemove = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    double arcAngle = 2 * pi * (completedPercentage);

    Rect boundingSquare = Rect.fromCircle(center: center, radius: radius);

    paint(List<Color> colors,
        {double startAngle = 0.0, double endAngle = pi * 2}) {
      final Gradient gradient = SweepGradient(
        startAngle: startAngle,
        endAngle: endAngle,
        colors: colors,
      );

      return Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = circleWidth
        ..shader = gradient.createShader(boundingSquare);
    }

    canvas.drawArc(
      boundingSquare,
      -pi / 2 + progressStartAngle,
      arcAngle - lengthToRemove,
      false,
      paint(
        gradient,
        startAngle: gradientStartAngle,
        endAngle: gradientEndAngle,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter painter) => true;
}
