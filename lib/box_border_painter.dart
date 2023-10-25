import 'package:flutter/material.dart';
import 'dart:math' as math;

class BoxBorderPainter extends CustomPainter {
  BoxBorderPainter({
    this.space,
    required this.paintColor,
    this.thickness,
    this.borderRadius,
  });
  final Color paintColor;
  final double? borderRadius;
  final double? thickness;
  final double? space;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = paintColor
      ..strokeWidth = thickness ?? 5.0
      ..style = PaintingStyle.stroke;
    double radius = borderRadius ?? 20;
    double sideVal = 0;

    Path path = Path()
      ..moveTo(radius, 0)
      ..close()
      ..moveTo(size.width - radius - sideVal, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius))
      ..moveTo(size.width, radius)
      ..lineTo(size.width, radius + sideVal)
      ..close();

    Path pathBottomRight = Path()
      ..moveTo(size.width, size.height - radius - sideVal)
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      ..moveTo(size.width - radius, size.height)
      ..lineTo(size.width - radius - sideVal, size.height)
      ..close();

    Path pathBottomLeft = Path()
      ..moveTo(radius + sideVal, size.height)
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius))
      ..moveTo(0, size.height - radius)
      ..lineTo(0, size.height - radius - sideVal)
      ..close();

    Path pathTopLeft = Path()
      ..moveTo(0, radius + sideVal)
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
      ..moveTo(radius, 0)
      ..lineTo(radius + sideVal, 0)
      ..close();

    canvas.drawPath(path, paint);
    drawDashedLine(
      canvas,
      Offset(radius, 0),
      Offset(size.width - radius, 0),
    );
    canvas.drawPath(pathBottomRight, paint);
    drawDashedLine(
      canvas,
      Offset(size.width, radius + sideVal),
      Offset(size.width, size.height - radius),
    );
    canvas.drawPath(pathBottomLeft, paint);
    drawDashedLine(
      canvas,
      Offset(size.width - radius, size.height),
      Offset(radius, size.height),
    );
    canvas.drawPath(pathTopLeft, paint);
    drawDashedLine(
      canvas,
      Offset(0, radius + sideVal),
      Offset(0.2, size.height - radius),
    );
  }

  void drawDashedLine(Canvas canvas, Offset start, Offset end) {
    Offset a, b;
    if (start.dy == end.dy) {
      a = start.dx < end.dx ? start : end;
      b = start.dx > end.dx ? start : end;
    } else {
      a = start;
      b = end;
    }
    Path path = getDashedPath(a: a, b: b, gap: space);

    Paint dashLinePaint = Paint();
    dashLinePaint.color = paintColor;
    dashLinePaint.style = PaintingStyle.stroke;
    dashLinePaint.strokeWidth = thickness ?? 5;
    dashLinePaint.strokeCap = StrokeCap.square;

    canvas.drawPath(path, dashLinePaint);
  }

  Path getDashedPath({
    required Offset a,
    required Offset b,
    required gap,
  }) {
    Size size = Size(b.dx - a.dx, b.dy - a.dy);
    Path path = Path();
    path.moveTo(a.dx, a.dy);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.dx, a.dy);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.dx && currentPoint.y <= b.dy) {
      shouldDraw
          ? path.lineTo(currentPoint.x as double, currentPoint.y as double)
          : path.moveTo(currentPoint.x as double, currentPoint.y as double);
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
