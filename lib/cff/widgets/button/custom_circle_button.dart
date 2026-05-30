import 'package:amoora_mkt/cff/widgets/clipper/circle_clipper.dart';
import 'package:amoora_mkt/cff/widgets/spinning.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    required this.child,
    this.busy = false,
    this.tooltip,
    this.padding,
    this.size,
    this.onTap,
    this.decoration,
  });

  final bool busy;
  final String? tooltip;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final void Function()? onTap;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipPath(
        clipper: CircleClipper(),
        child: Material(
          color: Colors.transparent,
          child: Tooltip(
            message: tooltip ?? '',
            child: InkWell(
              onTap: busy ? null : onTap,
              child: Container(
                padding: padding,
                decoration: decoration,
                child: busy ? Spinning(child: child) : child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
