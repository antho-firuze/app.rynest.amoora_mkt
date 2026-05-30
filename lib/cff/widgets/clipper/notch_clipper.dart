import 'package:flutter/material.dart';

class NotchClipper extends CustomClipper<Path> {
  NotchClipper({super.reclip, required this.holeRadius});

  final double holeRadius;

  @override
  Path getClip(Size size) {
    double left = (size.width - holeRadius) / 2;
    double right = size.width - left;

    return Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(left - 20, 0.0)
      ..quadraticBezierTo(left, 0.0, left, 20)
      ..arcToPoint(
        Offset(right, 20.0),
        clockwise: false,
        radius: const Radius.circular(4),
      )
      ..quadraticBezierTo(right, 0, right + 20, 0.0)
      ..lineTo(right + 20, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
