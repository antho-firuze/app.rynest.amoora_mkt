import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.tooltip,
    this.onTap,
    this.child,
    this.radius = 12,
    this.color,
    this.padding = EdgeInsets.zero,
    this.isCircle = false,
  });

  final String? tooltip;
  final void Function()? onTap;
  final Widget? child;
  final double radius;
  final Color? color;
  final bool isCircle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          isCircle ? BorderRadius.circular(35) : BorderRadius.circular(radius),
      child: Material(
        color: color ?? Colors.transparent,
        child: Tooltip(
          message: tooltip ?? '',
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
