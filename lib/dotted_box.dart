library dotted_box;

import 'package:dotted_box/box_border_painter.dart';
import 'package:dotted_box/circle_border_painter.dart';
import 'package:flutter/material.dart';

enum Shape { circle, rectangle }

class DottedBox extends StatelessWidget {
  const DottedBox({
    super.key,
    required this.height,
    required this.width,
    this.borderColor,
    this.borderThickness,
    this.child,
    this.space,
    this.borderRadius,
    required this.borderShape,
    this.dashCounts,
  });

  /// This is the height of the widget
  final double height;

  /// This is the width of the widget
  final double width;

  /// This is the space between the dashes
  final int? space;

  /// This is the border color of the widget
  final Color? borderColor;

  /// This is the height of the widget
  final double? borderThickness;

  /// This is the height of the widget
  final double? borderRadius;

  /// This is the height of the widget
  final Widget? child;

  /// This is the height of the widget
  final Shape? borderShape;

  /// This is the height of the widget
  final int? dashCounts;

  @override
  Widget build(BuildContext context) {
    if (borderShape == Shape.circle) {
      return circle(height, child, borderColor, space);
    } else {
      return rectangle();
    }
  }

  Widget rectangle() {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: BoxBorderPainter(
            space: space != null
                ? double.parse(space.toString()) + 10.0
                : height / 15,
            paintColor: borderColor ?? Colors.grey,
            borderRadius: borderRadius ?? 20,
            thickness: borderThickness ?? 6),
      ),
    );
  }

  Widget circle(size, child, color, space) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child ?? Container(),
          CustomPaint(
            size: Size(size, size),
            foregroundPainter: CircleBorderPainter(
              borderColor: color,
              dashCounts: dashCounts ?? 14,
              strokeVal: borderThickness ?? 6,
              spaceLength: space ?? 4,
            ),
          ),
        ],
      ),
    );
  }
}
