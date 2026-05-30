import 'package:amoora_mkt/cff/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({super.key, this.width, this.height = 12, this.radius = 4});

  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(width: width, height: height, radius: radius);
  }
}
