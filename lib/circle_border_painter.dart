import 'dart:math';
import 'package:flutter/material.dart';

class CircleBorderPainter extends CustomPainter {
  final int dashCounts;
  final int spaceLength;
  double startOfArcInDegree = 0;
  final double strokeVal;
  final Color borderColor;

  CircleBorderPainter({
    required this.borderColor,
    required this.dashCounts,
    this.spaceLength = 10,
    required this.strokeVal,
  });
  double inRads(double degree) {
    return (degree * pi) / 180;
  }

  @override
  bool shouldRepaint(CircleBorderPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double arcLength = (360 - (dashCounts * spaceLength)) / dashCounts;

    if (arcLength <= 0) {
      arcLength = 360 / spaceLength - 1;
    }

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (int i = 0; i < dashCounts; i++) {
      canvas.drawArc(
          rect,
          inRads(startOfArcInDegree),
          inRads(arcLength),
          false,
          Paint()
            // ..color = i == 0 || i == 1 ? Colors.grey : Colors.teal
            ..color = borderColor
            ..strokeWidth = strokeVal
            ..style = PaintingStyle.stroke);

      startOfArcInDegree += arcLength + spaceLength;
    }
  }
}
