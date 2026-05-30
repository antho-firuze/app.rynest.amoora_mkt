import 'package:flutter/material.dart';

enum GradientType { radial, linear }

class GradientMask extends StatelessWidget {
  const GradientMask({
    super.key,
    this.colors,
    required this.child,
    this.gradientType,
    this.isIcon = false,
  });

  final GradientType? gradientType;
  final List<Color>? colors;
  final Widget child;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    GradientType defType = gradientType ?? GradientType.linear;
    List<Color> defColors = colors ?? [Colors.blue, Colors.red];
    Gradient gradient;

    switch (defType) {
      case GradientType.radial:
        gradient = RadialGradient(
          center: Alignment.center,
          tileMode: TileMode.mirror,
          radius: 0.5,
          colors: defColors,
        );
        break;
      case GradientType.linear:
        gradient = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: defColors,
        );
        break;
    }

    return ShaderMask(
      shaderCallback: (Rect bounds) => gradient.createShader(bounds),
      child: child,
    );
  }
}
