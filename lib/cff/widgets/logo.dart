import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/custom_image.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width, this.height, this.color, this.onTap, this.src});

  final double? width;
  final double? height;
  final Color? color;
  final dynamic src;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: CustomImage(src: src, color: color),
      ),
    );
  }
}
