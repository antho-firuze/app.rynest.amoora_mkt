import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.color, this.width, this.height});

  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo-amoora.png', color: color, width: width, height: height);
  }
}
