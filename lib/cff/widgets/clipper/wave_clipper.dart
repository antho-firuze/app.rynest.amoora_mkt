import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(width / 5, height, width / 2.25, height - 50);
    path.quadraticBezierTo(
        width - (width / 3.24), height - 105, width, height - 25);
    path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
