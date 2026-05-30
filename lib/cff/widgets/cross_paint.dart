import 'package:flutter/material.dart';

class CrossPaint extends CustomPainter {
  final Color? color;

  CrossPaint({super.repaint, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint crossBrush = Paint()
      ..color = color ?? Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(const Offset(10, 10),
        Offset(size.width / 3, size.height / 3), crossBrush);
    canvas.drawLine(Offset(size.width / 3 * 2, size.height / 3 * 2),
        Offset(size.width - 10, size.height - 10), crossBrush);

    canvas.drawLine(Offset(size.width - 10, 10),
        Offset(size.width / 3 * 2, size.height / 3), crossBrush);
    canvas.drawLine(Offset(size.width / 3, size.height / 3 * 2),
        Offset(10, size.height - 10), crossBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
