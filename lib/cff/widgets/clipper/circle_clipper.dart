import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  CircleClipper({super.reclip});

  @override
  Path getClip(Size size) {
    final epicenter = Offset(size.width / 2, size.height / 2);

    return Path()
      ..addOval(Rect.fromCircle(center: epicenter, radius: epicenter.dy))
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
