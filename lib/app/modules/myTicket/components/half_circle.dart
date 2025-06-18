import 'package:flutter/material.dart';
import 'dart:math' as math;

class HalfCirclePainter extends CustomPainter {
  final Color color;
  final bool isLeft; 

  HalfCirclePainter({required this.color, this.isLeft = true});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect oval = Rect.fromLTWH(
      isLeft ? 0 : -size.width,
      0,
      size.width * 2,
      size.height,
    );

    canvas.drawArc(
      oval,
      isLeft ? -math.pi / 2 : math.pi / 2, 
      math.pi, 
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as HalfCirclePainter).color != color ||
        (oldDelegate).isLeft != isLeft;
  }
}

class HalfCircle extends StatelessWidget {
  final Color color;
  final double radius;
  final double height; 
  final bool isLeft;

  const HalfCircle({
    super.key,
    required this.color,
    required this.radius,
    this.height = 0, 
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: height > 0 ? height : radius, 
      child: CustomPaint(
        painter: HalfCirclePainter(color: color, isLeft: isLeft),
      ),
    );
  }
}