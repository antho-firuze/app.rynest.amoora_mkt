import 'package:flutter/material.dart';

class MountClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height)
    ..quadraticBezierTo(
      size.width * .5,
      size.height * .7,
      size.width,
      size.height,
    )
    ..lineTo(size.width, 0)
    ..close();

  // @override
  // Path getClip(Size size) {
  //   double height = size.height;
  //   double width = size.width;

  //   var path = Path();
  //   path.lineTo(0, height);
  //   path.quadraticBezierTo(width * 0.5, height * 0.7, width, height);
  //   path.lineTo(width, 0);
  //   path.close();
  //   return path;
  // }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
