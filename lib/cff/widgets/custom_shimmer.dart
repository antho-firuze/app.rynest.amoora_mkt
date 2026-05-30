import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width,
    this.height,
    this.radius = 0,
    this.child,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
