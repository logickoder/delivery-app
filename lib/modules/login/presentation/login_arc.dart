import 'package:flutter/material.dart';

/// The dark yellow arc that is displayed to the left of the login screen
class LoginArc extends CustomPainter {
  const LoginArc({
    required this.color,
    required this.height,
  });

  final Color color;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(-height / 2, -height * .05, height, height);

    canvas.drawArc(rect, 0, 360, true, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
