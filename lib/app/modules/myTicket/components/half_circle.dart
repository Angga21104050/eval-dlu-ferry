import 'package:flutter/material.dart';
import 'dart:math' as math;

class HalfCirclePainter extends CustomPainter {
  final Color color;
  final bool isLeft; // Jika true, setengah lingkaran menghadap kanan; jika false, menghadap kiri

  HalfCirclePainter({required this.color, this.isLeft = true});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect oval = Rect.fromLTWH(
      isLeft ? 0 : -size.width, // Sesuaikan posisi X berdasarkan arah
      0,
      size.width * 2,
      size.height,
    );

    canvas.drawArc(
      oval,
      isLeft ? -math.pi / 2 : math.pi / 2, // Sudut mulai (atas tengah)
      math.pi, // Sweep angle (180 derajat)
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

// Widget pembungkus untuk memudahkan penggunaan
class HalfCircle extends StatelessWidget {
  final Color color;
  final double radius;
  final double height; // Tambahkan properti height
  final bool isLeft;

  const HalfCircle({
    super.key,
    required this.color,
    required this.radius,
    this.height = 0, // Tambahkan nilai default untuk height (bisa disesuaikan)
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: height > 0 ? height : radius, // Gunakan height jika diberikan, jika tidak gunakan radius
      child: CustomPaint(
        painter: HalfCirclePainter(color: color, isLeft: isLeft),
      ),
    );
  }
}