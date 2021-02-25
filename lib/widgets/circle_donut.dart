import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class CircleDonut extends StatelessWidget {
  final double thickness;
  final List<Color> colors;
  final double startAngle;

  CircleDonut({
    Key key,
    @required this.colors,
    this.thickness = 20.0,
    this.startAngle = -pi / 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawCircle(
        startAngle: startAngle,
        colors: colors,
        thickness: thickness,
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  final double thickness;
  final List<Color> colors;
  final double startAngle;

  DrawCircle({
    @required this.colors,
    this.thickness = 20.0,
    this.startAngle = -pi / 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final diff = 2 * pi / colors.length;
    final radius = (min(size.width, size.height) / 2) - (thickness / 2);

    colors.forEachIndexed((index, element) {
      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(
            size.width / 2,
            size.height / 2,
          ),
          radius: radius,
        ),
        startAngle + (index * diff),
        diff,
        false,
        Paint()
          ..color = element
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke,
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
