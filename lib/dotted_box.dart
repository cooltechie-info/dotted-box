library dotted_box;

import 'package:flutter/material.dart';

class DottedBox extends StatelessWidget {
  const DottedBox(
      {super.key,
      required this.height,
      required this.width,
      this.backgroundColor,
      this.borderColor,
      this.borderThickness,
      this.child});

  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderThickness;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: borderColor ??
                    Colors.grey.withOpacity(
                      0.3,
                    ),
                width: borderThickness ?? 3),
          ),
        ),
        Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Divider(
                color: Colors.white,
                thickness: 6,
              );
            },
          ),
        ),
        Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const VerticalDivider(
                color: Colors.white,
                thickness: 6,
              );
            },
          ),
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
