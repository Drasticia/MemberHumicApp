import 'package:flutter/material.dart';

class GradientDottedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final List<double> dashPattern;
  final Radius radius;
  final Gradient gradient;

  GradientDottedBorderPainter({
    required this.strokeWidth,
    required this.dashPattern,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radius,
      ));

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      var currentLength = 0.0;
      while (currentLength < metric.length) {
        final dashLength = dashPattern[0];
        final spaceLength = dashPattern[1];
        final end = currentLength + dashLength;

        canvas.drawPath(
          metric.extractPath(currentLength, end),
          paint,
        );
        currentLength = end + spaceLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}