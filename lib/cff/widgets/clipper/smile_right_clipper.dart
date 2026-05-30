import 'package:flutter/material.dart';

class SmileRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(width / 6, 0);
    path.quadraticBezierTo(width * 0.5, height, width, height * 0.75);
    path.lineTo(width, height * 0.75 - 30);
    path.quadraticBezierTo(width * 0.5, height - 15, width / 6 + 15, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
